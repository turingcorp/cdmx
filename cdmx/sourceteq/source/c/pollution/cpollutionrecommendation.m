#import "cpollutionrecommendation.h"
#import "vpollutionrecommendation.h"

@interface cpollutionrecommendation ()

@property(strong, nonatomic)vpollutionrecommendation *view;

@end

@implementation cpollutionrecommendation

@dynamic view;

-(instancetype)init:(mpollutionfrontitemoptionrecommendation*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)loadView
{
    self.view = [[vpollutionrecommendation alloc] init:self];
}

@end