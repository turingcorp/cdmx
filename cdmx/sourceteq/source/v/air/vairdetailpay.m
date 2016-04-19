#import "vairdetailpay.h"

static NSInteger const margin = 50;
static NSInteger const linewidth = 10;
static NSInteger const minpoints = 0;
static NSInteger const degrees = 360;
static CGFloat const maxpoints = 200.0;
static CGFloat const degradian = 180.0;

@implementation vairdetailpay

-(instancetype)init:(mstationsreadingitemindex*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    self.model = model;
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat width_2 = width / 2.0;
    CGFloat height_2 = height / 2.0;
    CGFloat min = MIN(width, height);
    CGFloat min_2 = min / 2.0;
    CGFloat radius = min_2 - margin;
    NSInteger points = self.model.points;
    
    if(points < minpoints)
    {
        points = minpoints;
    }
    else if(points > maxpoints)
    {
        points = maxpoints;
    }
    
    CGFloat percent = points / maxpoints;
    CGFloat degs = percent * degrees;
    CGFloat radians = degs * M_PI / degradian;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.model.color.CGColor);
    CGContextSetFillColorWithColor(context, self.model.color.CGColor);
    CGContextSetLineWidth(context, linewidth);
    CGContextAddArc(context, width_2, height_2, radius, 0, radians, 0);
    CGContextDrawPath(context, kCGPathStroke);
}

@end