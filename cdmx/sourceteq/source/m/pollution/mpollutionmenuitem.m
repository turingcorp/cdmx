#import "mpollutionmenuitem.h"

@implementation mpollutionmenuitem

-(instancetype)init:(NSString*)asset
{
    self = [super init];
    self.asset = asset;
    
    return self;
}

#pragma mark public

-(void)actionselected:(vpollution*)view
{
}

@end