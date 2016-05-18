#import <UIKit/UIKit.h>
#import "vradiationreactorsun.h"
#import "mradiation.h"

@interface vradiationreactor:UIView

-(void)loadradiation:(mradiation*)model;

@property(weak, nonatomic)mradiationreactor *modelloadingreactor;
@property(weak, nonatomic)mradiationreactor *modelreactor;
@property(weak, nonatomic)vradiationreactorsun *loadingreactor;
@property(weak, nonatomic)vradiationreactorsun *reactor;
@property(strong, nonatomic)NSTimer *timer;
@property(assign, nonatomic)CGFloat endingradius;

@end