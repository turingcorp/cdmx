#import "vpollutionfrontheader.h"
#import "genericconstants.h"
#import "ecolor.h"
#import "efont.h"

@implementation vpollutionfrontheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat height = frame.size.height;
    CGFloat bordery = pollution_distposy + pollution_distposy + pollution_distminsize;
    CGFloat contentheight = height - bordery;
    
    UIView *bordertop = [[UIView alloc] init];
    [bordertop setUserInteractionEnabled:NO];
    [bordertop setBackgroundColor:[UIColor background]];
    [bordertop setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:bordertop];
    
    NSDictionary *views = @{@"bordertop":bordertop};
    NSDictionary *metrics = @{@"bordery":@(bordery)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[bordertop]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V|-(bordery)-[bordertop(1)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end