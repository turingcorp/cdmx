#import "cabout.h"
#import "vabout.h"
#import "cmain.h"
#import "analytics.h"

@interface cabout ()

@property(strong, nonatomic)vabout *view;

@end

@implementation cabout

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[analytics singleton] trackscreen:ga_screen_about];
}

-(void)loadView
{
    self.view = [[vabout alloc] init:self];
}

#pragma mark public

-(void)openmenu
{
    [[cmain singleton].pages pagemenu];
}

@end