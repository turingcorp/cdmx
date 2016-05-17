#import "mmenu.h"
#import "mmenusectioncity.h"

@interface mmenu ()

@property(strong, nonatomic, readwrite)NSArray<mmenusection*> *sections;

@end

@implementation mmenu

-(instancetype)init
{
    self = [super init];
    self.sections = @[
                      [[mmenusectioncity alloc] init]
                      ];
    
    return self;
}

@end