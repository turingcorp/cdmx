#import "vradiationreactor.h"
#import "ecolor.h"

static CGFloat const timerinterval = 0.04;
static CGFloat const loadingreactorradius = 0.7;
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
    
    self.loadingreactor = loadingreactor;
    self.modelloadingreactor = modelloadingreactor;
    
    [self addSubview:basereactor];
    [self addSubview:loadingreactor];
    
    NSDictionary *views = @{@"basereactor":basereactor, @"loadingreactor":loadingreactor};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[basereactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[basereactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[loadingreactor]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[loadingreactor]-0-|" options:0 metrics:metrics views:views]];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timerinterval target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
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

-(void)tick:(NSTimer*)timer
{
    self.modelloadingreactor.startingradius += self.modelloadingreactor.raywidth;
    self.modelloadingreactor.endingradius = self.modelloadingreactor.startingradius + loadingreactorradius;
    [self.loadingreactor update:self.modelloadingreactor];
}

@end