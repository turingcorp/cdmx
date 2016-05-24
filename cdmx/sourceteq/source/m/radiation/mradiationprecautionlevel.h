#import <UIKit/UIKit.h>

@interface mradiationprecautionlevel:NSObject

+(instancetype)notnecessary;
+(instancetype)advised;
+(instancetype)mandatory;

@property(copy, nonatomic, readonly)NSString *name;
@property(strong, nonatomic, readonly)UIColor *color;

@end