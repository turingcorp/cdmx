#import <UIKit/UIKit.h>
#import "mstationsreadingitemindex.h"

@interface mstationsreadingitem:NSObject

@property(strong, nonatomic)mstationsreadingitemindex *index;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *shortname;

@end