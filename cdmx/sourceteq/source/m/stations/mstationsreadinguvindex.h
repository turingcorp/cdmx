#import <UIKit/UIKit.h>

@interface mstationsreadinguvindex:NSObject

+(instancetype)indexwithnumber:(NSInteger)number;
-(instancetype)init:(NSInteger)number;

@property(strong, nonatomic)UIColor *color;
@property(nonatomic)NSInteger number;

@end