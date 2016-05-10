#import "mdbcreate.h"
#import <zql/zql.h>
#import "mdbconstants.h"

@implementation mdbcreate

+(void)firsttime
{
    [[zqlconfig shared] createdb:databasename];
    
    [mdbcreate create];
}

+(void)loaddatabase
{
    [[zqlconfig shared] startdb:databasename];
}

#pragma mark private

+(void)create
{
    NSArray *rawdistricts = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"districts" withExtension:@"plist"]];
    NSMutableArray<zqlquery*> *queries = [NSMutableArray array];
    
    zqlparam *paramserverid = [zqlparam type:[zqltype integer] name:dbserverindex value:nil];
    zqlparam *paramname = [zqlparam type:[zqltype text] name:dbdistricts_name value:nil];
    zqlparam *parampollution = [zqlparam type:[zqltype integer] name:dbdistricts_pollution value:@0];
    zqlparam *paramasset = [zqlparam type:[zqltype text] name:dbdistricts_asset value:@0];
    zqlparam *paramx = [zqlparam type:[zqltype integer] name:dbdistricts_x value:@0];
    zqlparam *paramy = [zqlparam type:[zqltype integer] name:dbdistricts_y value:@0];
    zqlparam *paramwidth = [zqlparam type:[zqltype integer] name:dbdistricts_width value:@0];
    zqlparam *paramheight = [zqlparam type:[zqltype integer] name:dbdistricts_height value:@0];
    
    NSArray<zqlparam*> *params = @[
                                   paramserverid,
                                   paramname,
                                   parampollution,
                                   paramasset,
                                   paramx,
                                   paramy,
                                   paramwidth,
                                   paramheight
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
        
        paramserverid.value = districtserverid;
        paramname.value = districtname;
        paramasset.value = districtasset;
        paramx.value = districtx;
        paramy.value = districty;
        paramwidth.value = districtwidth;
        paramheight.value = districtheight;
        zqlquery *newquery = [zqlquery insert:dbdistricts params:params];
        [queries addObject:newquery];
    }
    
    zqlparam *paramdate = [zqlparam type:[zqltype integer] name:dbpollutiondaily_date value:nil];
    zqlparam *paramcreated = [zqlparam type:[zqltype integer] name:dbcreated value:nil];
    zqlparam *parammaxpollution = [zqlparam type:[zqltype integer] name:dbpollutiondaily_maxpollution value:nil];
    
    params = @[
               paramdate,
               paramcreated,
               parammaxpollution
               ];
    
    zqlquery *querytablepollutiondaily = [zqlquery createtable:dbpollutiondaily params:params];
    [queries addObject:querytablepollutiondaily];
    [zql query:queries];
}

@end