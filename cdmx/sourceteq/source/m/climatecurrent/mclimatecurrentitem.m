#import "mclimatecurrentitem.h"

@interface mclimatecurrentitem ()

@property(copy, nonatomic, readwrite)NSString *reusableidentifier;
@property(assign, nonatomic, readwrite)Class cellclass;
@property(assign, nonatomic, readwrite)NSInteger cellheight;

@end

@implementation mclimatecurrentitem

-(instancetype)init:(Class)cellclass height:(NSInteger)cellheight
{
    self = [super init];
    self.reusableidentifier = NSStringFromClass(cellclass);
    self.cellclass = cellclass;
    self.cellheight = cellheight;
    
    return self;
}

@end