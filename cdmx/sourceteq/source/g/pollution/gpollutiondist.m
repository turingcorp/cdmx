#import "gpollutiondist.h"

static NSInteger const distx = -300;
static NSInteger const disty = 0;
static NSInteger const distwidth = 1000;
static NSInteger const distheight = 1000;
static BOOL const srgb = NO;

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

#pragma mark -
#pragma mark spatial

-(void)drawwithuserinfo:(mpollutionnotificationdraw*)userinfo
{
    GLKBaseEffect *baseeffect = userinfo.baseeffect;
    baseeffect.constantColor = GLKVector4Make(1, 0, 0, 1);
    [super drawwithuserinfo:userinfo];
}

@end