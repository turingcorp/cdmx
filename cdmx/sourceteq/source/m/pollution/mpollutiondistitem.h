#import <Foundation/Foundation.h>
#import "mglktexture.h"

@interface mpollutiondistitem:NSObject

-(instancetype)init:(NSString*)name texturename:(NSString*)texturename;

@property(strong, nonatomic)mglktexture *texture;
@property(copy, nonatomic)NSString *name;

@end