#import "cpollutionpollutantdetail.h"
#import "vpollutionpollutantdetail.h"

@interface cpollutionpollutantdetail ()

@property(strong, nonatomic, readwrite)mpollutionpollutant *model;
@property(strong, nonatomic)vpollutionpollutantdetail *view;

@end

@implementation cpollutionpollutantdetail

@dynamic view;

-(instancetype)init:(mpollutionpollutant*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)loadView
{
    self.view = [[vpollutionpollutantdetail alloc] init:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view viewappear];
}

@end