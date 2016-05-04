#import "mpollutiondistitem.h"

static BOOL const srgb = YES;

@implementation mpollutiondistitem

-(instancetype)init:(NSString*)name texturename:(NSString*)texturename
{
    self = [super init];
    self.name = name;
    self.texture = [[gtexture alloc] init];
    [self.texture loadtexture:texturename srgb:srgb];
    
    return self;
}

@end