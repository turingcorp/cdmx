#import "mpollutionmap.h"

static CGFloat const kilometersperdegree = 111.1;

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
        model.latitude = district.latitude.floatValue;
        model.longitude = district.longitude.floatValue;
        
        [items addObject:model];
    }
    
    self.items = items;
    
    return self;
}

#pragma mark public

-(mpollutionmapitem*)closertolat:(CGFloat)lat lon:(CGFloat)lon
{
    mpollutionmapitem *closer;
    NSUInteger countitems = self.items.count;
    CGFloat distance = 0;
    
    for(NSUInteger indexitem = 0; indexitem < countitems; indexitem++)
    {
        mpollutionmapitem *item = self.items[indexitem];
        CGFloat itemlat = item.latitude;
        CGFloat itemlon = item.longitude;
        CGFloat deltalat = lat - itemlat;
        CGFloat deltalon = lon - itemlon;
        CGFloat deltalat2 = deltalat * deltalat;
        CGFloat deltalon2 = deltalon * deltalon;
        CGFloat deltasum = deltalat2 + deltalon2;
        CGFloat delta = sqrtf(deltasum);
        
        if(indexitem)
        {
            if(delta < distance)
            {
                closer = item;
                distance = delta;
            }
        }
        else
        {
            closer = item;
            distance = delta;
        }
    }
    
    CGFloat kilometers = distance * kilometersperdegree;
    closer.kilometers = kilometers;
    
    return closer;
}

@end