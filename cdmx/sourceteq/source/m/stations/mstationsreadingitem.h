#import <UIKit/UIKit.h>
#import "mstationsreadingitemindex.h"

@interface mstationsreadingitem:NSObject

@property(strong, nonatomic)mstationsreadingitemindex *index;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *shortname;
@property(nonatomic)CGFloat latitude;
@property(nonatomic)CGFloat longitude;


NSDictionary *rawitem = rawtotal[i];
NSString *rawname = rawitem[@"name"];
NSString *rawshortname = [rawitem[@"shortName"] lowercaseString];
NSString *rawlocation = rawitem[@"location"];
NSString *rawpollutant = [rawitem[@"pollutant"] lowercaseString];
NSInteger rawpoints = [rawitem[@"imecaPoints"] integerValue];
CGFloat rawtemperature = [rawitem[@"temperature"] floatValue];
CGFloat rawhumidity = [rawitem[@"humidity"] floatValue];
NSInteger rawwinddirection = [rawitem[@"windDirection"] integerValue];
NSInteger rawwindspeed = [rawitem[@"windSpeed"] integerValue];

@end