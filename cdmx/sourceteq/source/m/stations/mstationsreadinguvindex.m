#import "mstationsreadinguvindex.h"
#import "mstationsreadinguvindexlow.h"
#import "mstationsreadinguvindexmid.h"
#import "mstationsreadinguvindexhigh.h"
#import "mstationsreadinguvindexveryhigh.h"
#import "mstationsreadinguvindexextreme.h"

@implementation mstationsreadinguvindex

+(instancetype)indexwithnumber:(NSInteger)number
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
    else if(number < 11)
    {
        index = [[mstationsreadinguvindexveryhigh alloc] init:number];
    }
    else
    {
        index = [[mstationsreadinguvindexextreme alloc] init:number];
    }
    
    return index;
}

-(instancetype)init:(NSInteger)number
{
    self = [super init];
    self.number = number;
    
    return self;
}

@end