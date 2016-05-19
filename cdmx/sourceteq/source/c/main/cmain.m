#import "cmain.h"
#import "cpollution.h"

@implementation cmain

+(instancetype)singleton
{
    static cmain *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    cpollution *controller = [[cpollution alloc] init];
    self = [super initWithRootViewController:controller];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
}

#pragma mark public

-(void)changecontroller:(UIViewController*)controller animated:(BOOL)animated forward:(BOOL)forward
{
    
}

@end