#import <UIKit/UIKit.h>

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(void)shareapp;
+(NSDictionary*)defaultdict;
+(UIImage*)qrcode:(NSString*)string;
+(NSString*)cleanlatin:(NSString*)string;
-(NSString*)urlencode:(NSString*)string;
-(NSString*)numbertostring:(NSNumber*)number;

@end