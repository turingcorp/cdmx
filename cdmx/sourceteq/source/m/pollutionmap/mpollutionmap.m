#import "mpollutionmap.h"

@interface mpollutionmap ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionmapitem*> *items;

@end

@implementation mpollutionmap

-(instancetype)init:(mpollution*)model
{
    self = [super init:model];
    
    
    
    return self;
}

@end