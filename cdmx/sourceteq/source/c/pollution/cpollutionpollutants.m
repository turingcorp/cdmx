#import "cpollutionpollutants.h"
#import "vpollutionpollutants.h"

@interface cpollutionpollutants ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionpollutant*> *items;
@property(strong, nonatomic)vpollutionpollutants *view;

@end

@implementation cpollutionpollutants

@dynamic view;

-(instancetype)init:(NSArray<mpollutionpollutant*>*)items
{
    self = [super init];
    self.items = items;
    
    return self;
}

-(void)loadView
{
    self.view = [[vpollutionpollutants alloc] init:self];
}

@end