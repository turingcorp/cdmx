#import "gpollutiondist.h"
#import "genericconstants.h"

static NSInteger const distsize = 320;
static BOOL const srgb = NO;

@implementation gpollutiondist

-(instancetype)init:(NSString*)texturename
{
    self = [super init:texturename srgb:srgb];
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainwidth = screenwidth - distsize;
    self.initialx = remainwidth / 2.0;
    self.x = self.initialx;
    self.y = navbarheightmin;
    self.width = distsize;
    self.height = distsize;
    
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