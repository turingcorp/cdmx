#import <UIKit/UIKit.h>
#import "mstationsitemlocation.h"
#import "mstationsreadingitem.h"

@interface mstationsitem:NSObject

-(BOOL)ownsreading:(mstationsreadingitem*)reading;

@property(strong, nonatomic)mstationsitemlocation *location;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *shortname;
@property(copy, nonatomic)NSString *sid;
@property(copy, nonatomic)NSString *message;
@property(nonatomic)NSInteger stationid;
@property(nonatomic)NSInteger altitude;

@end