#import <UIKit/UIKit.h>
#import "uicolor+uicolormain.h"

@interface mstationsreadingitemindex:NSObject

-(instancetype)init:(NSInteger)points;

@property(strong, nonatomic)UIColor *color;
@property(nonatomic)NSInteger points;

@end