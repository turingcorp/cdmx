#import <UIKit/UIKit.h>
#import "cpollution.h"
#import "mpollutiondist.h"

@interface vpollution:GLKView<GLKViewDelegate>

-(instancetype)init:(cpollution*)controller;
-(void)viewdidappear;

@property(assign, nonatomic)GLKVector2 *pointertexture;
@property(weak, nonatomic)cpollution *controller;
@property(strong, nonatomic)mpollutiondist *modeldist;
@property(strong, nonatomic)GLKBaseEffect *baseeffect;
@property(strong, nonatomic)NSMutableData *datatexture;

@end