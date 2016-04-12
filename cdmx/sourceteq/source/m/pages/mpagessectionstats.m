#import "mpagessectionstats.h"
#import "mpagesitemair.h"

@implementation mpagessectionstats

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_section_stats", nil);
    self.items = @[
                   [[mpagesitemair alloc] init]
                   ];
    
    return self;
}

@end