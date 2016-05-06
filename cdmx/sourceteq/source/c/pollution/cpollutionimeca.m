#import "cpollutionimeca.h"
#import "vpollutionimeca.h"

@interface cpollutionimeca ()

@property(strong, nonatomic)vpollutionimeca *view;

@end

@implementation cpollutionimeca

@dynamic view;

-(void)loadView
{
    self.view = [[vpollutionimeca alloc] init:self];
}

@end