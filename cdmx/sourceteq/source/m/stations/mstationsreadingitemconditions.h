#import <UIKit/UIKit.h>

@interface mstationsreadingitemconditions:NSObject

-(instancetype)init:(CGFloat)temperature humidity:(CGFloat)humidity;

@property(nonatomic)CGFloat temperature;
@property(nonatomic)CGFloat humidity;

@end