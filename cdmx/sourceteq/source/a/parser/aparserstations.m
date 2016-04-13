#import "aparserstations.h"
#import "tools.h"
#import "mstations.h"

@implementation aparserstations

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        NSDictionary *pollution = self.validjson[@"pollutionMeasurements"];
        
        if(pollution)
        {
            BOOL createreading = NO;
            NSString *pollutiontimestamp = pollution[@"timeStamp"];
            NSDate *date = [[tools singleton] stringtodate:pollutiontimestamp];
            NSInteger pollutionhour = [pollution[@"report"] integerValue];
            
            if(![mstations singleton].readings.count)
            {
                createreading = YES;
            }
            else
            {
                mstationsreading *lastreading = [[mstations singleton].readings lastObject];
                                                 
                if(![lastreading.date isEqualToDate:date])
                {
                    createreading = YES;
                }
                else if(lastreading.hour != pollutionhour)
                {
                    createreading = YES;
                }
            }
            
            if(createreading)
            {
                NSArray *rawdel = pollution[@"delegations"];
                NSArray *rawsta = pollution[@"stations"];
                NSMutableArray *rawtotal = [NSMutableArray array];
                [rawtotal addObjectsFromArray:rawdel];
                [rawtotal addObjectsFromArray:rawsta];
                NSUInteger count = rawtotal.count;
                
                for(NSUInteger i = 0; i < count; i++)
                {
                    NSDictionary *rawitem = rawtotal[i];
                    NSString *rawname = rawitem[@"name"];
                    NSString *rawshortname = [rawitem[@"shortName"] lowercaseString];
                    NSString *rawlocation = rawitem[@"location"];
                    NSString *rawpollutant = rawitem[@"pollutant"];
                    NSInteger rawpoints = [rawitem[@"imecaPoints"] integerValue];
                    CGFloat rawtemperature = [rawitem[@"temperature"] floatValue];
                    CGFloat rawhumidity = [rawitem[@"humidity"] floatValue];
                    NSInteger rawwinddirection = [rawitem[@"windDirection"] integerValue];
                    NSInteger rawwindspeed = [rawitem[@"windSpeed"] integerValue];
                    
                }
                
                /*
                 
                 {
                 "name": "HUIXQUILUCAN",
                 "shortName": "HUI",
                 "imecaPoints": "30",
                 "pollutant": "O3",
                 "indice": "BUENA",
                 "riesgo": "Sin riesgo",
                 "recomendacion": "Se puede realizar cualquier actividad al aire libre.",
                 "recomendacionaireuno":"Puedes realizar actividades al aire libre",
                 "recomendacionairedos":"Puedes ejercitarte al aire libre",
                 "recomendacionairetres":"Sin riesgo para grupos sensibles",
                 "color": "#97CA03"
                 
                 }
                 
                 
                 {
                 "name": "Acolman",
                 "shortName": "ACO",
                 "location": "19.635501,-98.912003",
                 "imecaPoints": "16",
                 "pollutant": "O3",
                 "temperature": "17.2",
                 "humidity": "54",
                 "windDirection": "197",
                 "windSpeed": "-99"
                 }
                 
                 */
            }
        }
    }
}

-(NSData*)cleandata:(NSData*)data
{
    NSString *cleanstring = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
    NSData *cleaneddata = [cleanstring dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    
    return cleaneddata;
}

@end