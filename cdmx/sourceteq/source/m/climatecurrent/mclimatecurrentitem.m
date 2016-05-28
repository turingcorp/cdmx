#import "mclimatecurrentitem.h"
#import "mclimatecurrentitemconditions.h"
#import "mclimatecurrentitematmosphere.h"
#import "mclimatecurrentitemwind.h"
#import "mclimate.h"

@interface mclimatecurrentitemconditions ()

-(instancetype)init:(mclimateconditions*)conditions;

@end

@interface mclimatecurrentitematmosphere ()

-(instancetype)init:(mclimateatmosphere*)atmosphere;

@end

@interface mclimatecurrentitemwind ()

-(instancetype)init:(mclimatewind*)wind;

@end

@interface mclimatecurrentitem ()

@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellheight;

@end

@implementation mclimatecurrentitem

+(instancetype)conditions:(mclimateconditions*)conditions
{
    mclimatecurrentitem *item = [[mclimatecurrentitemconditions alloc] init:conditions];
    
    return item;
}

+(instancetype)atmosphere:(mclimateatmosphere*)atmosphere
{
    mclimatecurrentitem *item = [[mclimatecurrentitematmosphere alloc] init:atmosphere];
    
    return item;
}

+(instancetype)wind:(mclimatewind*)wind
{
    mclimatecurrentitem *item = [[mclimatecurrentitemwind alloc] init:wind];
    
    return item;
}

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight
{
    self = [super init];
    self.reusableidentifier = NSStringFromClass(cellclass);
    self.cellclass = cellclass;
    self.cellheight = cellheight;
    
    return self;
}

@end