#import "vpollutionfrontheaderbutton.h"
#import "ecolor.h"
#import "efont.h"

@implementation vpollutionfrontheaderbutton

-(instancetype)init
{
    self = [super init];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentRight];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont boldsize:14]];
    [label setTextColor:[UIColor main]];
    [label setText:NSLocalizedString(@"vpollution_front_header_button", nil)];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setUserInteractionEnabled:NO];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeCenter];
    [image setImage:[[UIImage imageNamed:@"generic_next"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTintColor:[UIColor main]];
    
    [self addSubview:label];
    [self addSubview:image];
    
    NSDictionary *views = @{@"label":label, @"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-[image(50)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end