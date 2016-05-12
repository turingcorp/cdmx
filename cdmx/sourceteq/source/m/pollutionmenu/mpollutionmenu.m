#import "mpollutionmenu.h"
#import "mpollutionmenuitemdistricts.h"
#import "mpollutionmenuitemchart.h"
#import "mpollutionmenuitemmap.h"

@interface mpollutionmenu ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionmenuitem*> *items;

@end

@implementation mpollutionmenu

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mpollutionmenuitemdistricts alloc] init],
                   [[mpollutionmenuitemchart alloc] init],
                   [[mpollutionmenuitemmap alloc] init]
                   ];
    
    return self;
}

@end