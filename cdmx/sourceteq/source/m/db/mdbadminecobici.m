#import "mdbadminecobici.h"
#import <zql/zql.h>

@implementation mdbadminecobici

+(void)createecobicidb
{
    NSArray *rawdistricts = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"districts" withExtension:@"plist"]];
    NSMutableArray<zqlquery*> *queries = [NSMutableArray array];
    
    zqlparam *paramserverid = [zqlparam type:[zqltype integer] name:dbserverindex value:nil];
    zqlparam *paramname = [zqlparam type:[zqltype text] name:dbdistricts_name value:nil];
    zqlparam *parampollution = [zqlparam type:[zqltype integer] name:dbdistricts_pollution value:nil];
    zqlparam *parampollutantid = [zqlparam type:[zqltype integer] name:dbdistricts_pollutantid value:nil];
    zqlparam *paramasset = [zqlparam type:[zqltype text] name:dbdistricts_asset value:nil];
    zqlparam *paramx = [zqlparam type:[zqltype integer] name:dbdistricts_x value:nil];
    zqlparam *paramy = [zqlparam type:[zqltype integer] name:dbdistricts_y value:nil];
    zqlparam *paramwidth = [zqlparam type:[zqltype integer] name:dbdistricts_width value:nil];
    zqlparam *paramheight = [zqlparam type:[zqltype integer] name:dbdistricts_height value:nil];
    zqlparam *paramlatitude = [zqlparam type:[zqltype integer] name:dbdistricts_latitude value:nil];
    zqlparam *paramlongitude = [zqlparam type:[zqltype integer] name:dbdistricts_longitude value:nil];
    
    NSArray<zqlparam*> *params = @[
                                   paramserverid,
                                   paramname,
                                   parampollution,
                                   parampollutantid,
                                   paramasset,
                                   paramx,
                                   paramy,
                                   paramwidth,
                                   paramheight,
                                   paramlatitude,
                                   paramlongitude
                                   ];
    
    zqlquery *querytabledistricts = [zqlquery createtable:dbdistricts params:params];
    [queries addObject:querytabledistricts];
    
    NSUInteger countdistricts = rawdistricts.count;
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistricts; indexdistricts++)
    {
        NSDictionary *rawdistrict = rawdistricts[indexdistricts];
        NSString *districtname = rawdistrict[dbdistricts_name];
        NSString *districtasset = rawdistrict[dbdistricts_asset];
        NSNumber *districtserverid = rawdistrict[dbserverindex];
        NSNumber *districtx = rawdistrict[dbdistricts_x];
        NSNumber *districty = rawdistrict[dbdistricts_y];
        NSNumber *districtwidth = rawdistrict[dbdistricts_width];
        NSNumber *districtheight = rawdistrict[dbdistricts_height];
        NSNumber *districtlatitude = rawdistrict[dbdistricts_latitude];
        NSNumber *districtlongitude = rawdistrict[dbdistricts_longitude];
        NSNumber *uselatitude = @(districtlatitude.floatValue * dbintegermultiply);
        NSNumber *uselongitude = @(districtlongitude.floatValue * dbintegermultiply);
        
        paramserverid.value = districtserverid;
        paramname.value = districtname;
        paramasset.value = districtasset;
        paramx.value = districtx;
        paramy.value = districty;
        paramwidth.value = districtwidth;
        paramheight.value = districtheight;
        paramlatitude.value = uselatitude;
        paramlongitude.value = uselongitude;
        zqlquery *newquery = [zqlquery insert:dbdistricts params:params];
        [queries addObject:newquery];
    }
    
    zqlparam *paramdate = [zqlparam type:[zqltype integer] name:dbpollutiondaily_date value:nil];
    zqlparam *parammaxpollution = [zqlparam type:[zqltype integer] name:dbpollutiondaily_maxpollution value:nil];
    paramdate.unique = YES;
    
    params = @[
               paramdate,
               parammaxpollution
               ];
    
    zqlquery *querytablepollutiondaily = [zqlquery createtable:dbpollutiondaily params:params];
    [queries addObject:querytablepollutiondaily];
    [zql query:queries];
}

@end