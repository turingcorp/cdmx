#import "mpollutionindexwarning.h"
#import "ecolor.h"

@implementation mpollutionindexwarning

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_yellow];
    self.name = NSLocalizedString(@"mpollution_index_warning", nil);
    
    return self;
}

#pragma mark -
#pragma mark index

-(NSString*)recommendations
{
    NSDictionary *allrecom = [self allrecomendations];
    NSString *string = allrecom[@"warning"];
    
    return string;
}

@end