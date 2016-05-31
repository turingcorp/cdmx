#import "vecobicimenucell.h"

@implementation vecobicimenucell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    UIImageView *icon = [[UIImageView alloc] init];
    [icon setClipsToBounds:YES];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setUserInteractionEnabled:NO];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTintColor:[UIColor blackColor]];
    self.icon = icon;
    
    [self addSubview:icon];
    
    NSDictionary *views = @{@"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-18-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-13-[icon]-14-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark private

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

#pragma mark public

-(void)config:(mecobicimenuitem*)model
{
    [self.icon setImage:[[UIImage imageNamed:model.asset] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

@end