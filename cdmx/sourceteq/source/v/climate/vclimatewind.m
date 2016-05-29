#import "vclimatewind.h"
#import "ecolor.h"

static NSInteger const circlelinewidth = 2;
static NSInteger const circleradius = 80;

@implementation vclimatewind

-(instancetype)init:(mclimatewind*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat width_2 = width / 2.0;
    CGFloat height_2 = height / 2.0;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, circlelinewidth);
    CGContextSetStrokeColorWithColor(context, [UIColor background].CGColor);
    CGContextAddArc(context, width_2, height_2, circleradius, 0.0001, 0, 0);
    CGContextDrawPath(context, kCGPathStroke);
}

@end