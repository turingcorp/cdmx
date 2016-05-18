#import "mpollutionindexacceptable.h"
#import "ecolor.h"

@interface mpollutionindex ()

@property(strong, nonatomic, readwrite)UIColor *color;
@property(copy, nonatomic, readwrite)NSString *name;
@property(assign, nonatomic, readwrite)NSInteger points;

@end

@implementation mpollutionindexacceptable

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_green];
    self.name = NSLocalizedString(@"mpollution_index_acceptable", nil);
    
    return self;
}

#pragma mark -
#pragma mark index

-(NSString*)recommendations
{
    NSDictionary *allrecom = [self allrecomendations];
    NSString *string = allrecom[@"acceptable"];
    
    return string;
}

@end