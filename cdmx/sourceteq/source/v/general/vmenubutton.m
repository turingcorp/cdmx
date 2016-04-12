#import "vmenubutton.h"

static NSUInteger const buttonwidth = 65;
static NSUInteger const buttonheight = 45;

@implementation vmenubutton

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.imageView setClipsToBounds:YES];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [self setImage:[[UIImage imageNamed:@"general_menubutton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self setImage:[[UIImage imageNamed:@"general_menubutton"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(buttonwidth, buttonheight);
    
    return size;
}

@end