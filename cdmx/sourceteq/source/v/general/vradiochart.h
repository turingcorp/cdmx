#import <UIKit/UIKit.h>

@interface vradiochart:UIView

-(void)render;

@property(strong, nonatomic)UIColor *basecolor;
@property(strong, nonatomic)UIColor *higlightcolor;
@property(assign, nonatomic)NSInteger size_2;
@property(assign, nonatomic)NSInteger linewidth;
@property(assign, nonatomic)NSInteger currentpoints;
@property(assign, nonatomic)NSInteger maxpoints;

@end