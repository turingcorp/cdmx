#import "mdbcreate.h"
#import <zql/zql.h>
#import "mdbconstants.h"

@implementation mdbcreate

+(void)firsttime
{
    [[zqlconfig shared] createdb:databasename];
    
    [mdbcreate createdistricts];
}

+(void)loaddatabase
{
    [[zqlconfig shared] startdb:databasename];
}

#pragma mark private

+(void)createdistricts
{
    NSArray *rawdistricts = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"districts" withExtension:@"plist"]];
    NSMutableArray<zqlparam*> *params = [NSMutableArray array];
    NSMutableArray<zqlquery*> *queries = [NSMutableArray array];
    
    zqlparam *paramserverid = [zqlparam type:[zqltype integer] name:dbserverindex value:nil];
    zqlparam *paramname = [zqlparam type:[zqltype text] name:dbdistricts_name value:nil];
    
    [params addObject:paramserverid];
    [params addObject:paramname];
    
    zqlquery *querytable = [zqlquery createtable:dbdistricts params:params];
    [queries addObject:querytable];
    
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
    
    zqlresult *result = [zql query:queries];
    
    NSLog(@"result: %@", result);
}

@end