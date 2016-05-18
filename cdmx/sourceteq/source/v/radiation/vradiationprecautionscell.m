#import "vradiationprecautionscell.h"
#import "ecolor.h"
#import "efont.h"

@implementation vradiationprecautionscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setTintColor:[UIColor main]];
    self.image = image;
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setFont:[UIFont regularsize:11]];
    [title setTextColor:[UIColor main]];
    self.title = title;
    
    UILabel *level = [[UILabel alloc] init];
    [level setBackgroundColor:[UIColor clearColor]];
    [level setUserInteractionEnabled:NO];
    [level setTranslatesAutoresizingMaskIntoConstraints:NO];
    [level setTextAlignment:NSTextAlignmentCenter];
    [level setFont:[UIFont boldsize:11]];
    [level setTextColor:[UIColor main]];
    self.level = level;
    
    [self addSubview:image];
    [self addSubview:title];
    [self addSubview:level];
    
    NSDictionary *views = @{@"image":image, @"title":title, @"level":level};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[level]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[level(13)]-4-[image(26)]-4-[title(13)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mradiationprecaution*)model
{
    [self.image setImage:[[UIImage imageNamed:model.asset] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self.title setText:model.name];
    [self.level setText:model.level.name];
    [self.level setTextColor:model.level.color];
}

@end