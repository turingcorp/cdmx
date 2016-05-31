#import "mecobici.h"

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

@end