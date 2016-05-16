#import <Foundation/Foundation.h>
#import "mpollutionindex.h"
#import "mpollutionpollutant.h"

@class mpollutionfront;

@interface mpollutionfrontitemoption:NSObject

+(instancetype)imeca;
+(instancetype)recommendation:(mpollutionindex*)index;
+(instancetype)pollutant:(mpollutionpollutant*)pollutant;
+(instancetype)allpollutants:(mpollutionfront*)model;

@property(copy, nonatomic)NSString *name;

@end