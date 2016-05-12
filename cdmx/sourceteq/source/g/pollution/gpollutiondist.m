#import "gpollutiondist.h"
#import "ecolor.h"
#import "enotification.h"
#import "genericconstants.h"

static BOOL const districtsrgb = NO;

@implementation gpollutiondist

-(instancetype)init:(mdbdistrict*)model marginx:(CGFloat)marginx
{
    self = [super init:model.asset srgb:districtsrgb];
    
    self.x = model.x.integerValue + marginx;
    self.y = model.y.integerValue + pollution_mapy;
    self.width = model.width.integerValue;
    self.height = model.height.integerValue;
    
    [self render];
    [self movetotop];
    
    return self;
}

@end