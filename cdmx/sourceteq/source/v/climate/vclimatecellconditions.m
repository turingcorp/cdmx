#import "vclimatecellconditions.h"
#import "mclimatecurrentitemconditions.h"
#import "efont.h"

@implementation vclimatecellconditions

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *tempnumber = [[UILabel alloc] init];
    [tempnumber setUserInteractionEnabled:NO];
    [tempnumber setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tempnumber setBackgroundColor:[UIColor clearColor]];
    [tempnumber setFont:[UIFont numericsize:80]];
    [tempnumber setTextColor:[UIColor blackColor]];
    self.tempnumber = tempnumber;
    
    [self addSubview:tempnumber];
    
    NSDictionary *views = @{@"tempnumber":tempnumber};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[tempnumber(220)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[tempnumber(100)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark climate cell

-(void)config:(mclimatecurrentitemconditions*)model
{
    NSString *string = [NSString stringWithFormat:NSLocalizedString(@"vclimate_conditions_temp", nil), @(model.conditions.temp)];
    
    [self.tempnumber setText:string];
}

@end