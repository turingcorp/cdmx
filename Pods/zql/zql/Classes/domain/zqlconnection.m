#import "zqlconnection.h"
#import "zqlconfig.h"

static NSInteger const zqlconnectiontype = SQLITE_OPEN_SHAREDCACHE | SQLITE_OPEN_READWRITE;

@implementation zqlconnection

-(NSInteger)connect:(sqlite3**)sqlite
{
    NSString *dbname = [zqlconfig shared].dbname;
    NSInteger result = sqlite3_open_v2(dbname.UTF8String, sqlite, zqlconnectiontype, nil);
    
    return result;
}

-(NSInteger)close:(sqlite3**)sqlite
{
    NSInteger result = sqlite3_close(*sqlite);
    
    return result;
}

@end