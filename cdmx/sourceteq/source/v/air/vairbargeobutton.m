#import "vairbargeobutton.h"
#import "uifont+uifontmain.h"

static NSInteger const height = 45;
static NSInteger const width = 120;

@implementation vairbargeobutton

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setUserInteractionEnabled:NO];
    [icon setClipsToBounds:YES];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setImage:[[UIImage imageNamed:@"stations_geo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    self.icon = icon;
    
    UILabel *text = [[UILabel alloc] init];
    [text setBackgroundColor:[UIColor clearColor]];
    [text setUserInteractionEnabled:NO];
    [text setFont:[UIFont boldsize:13]];
    [text setText:NSLocalizedString(@"air_button_map", nil)];
    [text setTranslatesAutoresizingMaskIntoConstraints:NO];
    [text setTextAlignment:NSTextAlignmentRight];
    self.text = text;
    
    [self addSubview:icon];
    [self addSubview:text];
    
    NSDictionary *views = @{@"icon":icon, @"text":text};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[text]-8-[icon(14)]-14-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[text]-0-|" options:0 metrics:metrics views:views]];
    
    [self hover];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(width, height);
    
    return size;
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

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.icon setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
        [self.text setTextColor:[UIColor colorWithWhite:1 alpha:0.2]];
    }
    else
    {
        [self.icon setTintColor:[UIColor whiteColor]];
        [self.text setTextColor:[UIColor colorWithWhite:1 alpha:0.7]];
    }
}

@end