#import "vnodriveheader.h"
#import "efont.h"
#import "ecolor.h"

@implementation vnodriveheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setNumberOfLines:0];
    [title setFont:[UIFont regularsize:14]];
    [title setTextColor:[UIColor blackColor]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.title = title;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:[UIColor background]];
    [border setClipsToBounds:YES];
    self.border = border;
    
    [self addSubview:title];
    [self addSubview:border];
    
    NSDictionary *views = @{@"title":title, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[border]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[title(50)]-0-[border(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mnodrivetodaysection*)model
{
    [self.title setText:model.name];
    [self.border setHidden:!model.headerborder];
}

@end