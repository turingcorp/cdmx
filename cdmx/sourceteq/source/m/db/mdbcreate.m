#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = [NSString stringWithFormat:
             @"CREATE TABLE station "
             "(id INTEGER PRIMARY KEY, stationid INTEGER, latitude INTEGER, longitude INTEGER, altitude INTEGER, shortname TEXT COLLATE NOCASE, name TEXT COLLATE NOCASE, message TEXT);"];
    [dbcon query:query];
    
    [mdbcreate loadstations:dbcon];
    
    [dbcon commit];
    
    NSLog(@"%@", [db rows:@"select * from station"]);
}

+(void)loadstations:(db*)dbcon
{
    NSString *raw = [NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"stations" withExtension:@"csv"] encoding:NSUTF8StringEncoding error:nil];
    NSArray *rawlines = [raw componentsSeparatedByString:@"\n"];
    NSUInteger countlines = rawlines.count;
    
    for(NSUInteger i = 2; i < countlines; i++)
    {
        NSString *rawline = rawlines[i];
        NSArray *rawrows = [rawline componentsSeparatedByString:@","];
        NSUInteger countrows = rawrows.count;
        
        NSAssert(countrows == 7, @"Cannot load stations from csv file", raw);
        
        NSUInteger rawstationid = [rawrows[6] integerValue];
        double rawlatitude = [rawrows[3] doubleValue];
        double rawlongitude = [rawrows[2] doubleValue];
        NSUInteger rawaltitude = [rawrows[4] integerValue];
        NSString *rawshortname = rawrows[0];
        NSString *rawname = rawrows[1];
        NSString *rawmessage = rawrows[5];
        NSUInteger storinglatitude = rawlatitude * coordinatesmult;
        NSUInteger storinglongitude = rawlongitude * coordinatesmult;
        
        NSMutableString *query = [NSMutableString string];
        [query appendString:@"INSERT INTO station "];
        [query appendString:@"(stationid, latitude, longitude, altitude, shortname, name, message) "];
        [query appendString:@"values("];
        [query appendFormat:@"%@, ", @(rawstationid)];
        [query appendFormat:@"%@, ", @(storinglatitude)];
        [query appendFormat:@"%@, ", @(storinglongitude)];
        [query appendFormat:@"%@, ", @(rawaltitude)];
        [query appendFormat:@"\"%@\", ", rawshortname];
        [query appendFormat:@"\"%@\", ", rawname];
        [query appendFormat:@"\"%@\"", rawmessage];
        [query appendString:@");"];
        
        [dbcon query:query];
    }
}

@end