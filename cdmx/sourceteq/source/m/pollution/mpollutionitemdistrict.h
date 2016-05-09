#import <Foundation/Foundation.h>
#import "mpollutionitem.h"

@interface mpollutionitemdistrict:mpollutionitem

-(instancetype)init:(mdbdistrict*)modeldistrict;

@property(weak, nonatomic)mdbdistrict *modeldistrict;

@end