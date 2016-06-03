#import "mecobici.h"
#import "genericconstants.h"

@interface mecobici ()

@property(strong, nonatomic, readwrite)NSArray<mecobiciitem*> *items;
@property(weak, nonatomic, readwrite)NSArray<mecobiciitemannotation*> *modelannotations;

@end

@implementation mecobici

-(instancetype)init:(NSArray<mdbecobicistation*>*)stations
{
    self = [super init];
    
    NSMutableArray<mecobiciitem*> *items = [NSMutableArray array];
    NSUInteger countstations = stations.count;
    
    for(NSUInteger indexstation = 0; indexstation < countstations; indexstation++)
    {
        mdbecobicistation *dbmodel = stations[indexstation];
        mecobiciitem *item = [[mecobiciitem alloc] init:dbmodel];
        [items addObject:item];
    }
    
    self.items = items;
    
    return self;
}

-(NSArray<mecobiciitemannotation*>*)annotations
{
    NSMutableArray<mecobiciitemannotation*> *annotations = [NSMutableArray array];
    
    for(mecobiciitem *item in self.items)
    {
        mecobiciitemannotation *annotation = [item asannotation];
        [annotations addObject:annotation];
    }
    
    self.modelannotations = annotations;
    
    return annotations;
}

#pragma mark public

-(mecobiciitem*)closertolat:(CGFloat)lat lon:(CGFloat)lon
{
    mecobiciitem *closer;
    NSUInteger countitems = self.items.count;
    CGFloat distance = 0;
    
    for(NSUInteger indexitem = 0; indexitem < countitems; indexitem++)
    {
        mecobiciitem *item = self.items[indexitem];
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

@end