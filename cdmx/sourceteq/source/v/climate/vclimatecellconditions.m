#import "vclimatecellconditions.h"
#import "mclimatecurrentitemconditions.h"
#import "efont.h"

static CGFloat conditionstimerinterval = 0.03;

@interface vclimatecellconditions ()

@property(weak, nonatomic)mclimatecurrentitemconditions *model;

@end

@implementation vclimatecellconditions
{
    NSInteger currenttemp;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *tempnumber = [[UILabel alloc] init];
    [tempnumber setUserInteractionEnabled:NO];
    [tempnumber setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tempnumber setBackgroundColor:[UIColor clearColor]];
    [tempnumber setFont:[UIFont numericsize:80]];
    [tempnumber setTextColor:[UIColor blackColor]];
    [tempnumber setTextAlignment:NSTextAlignmentCenter];
    self.tempnumber = tempnumber;
    
    [self addSubview:tempnumber];
    
    NSDictionary *views = @{@"tempnumber":tempnumber};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[tempnumber]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[tempnumber(120)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.timer invalidate];
}

#pragma mark functionality

-(void)tick:(NSTimer*)timer
{
    currenttemp++;
    
    if(currenttemp >= self.model.conditions.temp)
    {
        currenttemp = self.model.conditions.temp;
        [timer invalidate];
    }
    
    [self print];
}

-(void)print
{
    NSString *string = [NSString stringWithFormat:NSLocalizedString(@"vclimate_conditions_temp", nil), @(currenttemp)];
    [self.tempnumber setText:string];
}

#pragma mark -
#pragma mark climate cell

-(void)config:(mclimatecurrentitemconditions*)model
{
    self.model = model;
    currenttemp = 0;
    
    [self print];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:conditionstimerinterval target:self selector:@selector(tick:) userInfo:nil repeats:YES];
}

@end