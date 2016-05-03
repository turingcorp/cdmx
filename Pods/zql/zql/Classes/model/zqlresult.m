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

+(instancetype)error:(NSInteger)errornumber
{
    NSString *errordescr;
    
    switch(errornumber)
    {
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
    
    zqlresulterror *error = [[zqlresulterror alloc] init:errordescr];
    
    return error;
}

@end