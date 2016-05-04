#import "gpollutiondist.h"

static NSInteger const distx = 10;
static NSInteger const disty = 10;
static NSInteger const distwidth = 100;
static NSInteger const distheight = 100;
static BOOL const srgb = YES;

@implementation gpollutiondist

-(instancetype)init:(NSString*)texturename
{
    self = [super init:texturename srgb:srgb];
    self.x = distx;
    self.y = disty;
    self.width = distwidth;
    self.height = distheight;
    
    [self render];
    
    return self;
}

@end