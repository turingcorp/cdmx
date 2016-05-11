#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "vpollutionfront.h"

@class cpollution;
@class vpollutionmenu;

@interface vpollution:GLKView<GLKViewDelegate>

-(instancetype)init:(cpollution*)controller;
-(void)modelloaded;
-(void)show_districts;
-(void)show_today;
-(void)show_history;
-(void)show_map;

@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)vpollutionfront *front;
@property(weak, nonatomic)vpollutionmenu *menu;
@property(strong, nonatomic)NSMutableData *datatexture;
@property(strong, nonatomic)GLKBaseEffect *baseeffect;
@property(strong, nonatomic)EAGLContext *strongcontext;
@property(assign, nonatomic)GLKVector2 *pointertexture;

@end