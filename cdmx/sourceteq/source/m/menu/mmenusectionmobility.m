#import "mmenusectionmobility.h"
#import "mmenusectionitemnodrive.h"
#import "mmenusectionitemecobici.h"

@interface mmenusection ()

@property(strong, nonatomic, readwrite)NSArray<mmenusectionitem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mmenusectionmobility

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_section_mobility", nil);
    self.items = @[
                   [[mmenusectionitemnodrive alloc] init],
                   //[[mmenusectionitemecobici alloc] init]
                   ];
    
    return self;
}

@end