#import <UIKit/UIKit.h>

@interface mpollutionpollutant:NSObject

+(instancetype)server:(NSNumber*)serverid;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *symbol;
@property(copy, nonatomic)NSNumber *serverid;

@end