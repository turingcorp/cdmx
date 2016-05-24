#import "mpollutionmenuitemmap.h"

static NSString* const menuassetname = @"pollution_menumap";

@implementation mpollutionmenuitemmap

-(instancetype)init
{
    self = [super init:menuassetname];
    
    return self;
}

#pragma mark -
#pragma mark item

-(void)actionselected:(vpollution*)view
{
    [view show_map];
}

@end