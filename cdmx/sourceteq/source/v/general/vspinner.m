#import "vspinner.h"

static CGFloat const animationduration = 2.0;

@implementation vspinner

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setContentMode:UIViewContentModeScaleAspectFit];
    [self setAnimationDuration:animationduration];
    self.animationImages = @[
                             [UIImage imageNamed:@"spinner_0"],
                             [UIImage imageNamed:@"spinner_1"],
                             [UIImage imageNamed:@"spinner_2"],
                             [UIImage imageNamed:@"spinner_3"],
                             [UIImage imageNamed:@"spinner_4"],
                             [UIImage imageNamed:@"spinner_5"]
                             ];
    [self startAnimating];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(spinnerintrinsicsize, spinnerintrinsicsize);
    
    return size;
}

@end