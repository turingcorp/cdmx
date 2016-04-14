#import <UIKit/UIKit.h>
#import "mstationsreadingitemindex.h"
#import "mstationsitemlocation.h"
#import "mstationsreadingitemconditions.h"
#import "mstationsreadingitemwind.h"
#import "mstationsitem.h"

@interface mstationsreadingitem:NSObject

@property(strong, nonatomic)mstationsitemlocation *location;
@property(strong, nonatomic)mstationsreadingitemindex *index;
@property(strong, nonatomic)mstationsreadingitemconditions *conditions;
@property(strong, nonatomic)mstationsreadingitemwind *wind;
@property(weak, nonatomic)mstationsitem *station;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *shortname;
@property(copy, nonatomic)NSString *pollutant;

@end