#import "gpollutiondist.h"
#import "ecolor.h"
#import "enotification.h"
#import "genericconstants.h"

static CGFloat const districtstandscale = 0.75;
static BOOL const districtsrgb = NO;

@implementation gpollutiondist
{
    BOOL shouldrender;
    BOOL shouldmovetotop;
    BOOL maxsize;
}

-(instancetype)init:(mdbdistrict*)model
{
    self = [super init:model.asset srgb:districtsrgb];
    
    shouldrender = NO;
    maxsize = NO;
    shouldmovetotop = YES;
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainminwidth = screenwidth - pollution_mapminwidth;
    CGFloat marginmin = remainminwidth / 2.0;
    self.maxwidth = model.width.integerValue;
    self.maxheight = model.height.integerValue;
    self.standx = (model.x.integerValue * districtstandscale) + marginmin;
    self.standy = (model.y.integerValue * districtstandscale) + pollution_mapy;
    self.minwidth = model.width.integerValue * districtstandscale;
    self.minheight = model.height.integerValue * districtstandscale;
    
    CGFloat deltawidth = self.maxwidth - self.minwidth;
    CGFloat deltawidth_2 = deltawidth / 2.0;
    CGFloat deltaheight = self.maxheight - self.minheight;
    CGFloat deltaheight_2 = deltaheight / 2.0;
    self.highlighty = self.standy - deltaheight_2;
    self.highlightx = self.standx - deltawidth_2;
    
    [NSNotification observe:self glkmove:@selector(notifiedglkmove:)];
    
    return self;
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    if(shouldrender)
    {
        shouldrender = NO;
        
        if(maxsize)
        {
            self.x = self.highlightx;
            self.y = self.highlighty;
            self.width = self.maxwidth;
            self.height = self.maxheight;
        }
        else
        {
            self.x = self.standx;
            self.y = self.standy;
            self.width = self.minwidth;
            self.height = self.minheight;
        }
        
        [self render:shouldmovetotop];
        
        shouldmovetotop = NO;
    }
}

#pragma mark public

-(void)minsize
{
    maxsize = NO;
    shouldrender = YES;
}

-(void)maxsize
{
    maxsize = YES;
    shouldrender = YES;
    shouldmovetotop = YES;
}

@end