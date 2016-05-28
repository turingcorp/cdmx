#import "mclimatecurrentitematmosphere.h"

@interface mclimatecurrentitem ()

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight;

@end

@interface mclimatecurrentitematmosphere ()

@property(weak, nonatomic, readwrite)mclimateatmosphere *atmosphere;

@end

@implementation mclimatecurrentitematmosphere

-(instancetype)init:(mclimateatmosphere*)atmosphere
{
    //self = [super init:<#(__unsafe_unretained Class)#> height:<#(NSInteger)#>];
    self.atmosphere = atmosphere;
    
    return self;
}

@end