#import <UIKit/UIKit.h>

@interface mpollutionindex:NSObject

+(instancetype)points:(NSInteger)points;
+(NSInteger)maxpoints;
-(instancetype)init:(NSInteger)points;
-(NSDictionary*)allrecomendations;
-(NSString*)recommendations;

@property(strong, nonatomic, readonly)UIColor *color;
@property(copy, nonatomic, readonly)NSString *name;
@property(assign, nonatomic, readonly)NSInteger points;

@end