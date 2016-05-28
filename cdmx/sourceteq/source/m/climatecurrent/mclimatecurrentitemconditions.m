#import "mclimatecurrentitemconditions.h"

@interface mclimatecurrentitem ()

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight;

@end

@interface mclimatecurrentitemconditions ()

@property(weak, nonatomic, readwrite)mclimateconditions *conditions;

@end

@implementation mclimatecurrentitemconditions

-(instancetype)init:(mclimateconditions*)conditions
{
    //self = [super init:<#(__unsafe_unretained Class)#> height:<#(NSInteger)#>];
    self.conditions = conditions;
    
    return self;
}

@end