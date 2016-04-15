#import "mstationsreadingitemindexextreme.h"
#import "mstationsreadingitemindexactivitynone.h"

@implementation mstationsreadingitemindexextreme

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.color = [UIColor pollution_violet];
    self.name = NSLocalizedString(@"air_index_extreme", nil);
    self.outdoors = [[mstationsreadingitemindexactivitynone alloc] init];
    self.exercise = [[mstationsreadingitemindexactivitynone alloc] init];
    self.sensible = [[mstationsreadingitemindexactivitynone alloc] init];
    
    return self;
}

@end