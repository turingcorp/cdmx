#import "vradiationreactor.h"
#import "efont.h"
#import "ecolor.h"

static CGFloat const loadingtimerinterval = 0.04;
static CGFloat const radiationtimerinterval = 0.015;
static CGFloat const loadingreactorradius = 0.7;
static CGFloat const radiationlinewidth = 6;
static NSInteger const reactorheight = 260;

@implementation vradiationreactor

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    mradiationreactor *modelbasereactor = [[mradiationreactor alloc] init];
    vradiationreactorsun *basereactor = [[vradiationreactorsun alloc] init];
    [basereactor update:modelbasereactor];
    
    mradiationreactor *modelloadingreactor = [[mradiationreactor alloc] init];
    modelloadingreactor.sunradius = modelloadingreactor.sunradius + modelloadingreactor.linewidth;
    modelloadingreactor.endingradius = modelloadingreactor.startingradius + loadingreactorradius;
    modelloadingreactor.color = [UIColor main];
    self.modelloadingreactor = modelloadingreactor;
    
    vradiationreactorsun *loadingreactor = [[vradiationreactorsun alloc] init];
    [loadingreactor update:modelloadingreactor];
    self.loadingreactor = loadingreactor;
    
    vradiationreactorsun *reactor = [[vradiationreactorsun alloc] init];
    [reactor setHidden:YES];
    self.reactor = reactor;
    
    UILabel *labelindex = [[UILabel alloc] init];
    [labelindex setBackgroundColor:[UIColor clearColor]];
    [labelindex setUserInteractionEnabled:NO];
    [labelindex setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindex setTextAlignment:NSTextAlignmentCenter];
    [labelindex setFont:[UIFont numericsize:60]];
    [labelindex setTextColor:[UIColor blackColor]];
    self.labelindex = labelindex;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setFont:[UIFont regularsize:13]];
    [labeltitle setTextColor:[UIColor main]];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setAlpha:0];
    [labeltitle setText:NSLocalizedString(@"vradiation_index_title", nil)];
    self.labeltitle = labeltitle;
    
    UILabel *labelsubtitle = [[UILabel alloc] init];
    [labelsubtitle setUserInteractionEnabled:NO];
    [labelsubtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelsubtitle setBackgroundColor:[UIColor clearColor]];
    [labelsubtitle setFont:[UIFont regularsize:15]];
    [labelsubtitle setTextColor:[UIColor second]];
    [labelsubtitle setTextAlignment:NSTextAlignmentCenter];
    [labelsubtitle setAlpha:0];
    [labelsubtitle setText:NSLocalizedString(@"vradiation_index_subtitle", nil)];
    self.labelsubtitle = labelsubtitle;
    
    [self addSubview:basereactor];
    [self addSubview:loadingreactor];
    [self addSubview:reactor];
    [self addSubview:labelsubtitle];
    [self addSubview:labeltitle];
    [self addSubview:labelindex];
    
    NSDictionary *views = @{@"basereactor":basereactor, @"loadingreactor":loadingreactor, @"reactor":reactor, @"labelindex":labelindex, @"labeltitle":labeltitle, @"labelsubtitle":labelsubtitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[basereactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[basereactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[loadingreactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[loadingreactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[reactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[reactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelindex]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelindex]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelsubtitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labeltitle(20)]-(-8)-[labelsubtitle(20)]-65-|" options:0 metrics:metrics views:views]];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:loadingtimerinterval target:self selector:@selector(tickloading:) userInfo:nil repeats:YES];
    
    return self;
}

-(void)dealloc
{
    [self.timer invalidate];
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, reactorheight);
    
    return size;
}

#pragma mark functionality

-(void)tickloading:(NSTimer*)timer
{
    self.modelloadingreactor.startingradius += self.modelloadingreactor.raywidth;
    self.modelloadingreactor.endingradius = self.modelloadingreactor.startingradius + loadingreactorradius;
    [self.loadingreactor update:self.modelloadingreactor];
}

-(void)tick:(NSTimer*)timer
{
    self.modelreactor.endingradius += self.modelreactor.raywidth + self.modelreactor.rayspacing;
    
    if(self.modelreactor.endingradius >= self.endingradius)
    {
        self.modelreactor.endingradius = self.endingradius;
        [timer invalidate];
    }
    
    [self.reactor update:self.modelreactor];
}

#pragma mark public

-(void)loadradiation:(mradiation*)model
{
    [self.timer invalidate];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       mradiationreactor *modelreactor = [[mradiationreactor alloc] init];
                       
                       CGFloat totalradius = fabs(modelreactor.startingradius - modelreactor.endingradius);
                       CGFloat maxradiation = [mradiation maxpoints];
                       CGFloat percentpoints = model.points / maxradiation;
                       CGFloat pointsradius = percentpoints * totalradius;
                       welf.endingradius = pointsradius + modelreactor.startingradius;
                       
                       modelreactor.sunradius = modelreactor.sunradius + radiationlinewidth;
                       modelreactor.endingradius = modelreactor.startingradius;
                       modelreactor.linewidth = radiationlinewidth;
                       modelreactor.color = model.color;
                       welf.modelreactor = modelreactor;

                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.labelindex setAlpha:0];
                                          [welf.labelindex setText:model.description];
                                          [welf.loadingreactor removeFromSuperview];
                                          [welf.reactor update:modelreactor];
                                          [welf.reactor setHidden:NO];
                                          welf.timer = [NSTimer scheduledTimerWithTimeInterval:radiationtimerinterval target:welf selector:@selector(tick:) userInfo:nil repeats:YES];
                                          
                                          [UIView animateWithDuration:1.5 animations:
                                           ^
                                           {
                                               [welf.labelindex setAlpha:1];
                                               [welf.labeltitle setAlpha:1];
                                               [welf.labelsubtitle setAlpha:1];
                                           }];
                                      });
                   });
    
}

@end