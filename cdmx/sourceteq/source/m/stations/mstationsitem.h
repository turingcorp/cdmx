#import <UIKit/UIKit.h>

@interface mstationsitem:NSObject

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *shortname;
@property(copy, nonatomic)NSString *sid;
@property(copy, nonatomic)NSString *message;
@property(nonatomic)NSInteger stationid;
@property(nonatomic)NSInteger altitude;

@end