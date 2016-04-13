#import <UIKit/UIKit.h>

@interface mstationsnodriveplate:NSObject

-(instancetype)init:(NSString*)rawcolor;

@property(strong, nonatomic)UIColor *color;
@property(strong, nonatomic)NSArray<NSNumber*> *numbers;

@end