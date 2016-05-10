#import <UIKit/UIKit.h>

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(void)shareapp;
-(NSString*)datefromserver:(NSNumber*)serverdate;

@end