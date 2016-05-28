#import <UIKit/UIKit.h>
#import "mclimatewind.h"

@interface mclimate:NSObject

+(CGFloat)celsiusfrom:(CGFloat)fahrenheit;
+(CGFloat)kilometersfrom:(CGFloat)miles;

@property(strong, nonatomic, readonly)mclimatewind *wind;

@end