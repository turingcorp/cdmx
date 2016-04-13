#import <UIKit/UIKit.h>
#import "uicolor+uicolormain.h"

@interface mstationsreadinguvindex:NSObject

+(instancetype)indexwithnumber:(NSInteger)number;
-(instancetype)init:(NSInteger)number;

@property(strong, nonatomic)UIColor *color;
@property(copy, nonatomic)NSString *title;
@property(copy, nonatomic)NSString *descr;
@property(nonatomic)NSInteger number;

@end