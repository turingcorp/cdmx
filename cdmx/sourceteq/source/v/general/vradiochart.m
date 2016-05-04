#import "vradiochart.h"

static NSInteger const degrees = 360;
static CGFloat const degradian = 180.0;
static CGFloat const startrad = -M_PI_2;
static CGFloat const startplainrad = 0.00001;
static CGFloat const endplainrad = 0;

@implementation vradiochart
{
    CGFloat linewidth_2;
    CGFloat radians;
}

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
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
    CGContextSetLineWidth(context, self.linewidth);
    CGContextSetStrokeColorWithColor(context, self.basecolor.CGColor);
    CGContextAddArc(context, width_2, height_2, self.size_2, startplainrad, endplainrad, 0);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextSetStrokeColorWithColor(context, self.higlightcolor.CGColor);
    CGContextAddArc(context, width_2, height_2, self.size_2, startrad, radians + startrad, 0);
    
    CGPoint point = CGContextGetPathCurrentPoint(context);
    
    CGContextDrawPath(context, kCGPathStroke);
    CGContextSetFillColorWithColor(context, self.higlightcolor.CGColor);
    CGContextAddArc(context, width_2, height_2 - self.size_2, linewidth_2, startplainrad, endplainrad, 0);
    CGContextDrawPath(context, kCGPathFill);
    CGContextAddArc(context, point.x, point.y, linewidth_2, startplainrad, endplainrad, 0);
    CGContextDrawPath(context, kCGPathFill);
}

#pragma mark public

-(void)render
{
    linewidth_2 = self.linewidth / 2.0;
    
    CGFloat percent = self.currentpoints / self.maxpoints;
    CGFloat degs = percent * degrees;
    radians = degs * M_PI / degradian;
    
    [self setNeedsDisplay];
}

@end