#import "mpollutionmenuitemchart.h"

static NSString* const menuassetname = @"pollution_menudistricts";

@implementation mpollutionmenuitemchart

-(instancetype)init
{
    self = [super init:menuassetname];
    
    return self;
}

#pragma mark -
#pragma mark item

-(void)actionselected:(vpollution*)view
{
    [view show_chart];
}

@end