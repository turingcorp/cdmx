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
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[label(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark climate cell

-(void)config:(mclimatecurrentitemwind*)model
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:1];
    NSString *stringkm = [formatter stringFromNumber:@(model.wind.speed)];
    NSString *stringsubtitle = [NSString stringWithFormat:NSLocalizedString(@"vclimate_wind_subtitle", nil), stringkm];
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont boldsize:12], NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *attrsubtitle = @{NSFontAttributeName:[UIFont regularsize:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0.5 alpha:1]};
    NSAttributedString *astringtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"vclimate_wind_title", nil) attributes:attrtitle];
    NSAttributedString *astringsubtitle = [[NSAttributedString alloc] initWithString:stringsubtitle attributes:attrsubtitle];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:astringtitle];
    [mut appendAttributedString:astringsubtitle];
    [self.label setAttributedText:mut];
    
    [self.wind removeFromSuperview];
    vclimatewind *wind = [[vclimatewind alloc] init:model.wind];
    self.wind = wind;
    
    [self addSubview:wind];
    
    NSDictionary *views = @{@"wind":wind};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[wind]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[wind(110)]" options:0 metrics:metrics views:views]];
}

@end