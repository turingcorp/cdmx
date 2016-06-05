#import "zql.h"
#import "zqlconnection.h"
#import "zqlqueryprocessor.h"

@interface zql ()

@property(strong, nonatomic)zqlconnection *connection;
@property(strong, nonatomic)zqlqueryprocessor *queryprocessor;
@property(strong, nonatomic)zqlresult *result;
@property(assign, nonatomic)sqlite3 *sqlite;

@end

@implementation zql

+(nonnull zqlresult*)query:(nonnull NSArray<zqlquery*>*)querylist db:(nullable NSString*)dbpath
{
    zqlresult *result;
    NSString *dbname = dbpath;
    
    if(!dbname)
    {
        dbname = [zqlconfig shared].dbname;
    }
    
    if(dbname)
    {
        zql *manager = [[zql alloc] init];
        [manager connect:dbname];
        
        if(manager.result.success)
        {
            NSMutableArray<zqlquery*> *queries = querylist.mutableCopy;
            NSUInteger countqueries = queries.count;
            zqlquery *queryrollback;
            
            if(countqueries > 1)
            {
                zqlquery *querybegin = [zqlquery begintransaction];
                zqlquery *querycommit = [zqlquery committransaction];
                queryrollback = [zqlquery rollbacktransaction];
                
                [queries insertObject:querybegin atIndex:0];
                [queries addObject:querycommit];
                
                countqueries = queries.count;
            }
            
            for(NSUInteger indexquery = 0; indexquery < countqueries; indexquery++)
            {
                zqlquery *query = queries[indexquery];
                [manager prepare:query];
                
                if(manager.result.success)
                {
                    [manager step];
                    
                    if(manager.result.success)
                    {
                        [manager finalizestatement];
                        
                        if(manager.result.success)
                        {
                            [manager lastinsert];
                        }
                        else
                        {
                            if(queryrollback)
                            {
                                [zql exec:manager query:query];
                            }
                            
                            break;
                        }
                    }
                    else
                    {
                        if(queryrollback)
                        {
                            [zql exec:manager query:query];
                        }
                        
                        break;
                    }
                }
                else
                {
                    if(queryrollback)
                    {
                        [zql exec:manager query:query];
                    }
                    
                    break;
                }
            }
            
            [manager disconnect];
        }
        else
        {
            [manager disconnect];
        }
        
        result = manager.result;
    }
    else
    {
        result = [zqlresult errornodb];
    }
    
    return result;
}

#pragma mark private

+(void)exec:(zql*)manager query:(zqlquery*)query
{
    [manager prepare:query];
    
    if(manager.result.success)
    {
        [manager step];
        
        if(manager.result.success)
        {
            [manager finalizestatement];
            [manager lastinsert];
        }
    }
}

-(instancetype)init
{
    self = [super init];
    
    self.connection = [[zqlconnection alloc] init];
    
    return self;
}

#pragma mark functionality

-(void)connect:(NSString*)dbname
{
    NSInteger resultnumber = [self.connection connect:&_sqlite dbname:dbname];
    
    self.result = [zqlresult sqlresponse:resultnumber];
}

-(zqlresult*)disconnect
{
    NSInteger resultnumber = [self.connection close:&_sqlite];
    
    return [zqlresult sqlresponse:resultnumber];
}

-(void)prepare:(zqlquery*)query
{
    self.queryprocessor = [[zqlqueryprocessor alloc] init:query];
    zqlresult *newresult = [self.queryprocessor prepare:self.sqlite];
    self.result = [self.result merge:newresult];
}

-(void)step
{
    zqlresult *newresult = [self.queryprocessor step];
    self.result = [self.result merge:newresult];
}

-(void)finalizestatement
{
    zqlresult *newresult = [self.queryprocessor finalizestatement];
    self.result = [self.result merge:newresult];
}

-(void)lastinsert
{
    zqlresult *newresult = [self.queryprocessor lastinsert:self.sqlite];
    self.result = [self.result merge:newresult];
}

@end