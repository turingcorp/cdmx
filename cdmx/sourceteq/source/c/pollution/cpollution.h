#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "vpollution.h"
#import "mpollution.h"

@interface cpollution:GLKViewController<GLKViewControllerDelegate>

-(void)imeca;

@property(strong, nonatomic)vpollution *view;
@property(strong, nonatomic)mpollution *model;

@end