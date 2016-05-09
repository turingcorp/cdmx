#import <Foundation/Foundation.h>
#import "mpollutionindex.h"
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"

@interface mpollutionitem:NSObject

+(instancetype)district:(mdbdistrict*)modeldistrict;
+(instancetype)pollutiondaily:(mdbpollutiondaily*)modelpollutiondaily;

@property(strong, nonatomic)mpollutionindex *index;
@property(copy, nonatomic)NSString *name;

@end