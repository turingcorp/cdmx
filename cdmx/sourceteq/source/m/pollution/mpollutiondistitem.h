#import <Foundation/Foundation.h>
#import "gpollutiondist.h"
@interface mpollutiondistitem:NSObject

-(instancetype)init:(NSString*)name texturename:(NSString*)texturename;

@property(strong, nonatomic)gpollutiondist *spatial;
@property(copy, nonatomic)NSString *name;

@end