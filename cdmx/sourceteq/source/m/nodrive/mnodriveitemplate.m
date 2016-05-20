#import "mnodriveitemplate.h"

@interface mnodriveitemplate ()

@property(strong, nonatomic, readwrite)UIColor *color;
@property(assign, nonatomic, readwrite)NSInteger number;

@end

@implementation mnodriveitemplate

+(instancetype)number:(NSInteger)number
{
    mnodriveitemplate *model = [[mnodriveitemplate alloc] init];
    
    return model;
}

-(instancetype)init:(NSInteger)number
{
    self = [self init];
    self.number = number;
    
    return self;
}

@end