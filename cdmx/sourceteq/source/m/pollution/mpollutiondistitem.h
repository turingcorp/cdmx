#import <Foundation/Foundation.h>
#import "gtexture.h"

@interface mpollutiondistitem:NSObject

-(instancetype)init:(NSString*)name texturename:(NSString*)texturename;

@property(strong, nonatomic)gtexture *texture;
@property(copy, nonatomic)NSString *name;

@end