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
}

+(void)loadstations:(db*)dbcon
{
    NSString *query;
    NSString *raw = [NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"stations" withExtension:@"csv"] encoding:NSUTF8StringEncoding error:nil];
    NSArray *rawlines = [raw componentsSeparatedByString:@"\n"];
    NSUInteger countlines = rawlines.count;
    
    for(NSUInteger i = 2; i < countlines; i++)
    {
        NSString *rawline = rawlines[i];
        NSArray *rawrows = [rawline componentsSeparatedByString:@","];
        NSUInteger countrows = rawrows.count;
        
        NSAssert(countrows == 7, @"Cannot load stations from csv file", raw);
        
        NSUInteger rawstationid = [rawrows[0] unsignedIntegerValue];
        double rawlatitude = [rawrows[3] doubleValue];
        double rawlongitude = [rawrows[2] doubleValue];
        
    }
}

@end