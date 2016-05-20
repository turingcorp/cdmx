#import "mnodriveitemplatered.h"
#import "ecolor.h"

@interface mnodriveitemplate ()

@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mnodriveitemplatered

-(instancetype)init
{
    self = [super init];
    self.color = [UIColor pollution_red];
    
    return self;
}

@end