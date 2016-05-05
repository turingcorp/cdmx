#import "vpollutionradiochart.h"
#import "ecolor.h"
#import "efont.h"

static NSInteger const radiochartwidth_2 = 80;
static NSInteger const radiochartlinewidth = 8;

@implementation vpollutionradiochart

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init];
    self.basecolor = [UIColor background];
    self.higlightcolor = index.color;
    self.size_2 = radiochartwidth_2;
    self.linewidth = radiochartlinewidth;
    self.currentpoints = index.points;
    self.maxpoints = [mpollutionindex maxpoints];
    [self render];
    
    UILabel *labelpoints = [[UILabel alloc] init];
    [labelpoints setUserInteractionEnabled:NO];
    [labelpoints setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelpoints setTextAlignment:NSTextAlignmentCenter];
    [labelpoints setFont:[UIFont numericsize:50]];
    [labelpoints setTextColor:[UIColor blackColor]];
    [labelpoints setText:index.description];
    [labelpoints setBackgroundColor:[UIColor clearColor]];
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont boldsize:12]];
    [labeltitle setTextColor:index.color];
    [labeltitle setText:NSLocalizedString(@"vpollution_radio_chart_title", nil)];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    
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

@end