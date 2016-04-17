#import "vairbargeobutton.h"
#import "uifont+uifontmain.h"

static NSInteger const height = 45;
static NSInteger const width = 100;

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
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont boldsize:15]];
    [title setText:NSLocalizedString(@"air_button_map", nil)];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.title = title;
    
    [self addSubview:icon];
    [self addSubview:title];
    
    NSDictionary *views = @{@"icon":icon, @"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(30)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self.title setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    }
    else
    {
        [self.icon setTintColor:[UIColor whiteColor]];
        [self.title setTintColor:[UIColor whiteColor]];
    }
}

@end