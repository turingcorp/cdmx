#import "mecobici.h"

@interface mecobici ()

@property(strong, nonatomic, readwrite)NSArray<mecobiciitem*> *items;
@property(weak, nonatomic, readwrite)NSArray<mecobiciitemannotation*> *modelannotations;

@end

@implementation mecobici

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