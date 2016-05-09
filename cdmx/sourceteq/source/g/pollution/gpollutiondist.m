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
    
    return self;
}

#pragma mark public

-(void)originalsize
{
    self.x = self.initialx;
    self.y = pollution_distposy;
    self.width = pollution_distminsize;
    self.height = pollution_distminsize;
    
    [self render];
}

-(void)extrasize
{
    self.x = self.initialx - pollution_distminsize;
    self.y = pollution_distposy - pollution_distminsize;
    self.width = pollution_distminsize + pollution_distminsize;
    self.height = pollution_distminsize + pollution_distminsize;
    
    [self render];
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