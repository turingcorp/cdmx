#import <UIKit/UIKit.h>

@interface madminecobicistation:NSObject

-(instancetype)init:(NSDictionary*)dictionary;

@property(copy, nonatomic, readonly)NSNumber *stationid;
@property(copy, nonatomic, readonly)NSNumber *latitude;
@property(copy, nonatomic, readonly)NSNumber *longitude;
@property(copy, nonatomic, readonly)NSString *name;

@end