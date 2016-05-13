#import "vpollutionmapdisplay.h"
#import "ecolor.h"

static NSInteger const pollutionmapheight = 200;

@implementation vpollutionmapdisplay

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor background]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    return CGSizeMake(UIViewNoIntrinsicMetric, pollutionmapheight);
}

@end