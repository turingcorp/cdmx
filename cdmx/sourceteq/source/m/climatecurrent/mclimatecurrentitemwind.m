#import "mclimatecurrentitemwind.h"

@interface mclimatecurrentitem ()

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight;

@end

@interface mclimatecurrentitemwind ()

@property(weak, nonatomic, readwrite)mclimatewind *wind;

@end

@implementation mclimatecurrentitemwind

-(instancetype)init:(mclimatewind*)wind
{
    //self = [super init:<#(__unsafe_unretained Class)#> height:<#(NSInteger)#>];
    self.wind = wind;
    
    return self;
}

@end