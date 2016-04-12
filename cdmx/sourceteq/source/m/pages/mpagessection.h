#import <UIKit/UIKit.h>
#import "mpagesitem.h"

@interface mpagessection:NSObject

@property(strong, nonatomic)NSArray<mpagesitem*> *items;
@property(copy, nonatomic)NSString *name;

@end