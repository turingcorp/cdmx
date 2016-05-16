#import <Foundation/Foundation.h>

@interface mpollutionpollutant:NSObject

+(instancetype)server:(NSNumber*)serverid;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSNumber *serverid;

@end