#import "mpollutionindexnodata.h"
#import "ecolor.h"

@interface mpollutionindex ()

@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *name;
@property(assign, nonatomic, readwrite)NSInteger points;

@end

@implementation mpollutionindexnodata

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_gray];
    self.name = NSLocalizedString(@"mpollution_index_nodata", nil);
    
    return self;
}

#pragma mark -
#pragma mark index

-(NSString*)recommendations
{
    NSDictionary *allrecom = [self allrecomendations];
    NSString *string = allrecom[@"nodata"];
    
    return string;
}

@end