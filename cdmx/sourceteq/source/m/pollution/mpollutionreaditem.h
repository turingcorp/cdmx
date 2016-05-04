#import <Foundation/Foundation.h>
#import "mpollutiondistitem.h"
#import "mpollutionindex.h"

@interface mpollutionreaditem:NSObject

+(instancetype)dist:(mpollutiondistitem*)dist;
+(instancetype)global;

@property(strong, nonatomic)mpollutionindex *index;
@property(copy, nonatomic)NSString *name;

@end