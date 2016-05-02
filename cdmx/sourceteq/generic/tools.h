#import <UIKit/UIKit.h>

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(void)shareapp;
-(NSString*)numbertostring:(NSNumber*)number;
-(NSDate*)stringtodate:(NSString*)string;

@end