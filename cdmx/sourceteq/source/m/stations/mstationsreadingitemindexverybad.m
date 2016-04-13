#import "mstationsreadingitemindexverybad.h"
#import "mstationsreadingitemindexactivityverylimited.h"
#import "mstationsreadingitemindexactivitynone.h"

@implementation mstationsreadingitemindexverybad

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.color = [UIColor pollution_red];
    self.outdoors = [[mstationsreadingitemindexactivityverylimited alloc] init];
    self.exercise = [[mstationsreadingitemindexactivitynone alloc] init];
    self.sensible = [[mstationsreadingitemindexactivitynone alloc] init];
    
    return self;
}

@end