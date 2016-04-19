#import "cnodrive.h"
#import "vnodrive.h"
#import "cmain.h"

@interface cnodrive ()

@property(strong, nonatomic)vnodrive *view;

@end

@implementation cnodrive

@dynamic view;

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