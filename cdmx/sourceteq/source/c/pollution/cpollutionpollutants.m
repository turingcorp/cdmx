#import "cpollutionpollutants.h"
#import "vpollutionpollutants.h"
#import "cpollutionpollutantdetail.h"
#import "cmain.h"

@interface cpollutionpollutants ()

@property(weak, nonatomic)cmain *parentViewController;
@property(strong, nonatomic)vpollutionpollutants *view;
@property(strong, nonatomic, readwrite)NSArray<mpollutionpollutant*> *items;

@end

@implementation cpollutionpollutants

@dynamic parentViewController;
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

#pragma mark public

-(void)detail:(mpollutionpollutant*)model
{
    cpollutionpollutantdetail *controller = [[cpollutionpollutantdetail alloc] init:model];
    [self.parentViewController pushcontroller:controller];
}

@end