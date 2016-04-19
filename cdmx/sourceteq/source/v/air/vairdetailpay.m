#import "vairdetailpay.h"

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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.model.color.CGColor);
    CGContextSetFillColorWithColor(context, self.model.color.CGColor);
}

@end