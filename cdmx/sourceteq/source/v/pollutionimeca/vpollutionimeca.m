#import "vpollutionimeca.h"
#import "efont.h"

static NSInteger const labelmarginx = 10;
static NSInteger const labelmargintop = 20;
static NSInteger const labelmarginbottom = 40;

@implementation vpollutionimeca

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vpollutionimeca_title", nil)];
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    [scroll setClipsToBounds:YES];
    [scroll setTranslatesAutoresizingMaskIntoConstraints:NO];
    [scroll setShowsHorizontalScrollIndicator:NO];
    [scroll setShowsVerticalScrollIndicator:NO];
    [scroll setAlwaysBounceVertical:YES];
    self.scroll = scroll;
    
    UILabel *label = [[UILabel alloc] init];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setFont:[UIFont regularsize:18]];
    [label setTextColor:[UIColor colorWithWhite:0.3 alpha:1]];
    [label setText:NSLocalizedString(@"vpollutionimeca_descr", nil)];
    self.label = label;
    
    [scroll addSubview:label];
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"scroll":scroll, @"bar":self.bar, @"label":label};
    NSDictionary *metrics = @{@"marginx":@(labelmarginx), @"margintop":@(labelmargintop), @"marginbottom":@(labelmarginbottom)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(marginx)-[label]-(marginx)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margintop)-[label]-(marginbottom)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

@end