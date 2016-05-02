#import <UIKit/UIKit.h>
#import "cpollution.h"
#import "mpollutiontextures.h"

@interface vpollution:GLKView<GLKViewDelegate>

-(instancetype)init:(cpollution*)controller;
-(void)viewdidappear;

@property(weak, nonatomic)cpollution *controller;
@property(strong, nonatomic)mpollutiontextures *modeltextures;
@property(strong, nonatomic)GLKBaseEffect *baseeffect;

@end