#import <UIKit/UIKit.h>
#import "ccontroller.h"
#import "mnodrive.h"

@interface cnodrivecalendar:ccontroller

-(instancetype)init:(mnodrive*)model;

@property(strong, nonatomic, readonly)mnodrive *model;

@end