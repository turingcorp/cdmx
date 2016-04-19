#import "mpagessectioncars.h"
#import "mpagesitemnodrive.h"

@implementation mpagessectioncars

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_section_cars", nil);
    self.items = @[
                   [[mpagesitemnodrive alloc] init]
                   ];
    
    return self;
}

@end