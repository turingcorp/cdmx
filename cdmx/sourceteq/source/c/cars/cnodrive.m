#import "cnodrive.h"
#import "vnodrive.h"
#import "cmain.h"
#import "analytics.h"

@interface cnodrive ()

@property(strong, nonatomic)vnodrive *view;

@end

@implementation cnodrive

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[analytics singleton] trackscreen:ga_screen_nodrive];
}

-(void)loadView
{
    self.view = [[vnodrive alloc] init:self];
}

#pragma mark public

-(void)openmenu
{
    [[cmain singleton].pages pagemenu];
}

@end