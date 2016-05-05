#import "gpollutiondist.h"
#import "ecolor.h"
#import "genericconstants.h"

static BOOL const srgb = NO;

@implementation gpollutiondist

-(instancetype)init:(NSString*)texturename
{
    self = [super init:texturename srgb:srgb];
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainwidth = screenwidth - pollution_distminsize;
    self.initialx = remainwidth / 2.0;
    self.x = self.initialx;
    self.y = pollution_distposy;
    self.width = pollution_distminsize;
    self.height = pollution_distminsize;
    self.color = [[UIColor background] asvector];
    
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