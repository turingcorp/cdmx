#import "mdbcreate.h"
#import <zql/zql.h>
#import "mdbconstants.h"

@implementation mdbcreate

+(void)firsttime
{
    [[zqlconfig shared] createdb:databasename];
    NSMutableArray<zqlparam*> *params = [NSMutableArray array];
    [params addObject:[zqlparam type:[zqltype integer] name:@"created" value:nil]];
    [params addObject:[zqlparam type:[zqltype text] name:@"name" value:nil]];
    //    zqlquery *query = [zqlquery createtable:@"changui2" params:params];
    //    zqlquery *query = [zqlquery insert:@"changui2" params:params];
    
    zqlquery *query = [zqlquery select:@"changui2" params:params ordered:nil ascendent:NO];
    zqlresult *result = [zql query:query];
    
    if(result.success)
    {
        NSLog(@"success");
        NSLog(@"%@", result);
    }
    else
    {
        NSLog(@"error %@", result);
    }
}

+(void)loaddatabase
{
    [[zqlconfig shared] startdb:databasename];
}

#pragma mark private

+(void)createdistricts
{
    NSMutableArray<zqlparam*> *params = [NSMutableArray array];
    
    zqlparam *paramserverid = [zqlparam type:[zqltype integer] name:dbserverindex value:nil];
    zqlparam *paramname = [zqlparam type:[zqltype text] name:dbdistricts_name value:nil];
    
    [params addObject:paramserverid];
    [params addObject:paramname];
    
    zqlquery *querytable = [zqlquery createtable:dbdistricts params:params];
    
    paramserverid.value = @1;
    paramname.value = districtalvaroobregon;
    zqlquery *queryalvaroobregon = [zqlquery insert:dbdistricts params:params];
    
    paramserverid.value = @2;
    paramname.value = districtazcapotzalco;
    zqlquery *queryazcapotzalco = [zqlquery insert:dbdistricts params:params];
    
    paramserverid.value = @3;
    paramname.value = districtbenitojuarez;
    zqlquery *querybenitojuarez = [zqlquery insert:dbdistricts params:params];
    
    paramserverid.value = @4;
    paramname.value = districtcoyoacan;
    zqlquery *querycoyoacan = [zqlquery insert:dbdistricts params:params];
    
    paramserverid.value = @5;
    paramname.value = districtcuajimalpa;
    zqlquery *querycuajimalpa = [zqlquery insert:dbdistricts params:params];
    
    paramserverid.value = @6;
    paramname.value = districtcuauhtemoc;
    zqlquery *querycu = [zqlquery insert:dbdistricts params:params];
    
    NSArray<zqlquery*> *queries = @[
                                    querytable,
                                    ];
}

@end