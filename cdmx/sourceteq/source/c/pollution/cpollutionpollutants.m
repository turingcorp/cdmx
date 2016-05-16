#import "cpollutionpollutants.h"
#import "vpollutionpollutants.h"

@interface cpollutionpollutants ()

@property(strong, nonatomic)vpollutionpollutants *view;

@end

@implementation cpollutionpollutants

@dynamic view;

-(void)loadView
{
    self.view = [[vpollutionpollutants alloc] init:self];
}

@end