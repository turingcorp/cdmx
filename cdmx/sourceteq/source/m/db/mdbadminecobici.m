#import "mdbadminecobici.h"
#import "mdbconstants.h"
#import <zql/zql.h>

static NSString *const ecobicidbname = @"ecobici.zql";

@implementation mdbadminecobici

+(NSURL*)createecobicidb:(madminecobici*)model
{
    NSString *dbname = [NSTemporaryDirectory() stringByAppendingPathComponent:ecobicidbname];
    NSURL *dburl = [NSURL fileURLWithPath:dbname];
    
    NSMutableArray<zqlquery*> *queries = [NSMutableArray array];
    
    zqlparam *paramstationid = [zqlparam type:[zqltype integer] name:dbstations_stationid value:nil];
    zqlparam *paramname = [zqlparam type:[zqltype text] name:dbstations_name value:nil];
    zqlparam *paramlatitude = [zqlparam type:[zqltype integer] name:dbstations_latitude value:nil];
    zqlparam *paramlongitude = [zqlparam type:[zqltype integer] name:dbstations_longitude value:nil];
    
    NSArray<zqlparam*> *params = @[
                                   paramstationid,
                                   paramname,
                                   paramlatitude,
                                   paramlongitude
                                   ];
    
    zqlquery *querytablestations = [zqlquery createtable:dbstations params:params];
    [queries addObject:querytablestations];
    
    NSUInteger countstations = model.stations.count;
    
    for(NSUInteger indexstation = 0; indexstation < countstations; indexstation++)
    {
        madminecobicistation *station = model.stations[indexstation];
        paramstationid.value = station.stationid;
        paramname.value = station.name;
        paramlatitude.value = station.latitude;
        paramlongitude.value = station.longitude;
        
        zqlquery *insertquery = [zqlquery insert:dbstations params:params];
        [queries addObject:insertquery];
    }
    
    zqlresult *result = [zql query:queries db:dbname];
    
    NSLog(@"%@", result);
    
    return dburl;
}

@end