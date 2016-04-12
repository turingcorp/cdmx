#import "cair.h"
#import "vair.h"

@interface cair ()

@property(strong, nonatomic)vair *view;

@end

@implementation cair

@dynamic view;

-(void)loadView
{
    self.view = [[vair alloc] init:self];
}

@end