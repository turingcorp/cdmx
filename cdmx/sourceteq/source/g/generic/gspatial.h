#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "enotification.h"

@interface gspatial:NSObject

-(void)drawwithuserinfo:(mpollutionnotificationdraw*)userinfo;
-(void)draw:(NSNotification*)notification;
-(void)movedx:(CGFloat)dx dy:(CGFloat)dy;
-(void)render;
-(void)movetotop;

@property(assign, nonatomic)GLKVector4 color;
@property(strong, nonatomic)NSMutableData *dataposition;
@property(assign, nonatomic)GLKVector2 *pointerposition;
@property(assign, nonatomic)GLKMatrix4 projection;
@property(assign, nonatomic)CGFloat width;
@property(assign, nonatomic)CGFloat height;
@property(assign, nonatomic)CGFloat x;
@property(assign, nonatomic)CGFloat y;

@end