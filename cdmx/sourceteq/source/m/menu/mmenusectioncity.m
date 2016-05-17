#import "mmenusectioncity.h"
#import "mmenusectionitempollution.h"

@interface mmenusection ()

@property(strong, nonatomic, readwrite)NSArray<mmenusectionitem*> *items;

@end

@implementation mmenusectioncity

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mmenusectionitempollution alloc] init]
                   ];
    
    return self;
}

@end