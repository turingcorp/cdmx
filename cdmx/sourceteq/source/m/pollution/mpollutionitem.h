#import <Foundation/Foundation.h>
#import "mpollutionindex.h"
#import "mdbdistrict.h"
#import "mdbpollutiondaily.h"
#import "gspatial.h"

@interface mpollutionitem:NSObject

+(instancetype)district:(mdbdistrict*)modeldistrict;
+(instancetype)pollutiondaily:(mdbpollutiondaily*)modelpollutiondaily;
-(void)highlighted;
-(void)nothighlighted;

@property(strong, nonatomic)mpollutionindex *index;
@property(strong, nonatomic)gspatial *spatial;
@property(copy, nonatomic)NSString *name;

@end