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
    
    NSArray<zqlparam*> *params = @[
                                   paramserverid,
                                   paramname,
                                   parampollution,
                                   paramasset
                                   ];
    
    zqlquery *querytabledistricts = [zqlquery createtable:dbdistricts params:params];
    [queries addObject:querytabledistricts];
    
    NSUInteger countdistricts = rawdistricts.count;
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistricts; indexdistricts++)
    {
        NSDictionary *rawdistrict = rawdistricts[indexdistricts];
        NSString *districname = rawdistrict[dbdistricts_name];
        NSString *districasset = rawdistrict[dbdistricts_asset];
        NSNumber *districserverid = rawdistrict[dbserverindex];
        
        paramserverid.value = districserverid;
        paramname.value = districname;
        paramasset.value = districasset;
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