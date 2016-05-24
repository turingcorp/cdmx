#import "mnodriveitemplateyellow.h"
#import "ecolor.h"

@interface mnodriveitemplate ()

@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mnodriveitemplateyellow

-(instancetype)init
{
    self = [super init];
    self.color = [UIColor pollution_yellow];
    
    return self;
}

@end