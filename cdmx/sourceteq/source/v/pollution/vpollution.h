#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "vpollutionoption.h"

@class cpollution;
@class vpollutionmenu;

@interface vpollution:GLKView<GLKViewDelegate>

-(instancetype)init:(cpollution*)controller;
-(void)modelloaded;
-(void)show_districts;
-(void)show_chart;
-(void)show_map;
-(void)clean;

@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)vpollutionoption *option;
@property(weak, nonatomic)vpollutionmenu *menu;
@property(strong, nonatomic)NSMutableData *datatexture;
@property(strong, nonatomic)GLKBaseEffect *baseeffect;
@property(assign, nonatomic)GLKVector2 *pointertexture;

@end