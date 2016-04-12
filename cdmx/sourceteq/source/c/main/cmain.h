#import <UIKit/UIKit.h>
#import "cpages.h"

@interface cmain:UINavigationController

+(instancetype)singleton;

@property(weak, nonatomic)cpages *pages;

@end