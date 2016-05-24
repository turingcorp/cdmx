#import "mnodriveitemplategreen.h"
#import "ecolor.h"

@interface mnodriveitemplate ()

@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mnodriveitemplategreen

-(instancetype)init
{
    self = [super init];
    self.color = [UIColor pollution_green];
    
    return self;
}

@end