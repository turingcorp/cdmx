#import "zqlquery.h"
#import "zqlpk.h"

static NSString* const zqlquerycreatetitle =            @"create table %@ ";
static NSString* const zqlquerycreateparamsprefix =     @"(";
static NSString* const zqlquerycreateparamsseparator =     @", ";
static NSString* const zqlquerycreateparamspostfix =    @");";

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
    
    if(tablename && tablename.length && params)
    {
        zqlpk *primarykey = [zqlpk primarykey];
        
        NSMutableString *string = [NSMutableString string];
        [string appendFormat:zqlquerycreatetitle, tablename];
        [string appendString:zqlquerycreateparamsprefix];
        
        NSUInteger count = params.count;
        
        for(NSUInteger indexparam = 0; indexparam < count; indexparam++)
        {
            zqlparam *param = params[indexparam];
            
            if(indexparam)
            {
                [string appendString:zqlquerycreateparamsseparator];
            }
            
            if(![param.comparename isEqualToString:primarykey.name])
            {
                [string appendString:[param querycreate]];
            }
        }
        
        if(count)
        {
            [string appendString:zqlquerycreateparamsseparator];
        }
        
        [string appendString:[primarykey querycreate]];
        [string appendString:zqlquerycreateparamspostfix];
        
        query = [[zqlquery alloc] init:string];
    }
    
    return query;
}

-(instancetype)init:(NSString*)querystring
{
    self = [super init];
    self.querystring = querystring;
    
    return self;
}

@end