#import "gpollutiondist.h"
#import "ecolor.h"
#import "genericconstants.h"

static BOOL const srgb = NO;

@implementation gpollutiondist

-(instancetype)init:(mdbdistrict*)model
{
    self = [super init:model.asset srgb:srgb];
//    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat remainwidth = screenwidth - pollution_distsize;
    self.x = model.x.integerValue;
    self.y = model.y.integerValue;
    self.width = model.width.integerValue;
    self.height = model.height.integerValue;
    
    [self render];
    
    return self;
}

@end