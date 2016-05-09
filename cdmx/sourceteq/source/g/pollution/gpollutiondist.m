#import "gpollutiondist.h"
#import "ecolor.h"
#import "genericconstants.h"

static BOOL const srgb = NO;

@implementation gpollutiondist

-(instancetype)init:(NSString*)texturename
{
    self = [super init:texturename srgb:srgb];
    
    
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


-(void)originalsize
{
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainwidth = screenwidth - pollution_distminsize;
    self.x = remainwidth / 2.0;
    self.y = pollution_distposy;
    self.width = pollution_distminsize;
    self.height = pollution_distminsize;
    
    [self render];
}

-(void)extrasize
{
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainwidth = screenwidth - pollution_distminsize;
    self.x = (remainwidth / 2.0) - 40;
    self.y = (pollution_distposy) - 40;
    self.width = pollution_distminsize + 80;
    self.height = pollution_distminsize + 80;
    
    [self render];
}

@end