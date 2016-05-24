#import "mmenusectionapp.h"
#import "mmenusectionitemabout.h"

@interface mmenusection ()

@property(strong, nonatomic, readwrite)NSArray<mmenusectionitem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mmenusectionapp

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_section_app", nil);
    self.items = @[
                   [[mmenusectionitemabout alloc] init]
                   ];
    
    return self;
}

@end