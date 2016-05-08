#import "zql.h"
#import "zqlconnection.h"
#import "zqlqueryprocessor.h"

@interface zql ()

@property(strong, nonatomic)zqlconnection *connection;
@property(strong, nonatomic)zqlqueryprocessor *queryprocessor;
@property(assign, nonatomic)sqlite3 *sqlite;

@end

@implementation zql

+(zqlresult*)query:(zqlquery*)query
{
    zqlresult *result;
    
    if([zqlconfig shared].dbname)
    {
        zql *manager = [[zql alloc] init:query];
        result = [manager connect];
        
        if(result.success)
        {
            result = [manager prepare];
            
            if(result.success)
            {
                result = [manager step];
                
                if(result.success)
                {
                    result = [manager finalizestatement];
                    
                    if(result.success)
                    {
                        [manager lastinsert:result];
                    }
                }
            }
            
            [manager disconnect];
        }
        else
        {
            [manager disconnect];
        }
    }
    else
    {
        result = [zqlresult errornodb];
    }
    
    return result;
}

-(instancetype)init:(zqlquery*)query
{
    self = [super init];
    
    self.connection = [[zqlconnection alloc] init];
    self.queryprocessor = [[zqlqueryprocessor alloc] init:query];
    
    return self;
}

#pragma mark functionality

-(zqlresult*)connect
{
    NSInteger resultnumber = [self.connection connect:&_sqlite];
    
    return [zqlresult sqlresponse:resultnumber];
}

-(zqlresult*)disconnect
{
    NSInteger resultnumber = [self.connection close:&_sqlite];
    
    return [zqlresult sqlresponse:resultnumber];
}

-(zqlresult*)prepare
{
    return [self.queryprocessor prepare:self.sqlite];
}

-(zqlresult*)step
{
    return [self.queryprocessor step];
}

-(zqlresult*)finalizestatement
{
    return [self.queryprocessor finalizestatement];
}

-(void)lastinsert:(zqlresult*)result
{
    [self.queryprocessor lastinsert:self.sqlite result:result];
}

@end