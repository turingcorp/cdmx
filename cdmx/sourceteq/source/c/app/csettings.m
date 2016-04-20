#import "csettings.h"
#import "vsettings.h"
#import "cmain.h"
#import "analytics.h"

@interface csettings ()

@property(strong, nonatomic)vsettings *view;

@end

@implementation csettings

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[analytics singleton] trackscreen:ga_screen_settings];
}

-(void)loadView
{
    self.view = [[vsettings alloc] init:self];
}

#pragma mark public

-(void)openmenu
{
    [[cmain singleton].pages pagemenu];
}

@end