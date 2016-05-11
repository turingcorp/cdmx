#import "mdbselect.h"
#import <zql/zql.h>
#import "mdbconstants.h"

@implementation mdbselect

+(NSArray<mdbdistrict*>*)district
{
    NSMutableArray<mdbdistrict*> *array = [NSMutableArray array];
    zqlparam *paramprimarykey = [zqlparam type:[zqltype integer] name:dbprimarykey value:nil];
    zqlparam *paramserverid = [zqlparam type:[zqltype integer] name:dbserverindex value:nil];
    zqlparam *parampollution = [zqlparam type:[zqltype integer] name:dbdistricts_pollution value:nil];
    zqlparam *paramname = [zqlparam type:[zqltype text] name:dbdistricts_name value:nil];
    zqlparam *paramasset = [zqlparam type:[zqltype text] name:dbdistricts_asset value:nil];
    zqlparam *paramx = [zqlparam type:[zqltype integer] name:dbdistricts_x value:nil];
    zqlparam *paramy = [zqlparam type:[zqltype integer] name:dbdistricts_y value:nil];
    zqlparam *paramwidth = [zqlparam type:[zqltype integer] name:dbdistricts_width value:nil];
    zqlparam *paramheight = [zqlparam type:[zqltype integer] name:dbdistricts_height value:nil];
    
    NSArray<zqlparam*> *params = @[
                                   paramprimarykey,
                                   paramserverid,
                                   parampollution,
                                   paramname,
                                   paramasset,
                                   paramx,
                                   paramy,
                                   paramwidth,
                                   paramheight
                                   ];
    
    zqlquery *query = [zqlquery select:dbdistricts params:params ordered:paramname ascendent:YES];
    zqlresult *result = [zql query:@[query]];
    
    NSUInteger districtscount = result.params.count;
    for(NSUInteger indexdistrict = 0; indexdistrict < districtscount; indexdistrict++)
    {
        mdbdistrict *model = [[mdbdistrict alloc] init];
        zqlresultparams *resultparams = result.params[indexdistrict];
        zqlparam *pprimarykey = resultparams.items[dbprimarykey];
        zqlparam *pserverindex = resultparams.items[dbserverindex];
        zqlparam *ppollution = resultparams.items[dbdistricts_pollution];
        zqlparam *pname = resultparams.items[dbdistricts_name];
        zqlparam *passet = resultparams.items[dbdistricts_asset];
        zqlparam *px = resultparams.items[dbdistricts_x];
        zqlparam *py = resultparams.items[dbdistricts_y];
        zqlparam *pwidth = resultparams.items[dbdistricts_width];
        zqlparam *pheight = resultparams.items[dbdistricts_height];
        
        model.primarykey = pprimarykey.value;
        model.serverid = pserverindex.value;
        model.pollution = ppollution.value;
        model.name = pname.value;
        model.asset = passet.value;
        model.x = px.value;
        model.y = py.value;
        model.width = pwidth.value;
        model.height = pheight.value;
        
        [array addObject:model];
    }
    
    return array;
}

+(NSArray<mdbpollutiondaily*>*)pollutiondaily;
{
    NSMutableArray<mdbpollutiondaily*> *array = [NSMutableArray array];
    zqlparam *paramprimarykey = [zqlparam type:[zqltype integer] name:dbprimarykey value:nil];
    zqlparam *paramdate = [zqlparam type:[zqltype integer] name:dbpollutiondaily_date value:nil];
    zqlparam *parampollution = [zqlparam type:[zqltype integer] name:dbpollutiondaily_maxpollution value:nil];
    
    NSArray<zqlparam*> *params = @[
                                   paramprimarykey,
                                   paramdate,
                                   parampollution
                                   ];
    
    zqlquery *query = [zqlquery select:dbpollutiondaily params:params ordered:paramdate ascendent:YES];
    zqlresult *result = [zql query:@[query]];
    
    NSUInteger districtscount = result.params.count;
    
    if(districtscount)
    {
        for(NSUInteger indexdistrict = 0; indexdistrict < districtscount; indexdistrict++)
        {
            mdbpollutiondaily *model = [[mdbpollutiondaily alloc] init];
            zqlresultparams *resultparams = result.params[indexdistrict];
            zqlparam *pprimarykey = resultparams.items[dbprimarykey];
            zqlparam *pcreated = resultparams.items[dbcreated];
            zqlparam *pdate = resultparams.items[dbpollutiondaily_date];
            zqlparam *ppollution = resultparams.items[dbpollutiondaily_maxpollution];
            
            model.primarykey = pprimarykey.value;
            model.created = pcreated.value;
            model.date = pdate.value;
            model.pollution = ppollution.value;
            
            [array addObject:model];
        }
    }
    else
    {
        mdbpollutiondaily *model = [mdbpollutiondaily empty];
        
        [array addObject:model];
    }
    
    return array;
}

@end