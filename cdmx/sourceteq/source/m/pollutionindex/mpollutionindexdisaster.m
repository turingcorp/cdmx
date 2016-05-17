#import "mpollutionindexdisaster.h"
#import "ecolor.h"

@implementation mpollutionindexdisaster

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_red];
    self.name = NSLocalizedString(@"mpollution_index_disaster", nil);
    
    return self;
}

#pragma mark -
#pragma mark index

-(NSString*)recommendations
{
    NSDictionary *allrecom = [self allrecomendations];
    NSString *string = allrecom[@"disaster"];
    
    return string;
}

@end