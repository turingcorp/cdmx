#import "cadminmetro.h"
#import "vadminmetro.h"

@interface cadminmetro ()

@property(strong, nonatomic)vadminmetro *view;

@end

@implementation cadminmetro

@dynamic view;

-(void)loadView
{
    self.view = [[vadminmetro alloc] init:self];
}

@end