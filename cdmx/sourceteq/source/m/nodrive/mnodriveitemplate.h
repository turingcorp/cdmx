#import <UIKit/UIKit.h>

@interface mnodriveitemplate:NSObject

+(instancetype)number:(NSInteger)number;

@property(strong, nonatomic, readonly)UIColor *color;
@property(assign, nonatomic, readonly)NSInteger number;

@end