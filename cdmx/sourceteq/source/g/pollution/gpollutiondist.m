#import "gpollutiondist.h"
#import "ecolor.h"
#import "genericconstants.h"

static BOOL const srgb = NO;

@implementation gpollutiondist

-(instancetype)init:(NSString*)texturename
{
    self = [super init:texturename srgb:srgb];
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainwidth = screenwidth - pollution_distsize;
    self.x = remainwidth / 2.0;
    self.y = pollution_distposy;
    self.width = pollution_distsize;
    self.height = pollution_distsize;
    
    [self render];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)drawwithuserinfo:(mpollutionnotificationdraw*)userinfo
{
    GLKBaseEffect *baseeffect = userinfo.baseeffect;
    baseeffect.constantColor = self.color;
    [super drawwithuserinfo:userinfo];
}

@end