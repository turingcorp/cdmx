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
    zqlparam *parampollutantid = [zqlparam type:[zqltype integer] name:dbdistricts_pollutantid value:nil];
    zqlparam *paramname = [zqlparam type:[zqltype text] name:dbdistricts_name value:nil];
    zqlparam *paramasset = [zqlparam type:[zqltype text] name:dbdistricts_asset value:nil];
    zqlparam *paramx = [zqlparam type:[zqltype integer] name:dbdistricts_x value:nil];
    zqlparam *paramy = [zqlparam type:[zqltype integer] name:dbdistricts_y value:nil];
    zqlparam *paramwidth = [zqlparam type:[zqltype integer] name:dbdistricts_width value:nil];
    zqlparam *paramheight = [zqlparam type:[zqltype integer] name:dbdistricts_height value:nil];
    zqlparam *paramlatitude = [zqlparam type:[zqltype integer] name:dbdistricts_latitude value:nil];
    zqlparam *paramlongitude = [zqlparam type:[zqltype integer] name:dbdistricts_longitude value:nil];
    
    NSArray<zqlparam*> *params = @[
                                   paramprimarykey,
                                   paramserverid,
                                   parampollution,
                                   parampollutantid,
                                   paramname,
                                   paramasset,
                                   paramx,
                                   paramy,
                                   paramwidth,
                                   paramheight,
                                   paramlatitude,
                                   paramlongitude
                                   ];
    
    zqlquery *query = [zqlquery select:dbdistricts params:params ordered:paramname ascendent:YES limit:0];
    zqlresult *result = [zql query:@[query] db:nil];
    
    NSUInteger districtscount = result.params.count;
    for(NSUInteger indexdistrict = 0; indexdistrict < districtscount; indexdistrict++)
    {
        mdbdistrict *model = [[mdbdistrict alloc] init];
        zqlresultparams *resultparams = result.params[indexdistrict];
        zqlparam *pprimarykey = resultparams.items[dbprimarykey];
        zqlparam *pserverindex = resultparams.items[dbserverindex];
        zqlparam *ppollution = resultparams.items[dbdistricts_pollution];
        zqlparam *ppollutantid = resultparams.items[dbdistricts_pollutantid];
        zqlparam *pname = resultparams.items[dbdistricts_name];
        zqlparam *passet = resultparams.items[dbdistricts_asset];
        zqlparam *px = resultparams.items[dbdistricts_x];
        zqlparam *py = resultparams.items[dbdistricts_y];
        zqlparam *pwidth = resultparams.items[dbdistricts_width];
        zqlparam *pheight = resultparams.items[dbdistricts_height];
        zqlparam *platitude = resultparams.items[dbdistricts_latitude];
        zqlparam *plongitude = resultparams.items[dbdistricts_longitude];
        NSNumber *uselatitude = @([platitude.value integerValue] / (CGFloat)dbintegermultiply);
        NSNumber *uselongitude = @([plongitude.value integerValue] / (CGFloat)dbintegermultiply);
        
        model.primarykey = pprimarykey.value;
        model.serverid = pserverindex.value;
        model.pollution = ppollution.value;
        model.pollutantid = ppollutantid.value;
        model.name = pname.value;
        model.asset = passet.value;
        model.x = px.value;
        model.y = py.value;
        model.width = pwidth.value;
        model.height = pheight.value;
        model.latitude = uselatitude;
        model.longitude = uselongitude;
        
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
    
    zqlquery *query = [zqlquery select:dbpollutiondaily params:params ordered:paramdate ascendent:YES limit:0];
    zqlresult *result = [zql query:@[query] db:nil];
    
    NSUInteger districtscount = result.params.count;
    
    if(districtscount)
    {
        for(NSUInteger indexdistrict = 0; indexdistrict < districtscount; indexdistrict++)
        {
            mdbpollutiondaily *model = [[mdbpollutiondaily alloc] init];
            zqlresultparams *resultparams = result.params[indexdistrict];
            zqlparam *pprimarykey = resultparams.items[dbprimarykey];
            zqlparam *pdate = resultparams.items[dbpollutiondaily_date];
            zqlparam *ppollution = resultparams.items[dbpollutiondaily_maxpollution];
            
            model.primarykey = pprimarykey.value;
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

+(mdbpollutiondaily*)lastpollutiondaily
{
    mdbpollutiondaily *lastdaily;
    zqlparam *paramprimarykey = [zqlparam type:[zqltype integer] name:dbprimarykey value:nil];
    zqlparam *paramdate = [zqlparam type:[zqltype integer] name:dbpollutiondaily_date value:nil];
    zqlparam *parampollution = [zqlparam type:[zqltype integer] name:dbpollutiondaily_maxpollution value:nil];
    
    NSArray<zqlparam*> *params = @[
                                   paramprimarykey,
                                   paramdate,
                                   parampollution
                                   ];
    
    zqlquery *query = [zqlquery select:dbpollutiondaily params:params ordered:paramdate ascendent:NO limit:1];
    zqlresult *result = [zql query:@[query] db:nil];
    
    NSUInteger districtscount = result.params.count;
    
    if(districtscount)
    {
        lastdaily = [[mdbpollutiondaily alloc] init];
        zqlresultparams *resultparams = result.params[0];
        zqlparam *pprimarykey = resultparams.items[dbprimarykey];
        zqlparam *pdate = resultparams.items[dbpollutiondaily_date];
        zqlparam *ppollution = resultparams.items[dbpollutiondaily_maxpollution];
        
        lastdaily.primarykey = pprimarykey.value;
        lastdaily.date = pdate.value;
        lastdaily.pollution = ppollution.value;
    }
    
    return lastdaily;
}

@end