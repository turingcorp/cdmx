#import "vradiationreactor.h"
#import "vradiationreactorsun.h"

static CGFloat const timerinterval = 0.02;
static NSInteger const reactorheight = 250;

@implementation vradiationreactor

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    vradiationreactorsun *sun = [[vradiationreactorsun alloc] init];
    
    [self addSubview:sun];
    
    NSDictionary *views = @{@"sun":sun};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[sun]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[sun]-0-|" options:0 metrics:metrics views:views]];
    
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

-(void)drawRect:(CGRect)rect
{
    
}

#pragma mark functionality

-(void)tick:(NSTimer*)timer
{
    [self setNeedsDisplay];
}

@end