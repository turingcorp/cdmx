#import "mclimatecurrentitematmosphere.h"
#import "vclimatecellatmosphere.h"

static NSInteger const climateatmosphereheight = 150;

@interface mclimatecurrentitem ()

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight;

@end

@interface mclimatecurrentitematmosphere ()

@property(weak, nonatomic, readwrite)mclimateatmosphere *atmosphere;

@end

@implementation mclimatecurrentitematmosphere

-(instancetype)init:(mclimateatmosphere*)atmosphere
{
    self = [super init:[vclimatecellatmosphere class] height:climateatmosphereheight];
    self.atmosphere = atmosphere;
    
    return self;
}

@end