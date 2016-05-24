#import "mradiationaboutsection.h"

@interface mradiationaboutitem ()

-(instancetype)init:(mradiation*)index;

@end

@interface mradiationaboutsection ()

@property(strong, nonatomic, readwrite)NSArray<mradiationaboutitem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *info;

@end

@implementation mradiationaboutsection

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    self.name = dictionary[@"name"];
    self.info = dictionary[@"info"];
    
    NSMutableArray<mradiationaboutitem*> *items = [NSMutableArray array];
    NSArray<NSNumber*> *rawitems = dictionary[@"items"];
    NSInteger countitems = rawitems.count;
    
    for(NSUInteger indexitem = 0; indexitem < countitems; indexitem++)
    {
        NSNumber *numberitem = rawitems[indexitem];
        mradiation *index = [mradiation points:numberitem.integerValue];
        mradiationaboutitem *item = [[mradiationaboutitem alloc] init:index];
        
        [items addObject:item];
    }
    
    self.items = items;
    
    return self;
}

@end