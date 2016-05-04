#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface gspatial:NSObject

-(void)draw:(NSNotification*)notification;
-(void)movedx:(CGFloat)dx dy:(CGFloat)dy;
-(void)render;
-(void)movetotop;

@property(strong, nonatomic)NSMutableData *dataposition;
@property(assign, nonatomic)GLKVector2 *pointerposition;
@property(assign, nonatomic)GLKMatrix4 projection;
@property(assign, nonatomic)CGFloat width;
@property(assign, nonatomic)CGFloat height;
@property(assign, nonatomic)CGFloat x;
@property(assign, nonatomic)CGFloat y;

@end