#import "vradiationreactorsun.h"
#import "ecolor.h"

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
    CGFloat sum = self.model.startingradius;
    CGFloat endingradius = self.model.endingradius;
    CGFloat raywidth = self.model.raywidth;
    CGFloat rayspacing = self.model.rayspacing;
    CGFloat sunradius = self.model.sunradius;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.model.linewidth);
    CGContextSetStrokeColorWithColor(context, self.model.color.CGColor);
    
    while(sum < endingradius)
    {
        CGFloat endingray = sum + raywidth;
        CGContextAddArc(context, width_2, height_2, sunradius, sum, endingray, 0);
        CGContextDrawPath(context, kCGPathStroke);
        sum += endingray + rayspacing;
    }
}

#pragma mark public

-(void)update:(mradiationreactor*)model
{
    self.model = model;
    [self setNeedsDisplay];
}

@end