#import "vradiationreactor.h"
#import "ecolor.h"

static CGFloat const loadingtimerinterval = 0.04;
static CGFloat const radiationtimerinterval = 0.015;
static CGFloat const loadingreactorradius = 0.7;
static CGFloat const radiationlinewidth = 6;
static NSInteger const reactorheight = 250;

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
    
    vradiationreactorsun *loadingreactor = [[vradiationreactorsun alloc] init];
    [loadingreactor update:modelloadingreactor];
    
    vradiationreactorsun *reactor = [[vradiationreactorsun alloc] init];
    [reactor setHidden:YES];
    
    self.loadingreactor = loadingreactor;
    self.modelloadingreactor = modelloadingreactor;
    self.reactor = reactor;
    
    [self addSubview:basereactor];
    [self addSubview:loadingreactor];
    [self addSubview:reactor];
    
    NSDictionary *views = @{@"basereactor":basereactor, @"loadingreactor":loadingreactor, @"reactor":reactor};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[basereactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[basereactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[loadingreactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[loadingreactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[reactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[reactor]-0-|" options:0 metrics:metrics views:views]];
    
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
                                          [welf.loadingreactor removeFromSuperview];
                                          [welf.reactor update:modelreactor];
                                          [welf.reactor setHidden:NO];
                                          welf.timer = [NSTimer scheduledTimerWithTimeInterval:radiationtimerinterval target:welf selector:@selector(tick:) userInfo:nil repeats:YES];
                                      });
                   });
    
}

@end