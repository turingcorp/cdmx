#import "mnodriveitemplatepink.h"
#import "ecolor.h"

@interface mnodriveitemplate ()

@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mnodriveitemplatepink

-(instancetype)init
{
    self = [super init];
    self.color = [UIColor pollution_pink];
    
    return self;
}

@end