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
            NSArray *rawinfoarr = pollution[@"information"];
            
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
                NSInteger countstations = [mstations singleton].items.count;
                mstationsreading *newreading = [[mstationsreading alloc] init];
                newreading.date = date;
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
                            
                            if(!initem.location)
                            {
                                mstationsitemlocation *location = [self locationfromstring:rawlocation];
                                initem.location = location;
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
                            
                            if(!initem.conditions && rawtemperature && rawhumidity && rawtemperature.length && rawhumidity.length)
                            {
                                CGFloat scalartemperature = rawtemperature.floatValue;
                                CGFloat scalarhumidity = rawhumidity.floatValue;
                                
                                if(scalartemperature > -99 && scalarhumidity > -99)
                                {
                                    mstationsreadingitemconditions *newconditions = [[mstationsreadingitemconditions alloc] init:scalartemperature humidity:scalarhumidity];
                                    
                                    initem.conditions = newconditions;
                                }
                            }
                            
                            if(!initem.wind && rawwinddirection && rawwindspeed && rawwinddirection.length)
                            {
                                NSInteger scalarwinddirection = rawwinddirection.integerValue;
                                NSInteger scalarwindspeed = rawwindspeed.integerValue;
                                
                                if(scalarwinddirection >= 0)
                                {
                                    mstationsreadingitemwind *newwind = [[mstationsreadingitemwind alloc] init:scalarwinddirection speed:scalarwindspeed];
                                    
                                    initem.wind = newwind;
                                }
                            }
                            
                            add = NO;
                            
                            break;
                        }
                    }
                    
                    if(add)
                    {
                        mstationsreadingitem *newitem = [[mstationsreadingitem alloc] init:rawname];
                        newitem.shortname = rawshortname;
                        
                        mstationsreadingitemindex *newindex = [mstationsreadingitemindex indexwithpoints:rawpoints];
                        newitem.index = newindex;
                        
                        mstationsitemlocation *location = [self locationfromstring:rawlocation];
                        newitem.location = location;
                        
                        if(rawpollutant)
                        {
                            NSString *statpollutant = dictpollutants[rawpollutant];
                            
                            if(statpollutant)
                            {
                                newitem.pollutant = statpollutant;
                            }
                        }
                        
                        if(rawtemperature && rawhumidity && rawtemperature.length && rawhumidity.length)
                        {
                            CGFloat scalartemperature = rawtemperature.floatValue;
                            CGFloat scalarhumidity = rawhumidity.floatValue;
                            
                            if(scalartemperature > -99 && scalarhumidity > -99)
                            {
                                mstationsreadingitemconditions *newconditions = [[mstationsreadingitemconditions alloc] init:scalartemperature humidity:scalarhumidity];
                                
                                newitem.conditions = newconditions;
                            }
                        }
                        
                        if(rawwinddirection && rawwindspeed && rawwinddirection.length)
                        {
                            NSInteger scalarwinddirection = rawwinddirection.integerValue;
                            NSInteger scalarwindspeed = rawwindspeed.integerValue;
                            
                            if(scalarwinddirection >= 0)
                            {
                                mstationsreadingitemwind *newwind = [[mstationsreadingitemwind alloc] init:scalarwinddirection speed:scalarwindspeed];
                                
                                newitem.wind = newwind;
                            }
                        }
                        
                        [mutarray addObject:newitem];
                        
                        for(NSUInteger j = 0; j < countstations; j++)
                        {
                            mstationsitem *station = [mstations singleton].items[j];
                            
                            if([station ownsreading:newitem])
                            {
                                newitem.station = station;
                                
                                break;
                            }
                        }
                    }
                }
                
                newreading.items = mutarray;
                [newreading sort];
                [[mstations singleton].readings addObject:newreading];
            }
            
            if(rawinfoarr && rawinfoarr.count)
            {
                NSCalendar *calendar = [NSCalendar currentCalendar];
                [calendar setFirstWeekday:1];
                NSInteger datecomponent = [calendar ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:date];
                
                NSDictionary *rawinfo = rawinfoarr[0];
                NSString *rawuvindex = [rawinfo[@"indiceradiacion"] lowercaseString];
                NSString *rawuvtitle = rawinfo[@"riesgouv"];
                NSString *rawuvdescr1 = rawinfo[@"recomendacionuvuno"];
                NSString *rawuvdescr2 = rawinfo[@"recomendacionuvdos"];
                NSString *rawuvdescr3 = rawinfo[@"recomendacionuvtres"];
                NSString *rawworst = rawinfo[@"valormeca"];
                NSString *rawtemperature = rawinfo[@"temperatura"];
                NSString *rawhumidity = rawinfo[@"humedad"];
                
                NSInteger uvindex = 0;
                NSString *uvtitle;
                NSMutableString *uvdescr = [NSMutableString string];
                
                if(rawuvindex && rawuvindex.length)
                {
                    NSString *cleanedindex = [rawuvindex stringByReplacingOccurrencesOfString:@".png" withString:@""];
                    uvindex = cleanedindex.integerValue;
                }
                
                if(rawuvtitle)
                {
                    uvtitle = rawuvtitle;
                }
                else
                {
                    uvtitle = @"";
                }
                
                if(rawuvdescr1 && rawuvdescr1.length > 1)
                {
                    [uvdescr appendFormat:@"\n%@", rawuvdescr1];
                    
                    if(rawuvdescr2 && rawuvdescr2.length > 1)
                    {
                        [uvdescr appendFormat:@" %@", rawuvdescr2];
                        
                        if(rawuvdescr3 && rawuvdescr3.length > 1)
                        {
                            [uvdescr appendFormat:@" %@", rawuvdescr3];
                        }
                    }
                }
                
                mstationsreadinguv *newuv = [[mstationsreadinguv alloc] init:uvindex title:uvtitle descr:uvdescr];
                [mstations singleton].uv = newuv;
                
                BOOL createnodrive = NO;
                mstationsnodrive *currentnodrive = [mstations singleton].nodrive;
                
                if(!currentnodrive)
                {
                    createnodrive = YES;
                }
                else if(![currentnodrive.date isEqualToDate:date])
                {
                    createnodrive = YES;
                }
                
                if(createnodrive)
                {
                    mstationsnodrive *newnodrive = [[mstationsnodrive alloc] init];
                    newnodrive.date = date;
                    
                    if(datecomponent > 1)
                    {
                        NSMutableArray<mstationsnodrivehologram*> *mutholograms = [NSMutableArray array];
                        NSMutableArray<mstationsnodriveplate*> *mutplates = [NSMutableArray array];
                        
                        NSString *rawplatecolor;
                        NSString *rawplatecolor2;
                        NSString *rawholograms = rawinfo[@"txtsemana"];
                        
                        if(datecomponent < 7)
                        {
                            rawplatecolor = rawinfo[@"color"];
                            rawplatecolor2 = rawinfo[@"color2"];
                        }
                        else
                        {
                            rawplatecolor = rawinfo[@"colorsg"];
                        }
                        
                        if(rawplatecolor && rawplatecolor.length > 1)
                        {
                            mstationsnodriveplate *maincolor = [[mstationsnodriveplate alloc] init:rawplatecolor];
                            [mutplates addObject:maincolor];
                        }
                        
                        if(rawplatecolor2 && rawplatecolor2.length > 1)
                        {
                            mstationsnodriveplate *secondcolor = [[mstationsnodriveplate alloc] init:rawplatecolor2];
                            [mutplates addObject:secondcolor];
                        }
                        
                        if(rawholograms && rawholograms.length)
                        {
                            NSString *cleanhg = rawholograms.lowercaseString;
                            cleanhg = [cleanhg stringByReplacingOccurrencesOfString:@"," withString:@""];
                            cleanhg = [cleanhg stringByReplacingOccurrencesOfString:@"." withString:@""];
                            NSArray *splithg = [cleanhg componentsSeparatedByString:@" "];
                            
                            NSUInteger countsplit = splithg.count;
                            
                            for(NSUInteger i = 0; i < countsplit; i++)
                            {
                                NSString *insplithg = splithg[i];
                                mstationsnodrivehologram *hologram = [mstationsnodrivehologram hologramforstring:insplithg];
                                
                                if(hologram)
                                {
                                    [mutholograms addObject:hologram];
                                }
                            }
                        }
                        
                        newnodrive.plates = mutplates;
                        newnodrive.holograms = mutholograms;
                    }
                    else
                    {
                        newnodrive.explanation = NSLocalizedString(@"nodrive_sunday", nil);
                    }
                    
                    [mstations singleton].nodrive = newnodrive;
                }
                
                if(rawworst && rawworst.length)
                {
                    NSInteger worstnumber = rawworst.integerValue;
                    mstationsreadingitemindex *newindex = [mstationsreadingitemindex indexwithpoints:worstnumber];
                    [mstations singleton].worstindex = newindex;
                }
                
                if(rawhumidity && rawhumidity.length && rawtemperature && rawtemperature.length)
                {
                    CGFloat temperaturenumber = rawtemperature.floatValue;
                    CGFloat humiditynumber = rawhumidity.floatValue;
                    
                    if(temperaturenumber > -99 && humiditynumber > -99)
                    {
                        mstationsreadingitemconditions *newconditions = [[mstationsreadingitemconditions alloc] init:temperaturenumber humidity:humiditynumber];
                        [mstations singleton].generalconditions = newconditions;
                    }
                }
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

#pragma mark functionality

-(mstationsitemlocation*)locationfromstring:(NSString*)string
{
    mstationsitemlocation *location;
    
    if(string)
    {
        NSArray *splitlocation = [string componentsSeparatedByString:@","];
        
        if(splitlocation.count == 2)
        {
            NSString *splitlatitude = splitlocation[0];
            NSString *splitlongitude = splitlocation[1];
            CGFloat rawlatitude = splitlatitude.floatValue;
            CGFloat rawlongitude = splitlongitude.floatValue;
            
            location = [[mstationsitemlocation alloc] init:rawlatitude lon:rawlongitude];
        }
    }
    
    return location;
}

@end