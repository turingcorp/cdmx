#import "mpagesitemair.h"

@implementation mpagesitemair

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_item_air_name", nil);
    self.descr = NSLocalizedString(@"pages_item_air_descr", nil);
    
    return self;
}

@end