#import "mdb.h"
#import "mdbcreate.h"
#import "db.h"
#import "tools.h"
#import "updater.h"
#import "mdirs.h"

@implementation mdb

+(void)updatedb
{
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    NSDictionary *def = [tools defaultdict];
    
    NSString *dbfoldername = @"db";
    NSString *defdbname = def[@"dbname"];
    NSString *relative = [dbfoldername stringByAppendingPathComponent:defdbname];
    NSString *dbfolder = [documents stringByAppendingPathComponent:dbfoldername];
    [userdef setValue:relative forKey:@"dbname"];
    
    NSString *originaldb = [[NSBundle mainBundle] pathForResource:defdbname ofType:@""];
    dbname = [documents stringByAppendingPathComponent:relative];
    [mdirs createdir:[NSURL fileURLWithPath:dbfolder]];
    [mdirs copyfilefrom:originaldb to:dbname];
    
    [mdbcreate create];
}

+(mstations*)loadstations
{
    mstations *model = [[mstations alloc] init];
    NSString *query = [NSString stringWithFormat:
                       @"SELECT id, stationid, latitude, longitude, "
                       "altitude, shortname, name, message "
                       "FROM station "
                       "ORDER BY name ASC;"];
    NSArray *rawstations = [db rows:query];
    NSUInteger count = rawstations.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawstation = rawstations[i];
        NSInteger rawid = [rawstation[@"id"] integerValue];
        NSString *rawstationid = rawstation[@"stationid"];
        NSInteger rawlatitude = [rawstation[@"latitude"] integerValue];
        NSInteger rawlongitude = [rawstation[@"longitude"] integerValue];
        NSInteger rawaltitude = [rawstation[@"altitude"] integerValue];
        NSString *rawshortname = rawstation[@"shortname"];
        NSString *rawname = rawstation[@"name"];
        NSString *rawmessage = rawstation[@"message"];
    }
    
    return model;
}

@end