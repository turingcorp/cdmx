#import "gpollutiondist.h"
#import "ecolor.h"
#import "enotification.h"
#import "genericconstants.h"

static BOOL const districtsrgb = NO;

@implementation gpollutiondist

-(instancetype)init:(mdbdistrict*)model
{
    self = [super init:model.asset srgb:districtsrgb];
    
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainwidth = screenwidth - pollution_mapwidth;
    CGFloat margin = remainwidth / 2.0;
    self.x = model.x.integerValue + margin;
    self.y = model.y.integerValue + pollution_mapy;
    self.width = model.width.integerValue;
    self.height = model.height.integerValue;
    [self render];
    [self movetotop];
    
    return self;
}

@end