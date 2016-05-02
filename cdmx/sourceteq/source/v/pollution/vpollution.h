#import <UIKit/UIKit.h>
#import "cpollution.h"

@interface vpollution:GLKView<GLKViewDelegate>

-(instancetype)init:(cpollution*)controller;
-(void)viewdidappear;

@property(weak, nonatomic)cpollution *controller;

@end