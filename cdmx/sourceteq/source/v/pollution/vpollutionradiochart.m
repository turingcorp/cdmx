#import "vpollutionradiochart.h"
#import "ecolor.h"
#import "efont.h"

static CGFloat const timerinterval = 0.01;
static NSInteger const aftertimer = 400;
static NSInteger const timerdelta = 2;
static NSInteger const radiochartwidth_2 = 80;
static NSInteger const radiochartlinewidth = 8;

@implementation vpollutionradiochart

-(instancetype)init
{
    self = [super init];
    self.size_2 = radiochartwidth_2;
    self.linewidth = radiochartlinewidth;
    self.basecolor = [UIColor background];
    self.maxpoints = [mpollutionindex maxpoints];
    
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
    
    UILabel *labelstatus = [[UILabel alloc] init];
    [labelstatus setBackgroundColor:[UIColor clearColor]];
    [labelstatus setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelstatus setUserInteractionEnabled:NO];
    [labelstatus setTextAlignment:NSTextAlignmentCenter];
    [labelstatus setFont:[UIFont regularsize:12]];
    [labelstatus setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    self.labelstatus = labelstatus;
    
    [self addSubview:labelpoints];
    [self addSubview:labeltitle];
    [self addSubview:labelstatus];
    
    NSDictionary *views = @{@"labelpoints":labelpoints, @"labeltitle":labeltitle, @"labelstatus":labelstatus};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelpoints]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelpoints]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelstatus]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labeltitle(20)]-(-8)-[labelstatus(20)]-42-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [self.timer invalidate];
}

-(CGSize)intrinsicContentSize
{
    NSInteger height = (radiochartwidth_2 + radiochartlinewidth) * 2;
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, height);
    
    return size;
}

#pragma mark functionality

-(void)tick:(NSTimer*)timer
{
    self.currentpoints += timerdelta;
    
    if(self.currentpoints > self.index.points)
    {
        self.currentpoints = self.index.points;
        [timer invalidate];
    }
    
    [self print];
}

-(void)print
{
    NSString *strindex = [NSString stringWithFormat:@"%@", @(self.currentpoints)];
    
    [self render];
    [self.labelpoints setText:strindex];
}

#pragma mark public

-(void)render:(mpollutionindex*)index
{
    [self.timer invalidate];
    self.index = index;
    self.higlightcolor = index.color;
    self.currentpoints = 0;
    [self.labeltitle setTextColor:index.color];
    [self.labelstatus setText:index.name];
    [self print];
    
    __weak typeof(self) welf = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * aftertimer), dispatch_get_main_queue(),
                   ^
                   {
                       welf.timer = [NSTimer scheduledTimerWithTimeInterval:timerinterval target:welf selector:@selector(tick:) userInfo:nil repeats:YES];
                   });
}

@end