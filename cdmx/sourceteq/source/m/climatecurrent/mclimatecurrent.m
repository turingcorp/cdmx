#import "mclimatecurrent.h"
#import "mclimate.h"

@interface mclimatecurrentitem ()

+(instancetype)conditions:(mclimateconditions*)conditions;
+(instancetype)atmosphere:(mclimateatmosphere*)atmosphere;
+(instancetype)wind:(mclimatewind*)wind;

@end

@interface mclimatecurrent ()

@property(strong, nonatomic, readwrite)NSArray<mclimatecurrentitem*> *items;

@end

@implementation mclimatecurrent

-(instancetype)init:(mclimate*)model
{
    self = [super init];
    self.items = @[
                   [mclimatecurrentitem conditions:model.conditions],
                   [mclimatecurrentitem atmosphere:model.atmosphere],
                   [mclimatecurrentitem wind:model.wind]
                   ];
    
    return self;
}

@end