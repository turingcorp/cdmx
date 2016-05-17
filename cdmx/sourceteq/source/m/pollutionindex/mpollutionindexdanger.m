#import "mpollutionindexdanger.h"
#import "ecolor.h"

@implementation mpollutionindexdanger

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_orange];
    self.name = NSLocalizedString(@"mpollution_index_danger", nil);
    
    return self;
}

#pragma mark -
#pragma mark index

-(NSString*)recommendations
{
    NSDictionary *allrecom = [self allrecomendations];
    NSString *string = allrecom[@"danger"];
    
    return string;
}

@end