#import "zqlresult.h"
#import "zqlresulterror.h"
#import "sqlite3.h"
#import "zqlresultsuccess.h"

static NSString* const zqlerrorunknown =                @"Unknown error";
static NSString* const zqlerrornodb =                   @"No database initialized";
static NSString* const zqlerrorerror =                  @"SQL error or missing database";
static NSString* const zqlerrorinternal =               @"Internal logic error in SQLite";
static NSString* const zqlerrorpermission =             @"Access permission denied";

@interface zqlresulterror ()

-(instancetype)init:(NSString*)errordescr;

@end

@implementation zqlresult

+(instancetype)errornodb
{
    zqlresulterror *error = [[zqlresulterror alloc] init:zqlerrornodb];
    
    return error;
}

+(instancetype)sqlresponse:(NSInteger)responsenumber
{
    NSString *errordescr;
    
    switch(responsenumber)
    {
        case SQLITE_OK:
            break;
            
        case SQLITE_ERROR:
            
            errordescr = zqlerrorerror;
            
            break;
            
        case SQLITE_INTERNAL:
            
            errordescr = zqlerrorinternal;
            
            break;
            
        case SQLITE_PERM:
            
            errordescr = zqlerrorpermission;
            
            break;
            
        default:
            
            errordescr = zqlerrorunknown;
            
            break;
    }
    
    zqlresult *result;
    
    if(errordescr)
    {
        result = [[zqlresulterror alloc] init:errordescr];
    }
    else
    {
        result = [[zqlresultsuccess alloc] init];
    }
    
    return result;
}

-(instancetype)init
{
    self = [super init];
    self.success = NO;
    
    return self;
}

@end