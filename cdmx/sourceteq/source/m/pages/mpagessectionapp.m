#import "mpagessectionapp.h"
#import "mpagesitemabout.h"

@implementation mpagessectionapp

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_section_app", nil);
    self.items = @[
                   [[mpagesitemabout alloc] init]
                   ];
    
    return self;
}

@end