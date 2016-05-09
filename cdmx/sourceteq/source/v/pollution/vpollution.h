#import <UIKit/UIKit.h>
#import "mpollutiondist.h"
#import "vpollutionfront.h"

@class cpollution;

@interface vpollution:GLKView<GLKViewDelegate>

-(instancetype)init:(cpollution*)controller;
-(void)modelloaded;

@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)vpollutionfront *front;
@property(strong, nonatomic)mpollutiondist *modeldist;
@property(strong, nonatomic)GLKBaseEffect *baseeffect;
@property(strong, nonatomic)NSMutableData *datatexture;
@property(assign, nonatomic)GLKVector2 *pointertexture;

@end