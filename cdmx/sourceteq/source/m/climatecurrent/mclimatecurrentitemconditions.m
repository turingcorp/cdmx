#import "mclimatecurrentitemconditions.h"
#import "vclimatecellconditions.h"

static NSInteger const climateconditionsheight = 250;

@interface mclimatecurrentitem ()

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight;

@end

@interface mclimatecurrentitemconditions ()

@property(weak, nonatomic, readwrite)mclimateconditions *conditions;

@end

@implementation mclimatecurrentitemconditions

-(instancetype)init:(mclimateconditions*)conditions
{
    self = [super init:[vclimatecellconditions class] height:climateconditionsheight];
    self.conditions = conditions;
    
    return self;
}

@end