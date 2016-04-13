#import "mstationsreadingitemindexgood.h"
#import "mstationsreadingitemindexactivityperfect.h"

@implementation mstationsreadingitemindexgood

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.color = [UIColor pollution_green];
    self.outdoors = [[mstationsreadingitemindexactivityperfect alloc] init];
    self.exercise = [[mstationsreadingitemindexactivityperfect alloc] init];
    self.sensible = [[mstationsreadingitemindexactivityperfect alloc] init];
    
    return self;
}

@end