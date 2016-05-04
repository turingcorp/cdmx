#import "mpollutiondistitem.h"

static BOOL const srgb = YES;

@implementation mpollutiondistitem

-(instancetype)init:(NSString*)name texturename:(NSString*)texturename
{
    self = [super init];
    self.name = name;
    
    return self;
}

@end