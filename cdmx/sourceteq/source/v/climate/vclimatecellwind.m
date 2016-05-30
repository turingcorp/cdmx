#import "vclimatecellwind.h"
#import "mclimatecurrentitemwind.h"
#import "efont.h"

@implementation vclimatecellwind

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setNumberOfLines:0];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label(60)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark climate cell

-(void)config:(mclimatecurrentitemwind*)model
{
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont boldsize:12], NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *attrsubtitle = @{NSFontAttributeName:[UIFont regularsize:14], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.4 alpha:1]};
    NSAttributedString *astringtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"vclimate_wind_title", nil) attributes:attrtitle];
    NSAttributedString *astringsubtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"vclimate_wind_title", nil) attributes:attrtitle];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:astringtitle];
    [mut appendAttributedString:astringsubtitle];
    
    [self.wind removeFromSuperview];
    vclimatewind *wind = [[vclimatewind alloc] init:model.wind];
    self.wind = wind;
    
    [self addSubview:wind];
    
    NSDictionary *views = @{@"wind":wind};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[wind]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[wind(100)]" options:0 metrics:metrics views:views]];
}

@end