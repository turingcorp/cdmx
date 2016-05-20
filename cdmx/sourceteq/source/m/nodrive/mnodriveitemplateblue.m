#import "mnodriveitemplateblue.h"
#import "ecolor.h"

@interface mnodriveitemplate ()

@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mnodriveitemplateblue

-(instancetype)init
{
    self = [super init];
    self.color = [UIColor pollution_blue];
    
    return self;
}

@end