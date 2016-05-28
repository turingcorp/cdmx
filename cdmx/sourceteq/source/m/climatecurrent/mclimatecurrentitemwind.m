#import "mclimatecurrentitemwind.h"
#import "vclimatecellwind.h"

static NSInteger const climatewindheight = 150;

@interface mclimatecurrentitem ()

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight;

@end

@interface mclimatecurrentitemwind ()

@property(weak, nonatomic, readwrite)mclimatewind *wind;

@end

@implementation mclimatecurrentitemwind

-(instancetype)init:(mclimatewind*)wind
{
    self = [super init:[vclimatecellwind class] height:climatewindheight];
    self.wind = wind;
    
    return self;
}

@end