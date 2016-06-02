#import "vecobicicell.h"
#import "efont.h"
#import "ecolor.h"

@implementation vecobicicell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *labelname = [[UILabel alloc] init];
    [labelname setUserInteractionEnabled:NO];
    [labelname setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelname setBackgroundColor:[UIColor clearColor]];
    [labelname setFont:[UIFont regularsize:13]];
    self.labelname = labelname;
    
    UILabel *labelnumber = [[UILabel alloc] init];
    [labelnumber setBackgroundColor:[UIColor clearColor]];
    [labelnumber setUserInteractionEnabled:NO];
    [labelnumber setFont:[UIFont regularsize:11]];
    [labelnumber setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.labelnumber = labelnumber;
    
    [self addSubview:labelnumber];
    [self addSubview:labelname];
    
    NSDictionary *views = @{@"labelnumber":labelnumber, @"labelname":labelname};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelname]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelnumber]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-6-[labelnumber(13)]-0-[labelname(15)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mecobiciitem*)model
{
    NSString *stationnumber = [NSString stringWithFormat:@"%@", model.stationid];
    
    [self.labelname setText:model.name];
    [self.labelnumber setText:stationnumber];
    [self hover];
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
    }
    else
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.labelnumber setTextColor:[UIColor blackColor]];
        [self.labelname setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    }
}

@end