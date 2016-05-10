#import "aparserpollution.h"
#import "mdbupdate.h"

@interface aparserpollution ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionitem*> *modelhourly;

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
        NSMutableArray<mdbdistrict*> *modeldistricts = [NSMutableArray array];
        NSMutableArray<mdbpollutiondaily*> *modeldaily = [NSMutableArray array];
        NSMutableArray<mpollutionitem*> *modelhourly = [NSMutableArray array];
        
        NSUInteger countdistricts = rawdistricts.count;
        
        for(NSUInteger indexdistricts = 0; indexdistricts < countdistricts; indexdistricts++)
        {
            NSDictionary *rawdist = rawdistricts[indexdistricts];
            NSNumber *rawdistid = rawdist[@"id"];
            NSNumber *rawdistpollution = rawdist[@"pollution"];
            
            mdbdistrict *modeldist = [[mdbdistrict alloc] init];
            modeldist.serverid = rawdistid;
            modeldist.pollution = rawdistpollution;
            
            [modeldistricts addObject:modeldist];
        }
        
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
        
        NSUInteger counthours = rawhourly.count;
        
        for(NSUInteger indexhour = 0; indexhour < counthours; indexhour++)
        {
            NSDictionary *rawhour = rawhourly[indexhour];
            NSNumber *rawhourhour = rawhour[@"hour"];
            NSNumber *rawhourpollution = rawhour[@"pollution"];
            
            mpollutionitem *modelhour = [mpollutionitem pollutionhourly:rawhourhour pollution:rawhourpollution];
            [modelhourly addObject:modelhour];
        }
        
        self.modelhourly = modelhourly;
        
        [mdbupdate pollutiondistricts:modeldistricts daily:modeldaily];
    }
}

@end