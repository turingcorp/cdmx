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
    
    NSArray<zqlparam*> *params = @[
                                   paramserverid,
                                   paramname,
                                   parampollution
                                   ];
    
    zqlquery *querytabledistricts = [zqlquery createtable:dbdistricts params:params];
    [queries addObject:querytabledistricts];
    
    NSUInteger countdistricts = rawdistricts.count;
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistricts; indexdistricts++)
    {
        NSDictionary *rawdistrict = rawdistricts[indexdistricts];
        NSString *districname = rawdistrict[dbdistricts_name];
        NSNumber *districserverid = rawdistrict[dbserverindex];
        
        paramserverid.value = districserverid;
        paramname.value = districname;
        zqlquery *newquery = [zqlquery insert:dbdistricts params:params];
        
        [queries addObject:newquery];
    }
    
    zqlparam *paramdate = [zqlparam type:[zqltype integer] name:dbpollutiondaily_date value:nil];
    zqlparam *paramcreated = [zqlparam type:[zqltype integer] name:dbpollutiondaily_created value:nil];
    zqlparam *parammaxpollution = [zqlparam type:[zqltype integer] name:dbpollutiondaily_maxpollution value:nil];
    
    params = @[
               paramdate,
               paramcreated,
               parammaxpollution
               ];
    
    zqlquery *querytablepollutiondaily = [zqlquery createtable:dbdistricts params:params];
    [queries addObject:querytablepollutiondaily];
    
    [zql query:queries];
}

@end