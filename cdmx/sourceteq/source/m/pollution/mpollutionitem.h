#import <Foundation/Foundation.h>
#import "mpollutionindex.h"
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"
#import "gspatial.h"

@interface mpollutionitem:NSObject

+(instancetype)district:(mdbdistrict*)modeldistrict;
+(instancetype)pollutiondaily:(mdbpollutiondaily*)modelpollutiondaily;
-(gspatial*)spatial;

@property(strong, nonatomic)mpollutionindex *index;
@property(copy, nonatomic)NSString *name;

@end