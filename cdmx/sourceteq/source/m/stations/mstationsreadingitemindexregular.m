#import "mstationsreadingitemindexregular.h"
#import "mstationsreadingitemindexactivityperfect.h"
#import "mstationsreadingitemindexactivitylimited.h"

@implementation mstationsreadingitemindexregular

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.color = [UIColor pollution_yellow];
    self.outdoors = [[mstationsreadingitemindexactivityperfect alloc] init];
    self.exercise = [[mstationsreadingitemindexactivitylimited alloc] init];
    self.sensible = [[mstationsreadingitemindexactivitylimited alloc] init];
    
    return self;
}

@end