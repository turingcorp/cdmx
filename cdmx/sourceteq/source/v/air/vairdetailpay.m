#import "vairdetailpay.h"
#import "uifont+uifontmain.h"
#import "tools.h"

static NSInteger const size_2 = 65;
static NSInteger const linewidth = 24;
static NSInteger const minpoints = 0;
static NSInteger const degrees = 360;
static CGFloat const maxpoints = 200.0;
static CGFloat const degradian = 180.0;
static CGFloat const startrad = -M_PI_2;

@implementation vairdetailpay

-(instancetype)init:(mstationsreadingitemindex*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    self.model = model;
    
    NSString *strpoints = [[tools singleton] numbertostring:@(model.points)];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont regularsize:40]];
    [label setUserInteractionEnabled:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [label setText:strpoints];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat width_2 = width / 2.0;
    CGFloat height_2 = height / 2.0;
    CGFloat linewidth_2 = linewidth / 2.0;
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
    CGContextSetLineWidth(context, linewidth);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.97 alpha:1].CGColor);
    CGContextAddArc(context, width_2, height_2, size_2, 0.0001, 0, 0);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextSetStrokeColorWithColor(context, self.model.color.CGColor);
    CGContextAddArc(context, width_2, height_2, size_2, startrad, radians + startrad, 0);
    
    CGPoint point = CGContextGetPathCurrentPoint(context);
    
    CGContextDrawPath(context, kCGPathStroke);
    CGContextSetFillColorWithColor(context, self.model.color.CGColor);
    CGContextAddArc(context, width_2, height_2 - size_2, linewidth_2, 0.00001, 0, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextAddArc(context, point.x, point.y, linewidth_2, 0.00001, 0, 0);
    CGContextDrawPath(context, kCGPathFill);
}

@end