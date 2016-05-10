#import "gpollutiondist.h"
#import "ecolor.h"
#import "enotification.h"
#import "genericconstants.h"

static CGFloat const districtstandscale = 0.70192;
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
    CGFloat x = model.x.integerValue;
    CGFloat y = model.y.integerValue;
    CGFloat width = model.width.integerValue;
    CGFloat height = model.height.integerValue;
    self.maxwidth = width;
    self.maxheight = height;
    self.standx = (x * districtstandscale) + marginmin;
    self.standy = (y * districtstandscale) + pollution_mapy;
    self.minwidth = width * districtstandscale;
    self.minheight = height * districtstandscale;
    CGFloat deltawidth = width - self.minwidth;
    CGFloat deltawidth_2 = deltawidth / 2.0;
    CGFloat deltaheight = height - self.minheight;
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