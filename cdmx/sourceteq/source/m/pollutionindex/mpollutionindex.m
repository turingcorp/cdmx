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
        index = [[mpollutionindexnodata alloc] init:points];
    }
    else if(points < maxpointsacceptable)
    {
        index = [[mpollutionindexacceptable alloc] init:points];
    }
    else if(points < maxpointswarning)
    {
        index = [[mpollutionindexwarning alloc] init:points];
    }
    else if(points < maxpointsdanger)
    {
        index = [[mpollutionindexdanger alloc] init:points];
    }
    else if(points < maxpointsdisaster)
    {
        index = [[mpollutionindexdisaster alloc] init:points];
    }
    else
    {
        index = [[mpollutionindexfallout alloc] init:points];
    }
    
    return index;
}

+(NSInteger)maxpoints
{
    return maxpointsdisaster;
}

-(instancetype)init:(NSInteger)points
{
    self = [super init];
    self.points = points;
    
    return self;
}

-(NSString*)description
{
    NSString *string = [NSString stringWithFormat:@"%@", @(self.points)];
    
    return string;
}

#pragma mark public

-(NSDictionary*)allrecomendations
{
    NSDictionary *recom = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"recommendations" withExtension:@"plist"]];
    
    return recom;
}

-(NSString*)recommendations
{
    return @"";
}

@end