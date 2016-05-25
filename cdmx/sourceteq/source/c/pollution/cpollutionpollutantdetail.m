#import "cpollutionpollutantdetail.h"

@interface cpollutionpollutantdetail ()

@property(strong, nonatomic, readwrite)mpollutionpollutant *model;

@end

@implementation cpollutionpollutantdetail

-(instancetype)init:(mpollutionpollutant*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

@end