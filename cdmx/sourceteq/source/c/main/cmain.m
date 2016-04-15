#import "cmain.h"

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
    cpages *pages = [[cpages alloc] init];
    self.pages = pages;
    self = [super initWithRootViewController:pages];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
}

@end