#import "mpollutiondistitem.h"

@implementation mpollutiondistitem

-(instancetype)init:(NSString*)name texturename:(NSString*)texturename
{
    self = [super init];
    self.name = name;
    self.texture = [[mglktexture alloc] init:texturename];
    
    return self;
}

@end