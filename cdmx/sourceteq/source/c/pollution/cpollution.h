#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "vpollution.h"
#import "mpollution.h"
#import "acalldelegate.h"
#import "amanager.h"

@interface cpollution:GLKViewController<GLKViewControllerDelegate, acalldelegate>

-(void)loadpollution;
-(void)menu;
-(void)option:(UIViewController*)controller;

@property(strong, nonatomic)vpollution *view;
@property(strong, nonatomic)mpollution *model;
@property(weak, nonatomic)amanager *apimanager;

@end