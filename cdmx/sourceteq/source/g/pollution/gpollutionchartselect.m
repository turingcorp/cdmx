#import "gpollutionchartselect.h"
#import "ecolor.h"
#import "enotification.h"

static NSInteger const selectorsize = 20;

@implementation gpollutionchartselect
{
    NSInteger selectorsize_2;
}

-(instancetype)init
{
    self = [super init:@"pollution_chartselect" srgb:NO];
    self.width = selectorsize;
    self.height = selectorsize;
    self.visible = NO;
    self.rerender = NO;
    self.color = [[UIColor main] asvector];
    selectorsize_2 = selectorsize / 2.0;
    
    [NSNotification observe:self glkmove:@selector(move:)];
    
    return self;
}

#pragma mark notified

-(void)move:(NSNotification*)notification
{
    if(self.rerender)
    {
        [self render];
        [self movetotop];
        
        self.rerender = NO;
    }
}

#pragma mark public

-(void)newx:(CGFloat)x y:(CGFloat)y
{
    self.x = x - selectorsize_2;
    self.y = y - selectorsize_2;
    self.rerender = YES;
    self.visible = YES;
}

#pragma mark -
#pragma mark spatial

-(void)drawwithuserinfo:(mpollutionnotificationdraw*)userinfo
{
    if(self.visible)
    {
        [super drawwithuserinfo:userinfo];
    }
}

@end