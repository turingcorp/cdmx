#import <Foundation/Foundation.h>
#import "mpollutiondistitem.h"
#import "mpollutionindex.h"

@interface mpollutionreaditem:NSObject

+(instancetype)dist:(mpollutiondistitem*)dist index:(mpollutionindex*)index;
+(instancetype)global:(mpollutionindex*)index;
-(instancetype)init:(mpollutionindex*)index;

@property(strong, nonatomic)mpollutionindex *index;
@property(copy, nonatomic)NSString *name;

@end