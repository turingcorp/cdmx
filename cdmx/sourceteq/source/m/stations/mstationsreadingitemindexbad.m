#import "mstationsreadingitemindexbad.h"
#import "mstationsreadingitemindexactivitylimited.h"
#import "mstationsreadingitemindexactivityverylimited.h"

@implementation mstationsreadingitemindexbad

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.color = [UIColor pollution_orange];
    self.outdoors = [[mstationsreadingitemindexactivitylimited alloc] init];
    self.exercise = [[mstationsreadingitemindexactivityverylimited alloc] init];
    self.sensible = [[mstationsreadingitemindexactivityverylimited alloc] init];
    
    return self;
}

@end