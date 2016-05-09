#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "vpollutionfront.h"

@class cpollution;

@interface vpollution:GLKView<GLKViewDelegate>

-(instancetype)init:(cpollution*)controller;
-(void)modelloaded;
-(void)show_districts;
-(void)show_today;
-(void)show_history;
-(void)show_map;

@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)vpollutionfront *front;
@property(strong, nonatomic)NSMutableData *datatexture;
@property(strong, nonatomic)GLKBaseEffect *baseeffect;
@property(assign, nonatomic)GLKVector2 *pointertexture;

@end