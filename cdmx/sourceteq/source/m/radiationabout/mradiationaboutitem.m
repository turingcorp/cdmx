#import "mradiationaboutitem.h"

@interface mradiationaboutitem ()

@property(strong, nonatomic, readwrite)mradiation *index;

@end

@implementation mradiationaboutitem

-(instancetype)init:(mradiation*)index
{
    self = [super init];
    self.index = index;
    
    return self;
}

@end