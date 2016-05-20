#import <UIKit/UIKit.h>

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
-(NSString*)datefromserver:(NSNumber*)serverdate;

@end