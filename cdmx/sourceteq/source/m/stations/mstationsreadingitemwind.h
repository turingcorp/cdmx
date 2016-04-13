#import <UIKit/UIKit.h>

@interface mstationsreadingitemwind:NSObject

-(instancetype)init:(NSInteger)direction speed:(NSInteger)speed;

@property(nonatomic)NSInteger direction;
@property(nonatomic)NSInteger speed;

@end