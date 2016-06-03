#import "mpollutionmap.h"
#import "genericconstants.h"

@interface mpollutionmap ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionmapitem*> *items;
@property(weak, nonatomic, readwrite)NSArray<mpollutionmapitemannotation*> *modelannotations;

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
        CGFloat kilometers = delta * kilometersperdegree;
        item.kilometers = kilometers;
        
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
    
    closer.closer = YES;
    
    return closer;
}

-(NSArray<mpollutionmapitemannotation*>*)annotations
{
    NSMutableArray<mpollutionmapitemannotation*> *annotations = [NSMutableArray array];
    
    for(mpollutionmapitem *item in self.items)
    {
        mpollutionmapitemannotation *annotation = [item asannotation];
        [annotations addObject:annotation];
    }
    
    self.modelannotations = annotations;
    
    return annotations;
}

@end