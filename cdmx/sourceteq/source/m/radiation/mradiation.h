#import <UIKit/UIKit.h>
#import "mradiationactivity.h"

@interface mradiation:NSObject

+(instancetype)points:(NSInteger)points;
+(NSInteger)maxpoints;

@property(strong, nonatomic, readonly)NSArray<mradiationactivity*> *activities;
@property(strong, nonatomic, readonly)UIColor *color;
@property(copy, nonatomic, readonly)NSString *name;
@property(assign, nonatomic, readonly)NSInteger points;

@end