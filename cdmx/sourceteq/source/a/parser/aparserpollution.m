#import "aparserpollution.h"
#import "mdbupdate.h"

@interface aparserpollution ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionhour*> *modelhourly;

@end

@implementation aparserpollution

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSArray *rawdistricts = self.validjson[@"districts"];
        NSArray *rawdaily = self.validjson[@"daily"];
        NSArray *rawhourly = self.validjson[@"hourly"];
        NSArray<mdbdistrict*> *modeldistricts = [self parsedistricts:rawdistricts];
        NSArray<mdbpollutiondaily*> *modeldaily = [self parserdaily:rawdaily];
        self.modelhourly = [self parsehourly:rawhourly];
        [mdbupdate pollutiondistricts:modeldistricts daily:modeldaily];
    }
}

#pragma mark private

-(NSArray<mdbdistrict*>*)parsedistricts:(NSArray*)rawdistricts
{
    NSMutableArray<mdbdistrict*> *modeldistricts = [NSMutableArray array];
    NSUInteger countdistricts = rawdistricts.count;
    
    for(NSUInteger indexdistricts = 0; indexdistricts < countdistricts; indexdistricts++)
    {
        NSDictionary *rawdist = rawdistricts[indexdistricts];
        NSNumber *rawdistid = rawdist[@"id"];
        NSNumber *rawdistpollution = rawdist[@"pollution"];
        NSNumber *rawdistpollutantid = rawdist[@"pollutantid"];
        
        mdbdistrict *modeldist = [[mdbdistrict alloc] init];
        modeldist.serverid = rawdistid;
        modeldist.pollution = rawdistpollution;
        modeldist.pollutantid = rawdistpollutantid;
        
        [modeldistricts addObject:modeldist];
    }
    
    return modeldistricts;
}

-(NSArray<mdbpollutiondaily*>*)parserdaily:(NSArray*)rawdaily
{
    NSMutableArray<mdbpollutiondaily*> *modeldaily = [NSMutableArray array];
    NSUInteger countdaily = rawdaily.count;
    
    for(NSUInteger indexdaily = 0; indexdaily < countdaily; indexdaily++)
    {
        NSDictionary *rawday = rawdaily[indexdaily];
        NSNumber *rawdaydate = rawday[@"date"];
        NSNumber *rawdaypollution = rawday[@"pollution"];
        
        mdbpollutiondaily *modelday = [[mdbpollutiondaily alloc] init];
        modelday.date = rawdaydate;
        modelday.pollution = rawdaypollution;
        
        [modeldaily addObject:modelday];
    }
    
    return modeldaily;
}

-(NSArray<mpollutionhour*>*)parsehourly:(NSArray*)rawhourly
{
    NSMutableArray<mpollutionhour*> *modelhourly = [NSMutableArray array];
    NSUInteger counthours = rawhourly.count;
    
    for(NSUInteger indexhour = 0; indexhour < counthours; indexhour++)
    {
        NSDictionary *rawhour = rawhourly[indexhour];
        NSNumber *rawhourhour = rawhour[@"hour"];
        NSNumber *rawhourpollution = rawhour[@"pollution"];
        
        mpollutionhour *modelhour = [[mpollutionhour alloc] init];
        modelhour.hour = rawhourhour;
        modelhour.pollution = rawhourpollution;
        [modelhourly addObject:modelhour];
    }
    
    return modelhourly;
}

@end