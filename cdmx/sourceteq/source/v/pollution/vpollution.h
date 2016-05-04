#import <UIKit/UIKit.h>
#import "cpollution.h"
#import "mpollutiondist.h"

@interface vpollution:GLKView<GLKViewDelegate>

-(instancetype)init:(cpollution*)controller;
-(void)viewdidappear;

@property(weak, nonatomic)cpollution *controller;
@property(strong, nonatomic)mpollutiondist *modeldist;
@property(strong, nonatomic)GLKBaseEffect *baseeffect;

@end