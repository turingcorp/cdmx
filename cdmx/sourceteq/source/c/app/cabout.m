#import "cabout.h"
#import "vabout.h"
#import "cmain.h"

@interface cabout ()

@property(strong, nonatomic)vabout *view;

@end

@implementation cabout

@dynamic view;

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