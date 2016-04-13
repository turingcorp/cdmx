#import <UIKit/UIKit.h>

@interface mstationsreadingitemconditions:NSObject

-(instancetype)init:(CGFloat)temperature humidity:(CGFloat)humidity;

@property(nonatomic)CGFloat temperature;
@property(nonatomic)CGFloat humidity;
@property(nonatomic)NSInteger winddirection;
@property(nonatomic)NSInteger windspeed;

@end