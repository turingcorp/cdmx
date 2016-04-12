#import "vspinner.h"

static CGFloat const animationduration = 3.0;
static NSUInteger const intrinsicsize = 60;

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
    CGSize size = CGSizeMake(intrinsicsize, intrinsicsize);
    
    return size;
}

@end