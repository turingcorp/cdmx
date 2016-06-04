#import "vecobicicell.h"
#import "efont.h"
#import "ecolor.h"

@implementation vecobicicell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UIImageView *circle = [[UIImageView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setClipsToBounds:YES];
    [circle setContentMode:UIViewContentModeScaleAspectFit];
    [circle setImage:[[UIImage imageNamed:@"generic_halo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [circle setTintColor:[UIColor main]];
    
    UILabel *labelname = [[UILabel alloc] init];
    [labelname setUserInteractionEnabled:NO];
    [labelname setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelname setBackgroundColor:[UIColor clearColor]];
    [labelname setFont:[UIFont regularsize:13]];
    self.labelname = labelname;
    
    UILabel *labelnumber = [[UILabel alloc] init];
    [labelnumber setBackgroundColor:[UIColor clearColor]];
    [labelnumber setUserInteractionEnabled:NO];
    [labelnumber setFont:[UIFont boldsize:11]];
    [labelnumber setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labelnumber = labelnumber;
    
    UILabel *labelkm = [[UILabel alloc] init];
    [labelkm setBackgroundColor:[UIColor clearColor]];
    [labelkm setUserInteractionEnabled:NO];
    [labelkm setFont:[UIFont regularsize:11]];
    [labelkm setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labelkm = labelkm;
    
    [self addSubview:circle];
    [self addSubview:labelnumber];
    [self addSubview:labelname];
    [self addSubview:labelkm];
    
    NSDictionary *views = @{@"labelnumber":labelnumber, @"labelname":labelname, @"labelkm":labelkm, @"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[circle(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelname]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelnumber(27)]-0-[labelkm]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-6-[labelnumber(13)]-0-[labelname(15)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-6-[labelkm(13)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mecobiciitem*)model
{
    NSString *stationnumber = [NSString stringWithFormat:@"%@", model.stationid];
    
    [self.labelname setText:model.name];
    [self.labelnumber setText:stationnumber];
    [self hover];
    
    if(model.kilometers > 0)
    {
        NSNumberFormatter *numberformatter = [[NSNumberFormatter alloc] init];
        [numberformatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberformatter setMaximumFractionDigits:2];
        NSString *stringnum = [numberformatter stringFromNumber:@(model.kilometers)];
        NSString *stringkm = [NSString stringWithFormat:NSLocalizedString(@"vecobici_cell_km", nil), stringnum];
        
        [self.labelkm setText:stringkm];
    }
    else
    {
        [self.labelkm setText:@""];
    }
}

#pragma mark -
#pragma mark col cell

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setBackgroundColor:[UIColor main]];
        [self.labelnumber setTextColor:[UIColor whiteColor]];
        [self.labelname setTextColor:[UIColor whiteColor]];
        [self.labelkm setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.labelnumber setTextColor:[UIColor colorWithWhite:0.65 alpha:1]];
        [self.labelname setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
        [self.labelkm setTextColor:[UIColor blackColor]];
    }
}

@end