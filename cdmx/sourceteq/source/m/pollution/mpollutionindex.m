#import "mpollutionindex.h"
#import "mpollutionindexnodata.h"
#import "mpollutionindexacceptable.h"
#import "mpollutionindexwarning.h"
#import "mpollutionindexdanger.h"
#import "mpollutionindexdisaster.h"
#import "mpollutionindexfallout.h"

static NSInteger const maxpointsnodata = 1;
static NSInteger const maxpointsacceptable = 50;
static NSInteger const maxpointswarning = 100;
static NSInteger const maxpointsdanger = 150;
static NSInteger const maxpointsdisaster = 200;

@implementation mpollutionindex

+(instancetype)points:(NSInteger)points
{
    mpollutionindex *index;
    
    if(points < maxpointsnodata)
    {
        index = [[mpollutionindexnodata alloc] init];
    }
    else if(points < maxpointsacceptable)
    {
        index = [[mpollutionindexacceptable alloc] init];
    }
    else if(points < maxpointswarning)
    {
        index = [[mpollutionindexwarning alloc] init];
    }
    else if(points < maxpointsdanger)
    {
        index = [[mpollutionindexdanger alloc] init];
    }
    else if(points < maxpointsdisaster)
    {
        index = [[mpollutionindexdisaster alloc] init];
    }
    else
    {
        index = [[mpollutionindexfallout alloc] init];
    }
    
    return index;
}

@end