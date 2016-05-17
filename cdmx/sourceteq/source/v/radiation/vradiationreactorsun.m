#import "vradiationreactorsun.h"
#import "ecolor.h"

static CGFloat const radiationreactorstartingradius = 0;
static CGFloat const radiationreactorendingradius = 6.284;
static CGFloat const radiationreactorraywidth = 0.05;
static CGFloat const radiationreactorrayspacing = 0.02;
static NSInteger const radiationreactorradius = 100;
static NSInteger const radiationreactorlinewidth = 3;

@implementation vradiationreactorsun

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat width_2 = width / 2.0;
    CGFloat height_2 = height / 2.0;
    CGFloat sum = radiationreactorstartingradius;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, radiationreactorlinewidth);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    while(sum < radiationreactorendingradius)
    {
        CGContextAddArc(context, width_2, height_2, radiationreactorradius, sum, sum + radiationreactorraywidth, 0);
        CGContextDrawPath(context, kCGPathStroke);
        sum += radiationreactorraywidth + radiationreactorrayspacing;
    }
}

@end