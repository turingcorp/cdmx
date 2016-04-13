#import <UIKit/UIKit.h>

@interface mstationsitemlocation:NSObject

-(instancetype)init:(CGFloat)latitude lon:(CGFloat)longitude;

@property(nonatomic)CGFloat latitude;
@property(nonatomic)CGFloat longitude;

@end
