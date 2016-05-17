#import "mpollutionindexfallout.h"
#import "ecolor.h"

@implementation mpollutionindexfallout

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_violet];
    self.name = NSLocalizedString(@"mpollution_index_fallout", nil);
    
    return self;
}

#pragma mark -
#pragma mark index

-(NSString*)recommendations
{
    NSDictionary *allrecom = [self allrecomendations];
    NSString *string = allrecom[@"fallout"];
    
    return string;
}

@end