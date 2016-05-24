#import <UIKit/UIKit.h>
#import "ccontroller.h"

@interface vviewbar:UIView

-(instancetype)init:(ccontroller*)controller;
-(void)title:(NSString*)title;
-(void)buttonback;
-(void)buttonmenu;
-(void)logo:(NSString*)asset;

@property(weak, nonatomic)ccontroller *controller;
@property(weak, nonatomic)UIButton *buttonleft;
@property(weak, nonatomic)UIButton *buttonright;
@property(weak, nonatomic)UIImageView *imagecenter;
@property(weak, nonatomic)UILabel *labeltitle;

@end