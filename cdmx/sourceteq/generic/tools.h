#import <UIKit/UIKit.h>

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(NSDictionary*)defaultdict;
+(NSInteger)timestamp;
+(UIImage*)qrcode:(NSString*)string;
+(NSString*)cleanlatin:(NSString*)string;
+(NSString*)elapsedtimefrom:(NSUInteger)timestamp;
-(NSString*)urlencode:(NSString*)string;
-(NSString*)numbertostring:(NSNumber*)number;
-(NSString*)pricetostring:(NSNumber*)number currency:(NSString*)currency;
-(NSNumber*)stringtonumber:(NSString*)string;
-(NSDate*)stringtodate:(NSString*)string;

@end