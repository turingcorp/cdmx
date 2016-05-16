#import <UIKit/UIKit.h>
#import "mpollutionindex.h"
#import "mpollutionpollutant.h"

@class mpollutionfront;

@interface mpollutionfrontitemoption:NSObject

+(instancetype)imeca;
+(instancetype)recommendation:(mpollutionindex*)index;
+(instancetype)pollutant:(mpollutionpollutant*)pollutant;
+(instancetype)allpollutants:(mpollutionfront*)model;
-(UIViewController*)controller;

@property(copy, nonatomic)NSString *name;

@end