#import "mmenusectionadmin.h"
#import "mmenusectionitemadminecobici.h"

@interface mmenusection ()

@property(strong, nonatomic, readwrite)NSArray<mmenusectionitem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mmenusectionadmin

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_section_admin", nil);
    self.items = @[
                   [[mmenusectionitemadminecobici alloc] init]
                   ];
    
    return self;
}

@end