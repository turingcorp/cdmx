#import "mdbadminecobici.h"
#import "mdbconstants.h"
#import <zql/zql.h>

static NSString *const ecobicidbname = @"ecobici.zql";

@implementation mdbadminecobici

+(NSURL*)createecobicidb:(NSArray<mdbecobicistation*>*)model
{
    NSString *dbname = [NSTemporaryDirectory() stringByAppendingPathComponent:ecobicidbname];
    NSURL *dburl = [NSURL fileURLWithPath:dbname];
    
    NSMutableArray<zqlquery*> *queries = [NSMutableArray array];
    
    zqlparam *paramstationid = [zqlparam type:[zqltype integer] name:dbecobicistations_stationid value:nil];
    zqlparam *paramname = [zqlparam type:[zqltype text] name:dbecobicistations_name value:nil];
    zqlparam *paramlatitude = [zqlparam type:[zqltype integer] name:dbecobicistations_latitude value:nil];
    zqlparam *paramlongitude = [zqlparam type:[zqltype integer] name:dbecobicistations_longitude value:nil];
    paramstationid.unique = YES;
    
    NSArray<zqlparam*> *params = @[
                                   paramstationid,
                                   paramname,
                                   paramlatitude,
                                   paramlongitude
                                   ];
    
    zqlquery *querytablestations = [zqlquery createtable:dbecobicistations params:params];
    [queries addObject:querytablestations];
    
    NSUInteger countstations = model.stations.count;
    
    for(NSUInteger indexstation = 0; indexstation < countstations; indexstation++)
    {
        madminecobicistation *station = model.stations[indexstation];
        NSNumber *usablelatitude = @(station.latitude.floatValue * dbintegermultiply);
        NSNumber *usablelongitude = @(station.longitude.floatValue * dbintegermultiply);
        paramstationid.value = station.stationid;
        paramname.value = station.name;
        paramlatitude.value = usablelatitude;
        paramlongitude.value = usablelongitude;
        
        zqlquery *insertquery = [zqlquery insert:dbecobicistations params:params];
        [queries addObject:insertquery];
    }
    
    [[zqlconfig shared] createabsolutepathdb:dbname];
    [zql query:queries db:dbname];
    
    return dburl;
}

@end