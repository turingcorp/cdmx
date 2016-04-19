#import <UIKit/UIKit.h>
#import "cnodrive.h"
#import "vmenubutton.h"

@interface vnodrivebar:UIView

-(instancetype)init:(cnodrive*)controller;

@property(weak, nonatomic)cnodrive *controller;

@end