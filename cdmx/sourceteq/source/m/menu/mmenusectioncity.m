#import "mmenusectioncity.h"
#import "mmenusectionitempollution.h"
#import "mmenusectionitemradiation.h"
#import "mmenusectionitemclimate.h"

@interface mmenusection ()

@property(strong, nonatomic, readwrite)NSArray<mmenusectionitem*> *items;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mmenusectioncity

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mmenu_section_city", nil);
    self.items = @[
                   [[mmenusectionitempollution alloc] init],
                   [[mmenusectionitemradiation alloc] init],
                   //[[mmenusectionitemclimate alloc] init]
                   ];
    
    return self;
}

@end