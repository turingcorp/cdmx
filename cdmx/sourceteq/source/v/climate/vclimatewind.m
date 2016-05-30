#import "vclimatewind.h"
#import "ecolor.h"
#import "efont.h"

static CGFloat const radian0 = M_PI_2;
static CGFloat const windradius = 0.15;
static NSInteger const circlelinewidth = 2;
static NSInteger const circleradius = 40;
static NSInteger const circleminiradius = 6;

@interface vclimatewind ()

@property(weak, nonatomic, readwrite)mclimatewind *model;

@end

@implementation vclimatewind

-(instancetype)init:(mclimatewind*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.model = model;
    
    UILabel *labelnorth = [[UILabel alloc] init];
    [labelnorth setUserInteractionEnabled:NO];
    [labelnorth setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelnorth setBackgroundColor:[UIColor clearColor]];
    [labelnorth setFont:[UIFont boldsize:12]];
    [labelnorth setTextColor:[UIColor blackColor]];
    [labelnorth setTextAlignment:NSTextAlignmentCenter];
    [labelnorth setText:@"N"];
    
    [self addSubview:labelnorth];
    
    NSDictionary *views = @{@"labelnorth":labelnorth};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelnorth]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelnorth(20)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat degrees = self.model.direction;
    CGFloat radians = [self degtorad:degrees];
    CGFloat middlepoint = radians + radian0;
    CGFloat leftpoint = middlepoint - windradius;
    CGFloat rightpoint = middlepoint + windradius;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat width_2 = width / 2.0;
    CGFloat height_2 = height / 2.0;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, circlelinewidth);
    CGContextSetStrokeColorWithColor(context, [UIColor background].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor background].CGColor);
    CGContextAddArc(context, width_2, height_2, circleradius, 0.0001, 0, 0);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextAddArc(context, width_2, height_2, circleminiradius, 0.0001, 0, 0);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSetFillColorWithColor(context, [UIColor main].CGColor);
    CGContextMoveToPoint(context, width_2, height_2);
    CGContextAddArc(context, width_2, height_2, circleradius, leftpoint, rightpoint, 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
}

#pragma mark private

-(CGFloat)degtorad:(CGFloat)degrees
{
    return degrees * M_PI / 180.0;
}

@end