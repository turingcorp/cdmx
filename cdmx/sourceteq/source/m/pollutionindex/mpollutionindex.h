#import <UIKit/UIKit.h>

@interface mpollutionindex:NSObject

+(instancetype)points:(NSInteger)points;
+(NSInteger)maxpoints;
-(instancetype)init:(NSInteger)points;
-(NSDictionary*)allrecomendations;
-(NSString*)recommendations;

@property(strong, nonatomic)UIColor *color;
@property(copy, nonatomic)NSString *name;
@property(assign, nonatomic)NSInteger points;

@end