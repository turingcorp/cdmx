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
                mstationsreading *newreading = [[mstationsreading alloc] init];
                NSMutableArray *mutarray = [NSMutableArray array];
                NSDictionary *dictpollutants = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"pollutants" withExtension:@"plist"]];
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
                    NSString *rawpollutant = [rawitem[@"pollutant"] lowercaseString];
                    NSString *rawtemperature = rawitem[@"temperature"];
                    NSString *rawhumidity = rawitem[@"humidity"];
                    NSString *rawwinddirection = rawitem[@"windDirection"];
                    NSString *rawwindspeed = rawitem[@"windSpeed"];
                    NSInteger rawpoints = [rawitem[@"imecaPoints"] integerValue];
                    
                    BOOL add = YES;
                    NSUInteger countmut = mutarray.count;
                    
                    for(NSUInteger j = 0; j < countmut; j++)
                    {
                        mstationsreadingitem *initem = mutarray[j];
                        
                        if([initem.shortname isEqualToString:rawshortname])
                        {
                            if(!initem.name)
                            {
                                initem.name = rawname;
                            }
                            
                            if(rawlocation && !initem.location)
                            {
                                NSArray *splitlocation = [rawlocation componentsSeparatedByString:@","];
                                
                                if(splitlocation.count == 2)
                                {
                                    NSString *splitlatitude = splitlocation[0];
                                    NSString *splitlongitude = splitlocation[1];
                                    CGFloat rawlatitude = splitlatitude.floatValue;
                                    CGFloat rawlongitude = splitlongitude.floatValue;
                                    
                                    mstationsitemlocation *location = [[mstationsitemlocation alloc] init:rawlatitude lon:rawlongitude];
                                    initem.location = location;
                                }
                            }
                            
                            if(!initem.pollutant && rawpollutant)
                            {
                                NSString *statpollutant = dictpollutants[rawpollutant];
                                
                                if(statpollutant)
                                {
                                    initem.pollutant = statpollutant;
                                }
                            }
                            
                            if(!initem.index || initem.index.points < rawpoints)
                            {
                                mstationsreadingitemindex *newindex = [mstationsreadingitemindex indexwithpoints:rawpoints];
                                initem.index = newindex;
                            }
                            
                            if(!initem.conditions && rawtemperature && rawhumidity)
                            {
                                CGFloat scalartemperature = rawtemperature.floatValue;
                                CGFloat scalarhumidity = rawhumidity.floatValue;
                                mstationsreadingitemconditions *newconditions = [[mstationsreadingitemconditions alloc] init:scalartemperature humidity:scalarhumidity];
                                
                                initem.conditions = newconditions;
                            }
                            
                            if(!initem.wind && rawwinddirection && rawwindspeed)
                            {
                                NSInteger scalarwinddirection = rawtemperature.integerValue;
                                NSInteger scalarwindspeed = rawhumidity.integerValue;
                                mstationsreadingitemwind *newwind = [[mstationsreadingitemwind alloc] init:scalarwinddirection speed:scalarwindspeed];
                                
                                initem.wind = newwind;
                            }
                            
                            add = NO;
                            
                            break;
                        }
                    }
                    
                    if(add)
                    {
                        mstationsreadingitem *newitem = [[mstationsreadingitem alloc] init];
                        [mutarray addObject:newitem];
                    }
                }
                
                newreading.items = mutarray;
                [[mstations singleton].readings addObject:newreading];
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