#import <UIKit/UIKit.h>
#import "mstationsreadingitemindex.h"
#import "mstationsitemlocation.h"

@interface mstationsreadingitem:NSObject

@property(strong, nonatomic)mstationsitemlocation *location;
@property(strong, nonatomic)mstationsreadingitemindex *index;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *shortname;
@property(copy, nonatomic)NSString *pollutant;

@end