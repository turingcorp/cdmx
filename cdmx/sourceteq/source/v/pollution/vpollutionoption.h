#import <UIKit/UIKit.h>

@class cpollution;

@interface vpollutionoption:UIView

-(instancetype)init:(cpollution*)controller;
-(void)remove;
-(void)didappear;

@property(weak, nonatomic)cpollution *controller;

@end