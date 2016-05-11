#import "vcollectioncell.h"
#import "ecolor.h"

@implementation vcollectioncell

+(NSString*)reusableidentifier
{
    NSString *classname = NSStringFromClass([self class]);
    
    return classname;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setBackgroundColor:[UIColor background]];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bordertop setUserInteractionEnabled:NO];
    
    UIView *borderbottom = [[UIView alloc] init];
    [borderbottom setBackgroundColor:[UIColor background]];
    [borderbottom setTranslatesAutoresizingMaskIntoConstraints:NO];
    [borderbottom setUserInteractionEnabled:NO];
    
    [self addSubview:bordertop];
    [self addSubview:borderbottom];
    
    NSDictionary *views = @{@"top":bordertop, @"bottom":borderbottom};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[top]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bottom]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[top(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottom(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setAlpha:0.2];
    }
    else
    {
        [self setAlpha:1];
    }
}

@end