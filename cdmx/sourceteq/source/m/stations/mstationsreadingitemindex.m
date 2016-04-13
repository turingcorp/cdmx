#import "mstationsreadingitemindex.h"
#import "mstationsreadingitemindexgood.h"
#import "mstationsreadingitemindexregular.h"
#import "mstationsreadingitemindexbad.h"
#import "mstationsreadingitemindexverybad.h"
#import "mstationsreadingitemindexextreme.h"

@implementation mstationsreadingitemindex

+(instancetype)indexwithpoints:(NSInteger)points
{
    mstationsreadingitemindex *index;
    
    if(points < 51)
    {
        index = [[mstationsreadingitemindexgood alloc] init:points];
    }
    else if(points < 101)
    {
        index = [[mstationsreadingitemindexregular alloc] init:points];
    }
    else if(points < 151)
    {
        index = [[mstationsreadingitemindexbad alloc] init:points];
    }
    else if(points < 201)
    {
        index = [[mstationsreadingitemindexverybad alloc] init:points];
    }
    else
    {
        index = [[mstationsreadingitemindexextreme alloc] init:points];
    }
    
    return index;
}

-(instancetype)init:(NSInteger)points
{
    self = [super init];
    self.points = points;
    
    return self;
}

@end