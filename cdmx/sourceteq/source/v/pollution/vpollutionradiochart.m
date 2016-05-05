#import "vpollutionradiochart.h"
#import "ecolor.h"
#import "efont.h"

static NSInteger const radiochartwidth_2 = 80;
static NSInteger const radiochartlinewidth = 8;

@implementation vpollutionradiochart

-(instancetype)init
{
    self = [super init];
    self.size_2 = radiochartwidth_2;
    self.linewidth = radiochartlinewidth;
    
    UILabel *labelpoints = [[UILabel alloc] init];
    [labelpoints setUserInteractionEnabled:NO];
    [labelpoints setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelpoints setTextAlignment:NSTextAlignmentCenter];
    [labelpoints setFont:[UIFont numericsize:50]];
    [labelpoints setTextColor:[UIColor blackColor]];
    [labelpoints setBackgroundColor:[UIColor clearColor]];
    self.labelpoints = labelpoints;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont boldsize:12]];
    [labeltitle setText:NSLocalizedString(@"vpollution_radio_chart_title", nil)];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    self.labeltitle = labeltitle;
    
    [self addSubview:labelpoints];
    [self addSubview:labeltitle];
    
    NSDictionary *views = @{@"labelpoints":labelpoints, @"labeltitle":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelpoints]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelpoints]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labeltitle(20)]-53-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    NSInteger height = (radiochartwidth_2 + radiochartlinewidth) * 2;
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, height);
    
    return size;
}

#pragma mark public

-(void)render:(mpollutionindex*)index
{
    self.basecolor = [UIColor background];
    self.higlightcolor = index.color;
    self.currentpoints = index.points;
    self.maxpoints = [mpollutionindex maxpoints];
    [self render];
    
    [self.labelpoints setText:index.description];
    [self.labeltitle setTextColor:index.color];
}

@end