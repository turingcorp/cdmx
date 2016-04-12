#import <UIKit/UIKit.h>

@interface mstationsitem:NSObject

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *shortname;
@property(copy, nonatomic)NSString *sid;
@property(nonatomic)NSInteger stationid;
@property(nonatomic)NSInteger altitude;
@property(nonatomic)CGFloat latitude;
@property(nonatomic)CGFloat longitiude;

@end