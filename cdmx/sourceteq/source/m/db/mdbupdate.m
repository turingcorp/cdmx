#import "mdbupdate.h"
#import <zql/zql.h>
#import "mdbconstants.h"

@implementation mdbupdate

+(void)pollutiondistricts:(NSArray<mdbdistrict*>*)districts daily:(NSArray<mdbpollutiondaily*>*)daily
{
    NSMutableArray<zqlquery*> *queries = [NSMutableArray array];
    
    zqlparam *pdistrictserverid = [zqlparam type:[zqltype integer] name:dbserverindex value:nil];
    zqlparam *pdistrictpollution = [zqlparam type:[zqltype integer] name:dbdistricts_pollution value:nil];
    zqlparam *pdistrictpollutantid = [zqlparam type:[zqltype integer] name:dbdistricts_pollutantid value:nil];
    NSArray<zqlparam*> *distparams = @[
                                       pdistrictpollution,
                                       pdistrictpollutantid
                                       ];
    
    NSUInteger countdistricts = districts.count;
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistricts; indexdistricts++)
    {
        mdbdistrict *dist = districts[indexdistricts];
        pdistrictserverid.value = dist.serverid;
        pdistrictpollution.value = dist.pollution;
        pdistrictpollutantid.value = dist.pollutantid;
        
        zqlquery *querydistrict = [zqlquery update:dbdistricts params:distparams where:pdistrictserverid];
        [queries addObject:querydistrict];
    }
    
    zqlparam *pdailydate = [zqlparam type:[zqltype integer] name:dbpollutiondaily_date value:nil];
    zqlparam *pdailypollution = [zqlparam type:[zqltype integer] name:dbpollutiondaily_maxpollution value:nil];
    NSArray<zqlparam*> *dailyparams = @[
                                       pdailydate,
                                       pdailypollution
                                       ];
    
    NSUInteger countdaily = daily.count;
    
    for(NSUInteger indexdaily = 0; indexdaily < countdaily; indexdaily++)
    {
        mdbpollutiondaily *day = daily[indexdaily];
        pdailydate.value = day.date;
        pdailypollution.value = day.pollution;
        
        zqlquery *querydaily = [zqlquery replace:dbpollutiondaily params:dailyparams];
        [queries addObject:querydaily];
    }
    
    [zql query:queries];
    
    NSLog(@"%@", queries);
}

@end