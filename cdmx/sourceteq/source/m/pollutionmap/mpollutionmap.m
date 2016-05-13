#import "mpollutionmap.h"

@interface mpollutionmap ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionmapitem*> *items;

@end

@implementation mpollutionmap

-(instancetype)init:(mpollution*)model
{
    self = [super init:model];
    
    NSUInteger countdistricts = model.modeldistricts.count;
    
    for(NSUInteger indexdistrict = 0; indexdistrict < countdistricts; indexdistrict++)
    {
        
    }
    
    return self;
}

@end