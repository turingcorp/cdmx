#import "csettings.h"
#import "vsettings.h"
#import "cmain.h"

@interface csettings ()

@property(strong, nonatomic)vsettings *view;

@end

@implementation csettings

@dynamic view;

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