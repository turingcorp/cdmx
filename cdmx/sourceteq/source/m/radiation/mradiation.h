#import <UIKit/UIKit.h>

@interface mradiation:NSObject

+(instancetype)points:(NSInteger)points;

@property(copy, nonatomic, readonly)NSString *name;
@property(strong, nonatomic, readonly)UIColor *color;
@property(assign, nonatomic, readonly)NSInteger points;

@end