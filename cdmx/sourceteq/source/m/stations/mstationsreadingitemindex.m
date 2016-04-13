#import "mstationsreadingitemindex.h"

@implementation mstationsreadingitemindex

+(instancetype)indexwithpoints:(NSInteger)points
{
    mstationsreadinguvindex *index;
    
    if(number < 3)
    {
        index = [[mstationsreadinguvindexlow alloc] init:number];
    }
    else if(number < 6)
    {
        index = [[mstationsreadinguvindexmid alloc] init:number];
    }
    else if(number < 8)
    {
        index = [[mstationsreadinguvindexhigh alloc] init:number];
    }
    else if(number < 12)
    {
        index = [[mstationsreadinguvindexveryhigh alloc] init:number];
    }
    else
    {
        index = [[mstationsreadinguvindexextreme alloc] init:number];
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