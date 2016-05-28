#import "mclimatecurrentitem.h"
#import "mclimatecurrentitemconditions.h"
#import "mclimatecurrentitematmosphere.h"
#import "mclimatecurrentitemwind.h"
#import "mclimate.h"

@interface mclimatecurrentitemconditions ()

-(instancetype)init:(mclimateconditions*)conditions;

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

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight
{
    self = [super init];
    self.reusableidentifier = NSStringFromClass(cellclass);
    self.cellclass = cellclass;
    self.cellheight = cellheight;
    
    return self;
}

@end