#import "mpagessectionapp.h"
#import "mpagesitemreview.h"

@implementation mpagessectionapp

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"pages_section_app", nil);
    self.items = @[
                   [[mpagesitemnodrive alloc] init]
                   ];
    
    return self;
}

@end