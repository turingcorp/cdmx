#import "vspinner.h"

static CGFloat const animationduration = 2;
static NSUInteger const spinnerintrinsicsize = 90;

@implementation vspinner

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setContentMode:UIViewContentModeCenter];
    [self setAnimationDuration:animationduration];
    self.animationImages = @[
                             [UIImage imageNamed:@"spinner_0"],
                             [UIImage imageNamed:@"spinner_1"],
                             [UIImage imageNamed:@"spinner_2"],
                             [UIImage imageNamed:@"spinner_4"],
                             [UIImage imageNamed:@"spinner_5"],
                             [UIImage imageNamed:@"spinner_6"],
                             [UIImage imageNamed:@"spinner_7"],
                             [UIImage imageNamed:@"spinner_8"],
                             [UIImage imageNamed:@"spinner_9"]
                             ];
    [self startAnimating];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, spinnerintrinsicsize);
    
    return size;
}

@end