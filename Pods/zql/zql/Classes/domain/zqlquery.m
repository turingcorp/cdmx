#import "zqlquery.h"
#import "zqlpk.h"
#import "zqltypetext.h"

static NSString* const zqlquerycreatetitle =                    @"create table %@ ";
static NSString* const zqlqueryinserttitle =                    @"insert into %@ ";
static NSString* const zqlqueryupdatetitle =                    @"update %@ ";
static NSString* const zqlqueryselecttitle =                    @"select ";
static NSString* const zqlqueryselectall =                      @"*";
static NSString* const zqlqueryselecttable =                    @" from %@";
static NSString* const zqlqueryselectordered =                  @" order by %@ ";
static NSString* const zqlqueryselectorderascending =           @"asc";
static NSString* const zqlqueryselectorderdescending =          @"desc";
static NSString* const zqlqueryedit =                           @"set ";
static NSString* const zqlquerywhere =                          @" where ";
static NSString* const zqlqueryequals =                         @"%@=%@";
static NSString* const zqlqueryvaluestitle =                    @" values";
static NSString* const zqlqueryparamsprefix =                   @"(";
static NSString* const zqlqueryparamsseparator =                @", ";
static NSString* const zqlqueryparamspostfix =                  @")";
static NSString* const zqlqueryclosure =                        @";";
static NSString* const zqlquerytransactionbegin =               @"BEGIN";
static NSString* const zqlquerytransactioncommit =              @"COMMIT";
static NSString* const zqlquerytransactionrollback =            @"ROLLBACK";

@interface zqlparam ()

@property(copy, nonatomic)NSString *comparename;

@end

@interface zqlquery ()

@property(copy, nonatomic)NSString *querystring;

@end

@implementation zqlquery

+(instancetype)createtable:(NSString*)tablename params:(NSArray<zqlparam*>*)params
{
    zqlquery *query;
    
    if([zqlquery tablenamevalid:tablename] && params)
    {
        zqlpk *primarykey = [zqlpk primarykey];
        
        NSMutableString *string = [NSMutableString string];
        [string appendFormat:zqlquerycreatetitle, tablename];
        [string appendString:zqlqueryparamsprefix];
        [string appendString:[primarykey querycreate]];
        
        NSUInteger count = params.count;
        
        for(NSUInteger indexparam = 0; indexparam < count; indexparam++)
        {
            zqlparam *param = params[indexparam];
            [string appendString:zqlqueryparamsseparator];
            
            if(![param.comparename isEqualToString:primarykey.name])
            {
                [string appendString:[param querycreate]];
            }
        }
        
        [string appendString:zqlqueryparamspostfix];
        [string appendString:zqlqueryclosure];
        
        query = [[zqlquery alloc] init:string];
    }
    
    return query;
}

+(instancetype)insert:(NSString*)tablename params:(NSArray<zqlparam*>*)params
{
    zqlquery *query;
    
    if([zqlquery tablenamevalid:tablename] && params)
    {
        NSMutableString *string = [NSMutableString string];
        NSMutableString *stringvalues = [NSMutableString string];
        [string appendFormat:zqlqueryinserttitle, tablename];
        [string appendString:zqlqueryparamsprefix];
        [stringvalues appendString:zqlqueryvaluestitle];
        [stringvalues appendString:zqlqueryparamsprefix];
        
        NSUInteger count = params.count;
        
        for(NSUInteger indexparam = 0; indexparam < count; indexparam++)
        {
            zqlparam *param = params[indexparam];
            
            if(indexparam)
            {
                [string appendString:zqlqueryparamsseparator];
                [stringvalues appendString:zqlqueryparamsseparator];
            }
            
            [string appendString:param.name];
            [stringvalues appendString:[param queryvalue]];
        }
        
        [string appendString:zqlqueryparamspostfix];
        [stringvalues appendString:zqlqueryparamspostfix];
        [string appendString:stringvalues];
        [string appendString:zqlqueryclosure];
        
        query = [[zqlquery alloc] init:string];
    }
    
    return query;
}

+(instancetype)update:(NSString*)tablename params:(NSArray<zqlparam*>*)params where:(zqlparam*)where
{
    zqlquery *query;
    
    if([zqlquery tablenamevalid:tablename] && params)
    {
        NSMutableString *string = [NSMutableString string];
        [string appendFormat:zqlqueryupdatetitle, tablename];
        [string appendString:zqlqueryedit];
        
        NSUInteger count = params.count;
        
        for(NSUInteger indexparam = 0; indexparam < count; indexparam++)
        {
            zqlparam *param = params[indexparam];
            
            if(indexparam)
            {
                [string appendString:zqlqueryparamsseparator];
            }
            
            [string appendFormat:zqlqueryequals, param.name, param.value];
        }
        
        [string appendString:zqlquerywhere];
        [string appendFormat:zqlqueryequals, where.name, where.value];
        [string appendString:zqlqueryclosure];
        
        query = [[zqlquery alloc] init:string];
    }
    
    return query;
}

+(instancetype)select:(NSString*)tablename params:(NSArray<zqlparam*>*)params ordered:(zqlparam*)ordered ascendent:(BOOL)ascendent
{
    zqlquery *query;
    
    if([zqlquery tablenamevalid:tablename])
    {
        NSMutableString *string = [NSMutableString string];
        [string appendString:zqlqueryselecttitle];
        
        NSInteger count = params.count;
        
        if(count)
        {
            for(NSUInteger indexparam = 0; indexparam < count; indexparam++)
            {
                zqlparam *param = params[indexparam];
                
                if(indexparam)
                {
                    [string appendString:zqlqueryparamsseparator];
                }
                
                [string appendString:param.name];
            }
        }
        else
        {
            [string appendString:zqlqueryselectall];
        }
        
        [string appendFormat:zqlqueryselecttable, tablename];
        
        if(ordered)
        {
            [string appendFormat:zqlqueryselectordered, ordered.name];
            
            if(ascendent)
            {
                [string appendString:zqlqueryselectorderascending];
            }
            else
            {
                [string appendString:zqlqueryselectorderdescending];
            }
        }
        
        [string appendString:zqlqueryclosure];
        
        query = [[zqlquery alloc] init:string];
    }
    
    return query;
}

+(instancetype)begintransaction
{
    zqlquery *query = [[zqlquery alloc] init:zqlquerytransactionbegin];
    
    return query;
}

+(instancetype)committransaction
{
    zqlquery *query = [[zqlquery alloc] init:zqlquerytransactioncommit];
    
    return query;
}

+(instancetype)rollbacktransaction
{
    zqlquery *query = [[zqlquery alloc] init:zqlquerytransactionrollback];
    
    return query;
}

#pragma mark private

+(BOOL)tablenamevalid:(NSString*)tablename
{
    return tablename && tablename.length;
}

-(instancetype)init:(NSString*)querystring
{
    self = [super init];
    self.querystring = querystring;
    
    return self;
}

-(NSString*)description
{
    return self.querystring;
}

@end