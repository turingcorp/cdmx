#import <UIKit/UIKit.h>

@class cpollution;

@interface vpollutionoption:UIView

-(instancetype)init:(cpollution*)controller;
-(void)remove;

@property(weak, nonatomic)cpollution *controller;

@end