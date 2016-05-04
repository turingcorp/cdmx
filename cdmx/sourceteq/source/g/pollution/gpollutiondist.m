#import "gpollutiondist.h"

static NSInteger const distx = 0;
static NSInteger const disty = 0;
static NSInteger const distwidth = 320;
static NSInteger const distheight = 320;
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