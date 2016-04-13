#import <UIKit/UIKit.h>
#import "mstationsreadingitemindex.h"
#import "mstationsitemlocation.h"
#import "mstationsreadingitemconditions.h"
#import "mstationsreadingitemwind.h"

@interface mstationsreadingitem:NSObject

@property(strong, nonatomic)mstationsitemlocation *location;
@property(strong, nonatomic)mstationsreadingitemindex *index;
@property(strong, nonatomic)mstationsreadingitemconditions *conditions;
@property(strong, nonatomic)mstationsreadingitemwind *wind;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *shortname;
@property(copy, nonatomic)NSString *pollutant;

@end