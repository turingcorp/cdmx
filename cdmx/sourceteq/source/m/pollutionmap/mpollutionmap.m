#import "mpollutionmap.h"

@interface mpollutionmap ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionmapitem*> *items;

@end

@implementation mpollutionmap

-(instancetype)init:(mpollution*)model
{
    self = [super init:model];
    
    NSMutableArray<mpollutionmapitem*> *items = [NSMutableArray array];
    NSUInteger countdistricts = model.modeldistricts.count;
    
    for(NSUInteger indexdistrict = 0; indexdistrict < countdistricts; indexdistrict++)
    {
        mdbdistrict *district = model.modeldistricts[indexdistrict];
        mpollutionmapitem *model = [[mpollutionmapitem alloc] init];
        model.index = [mpollutionindex points:district.pollution.integerValue];
        model.name = district.name;
        model.latitude = district.latitude;
        model.longitude = district.longitude;
        
        [items addObject:model];
    }
    
    self.items = items;
    
    return self;
}

@end