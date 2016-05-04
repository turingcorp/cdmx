#import "mpollutionnotificationdraw.h"

@implementation mpollutionnotificationdraw

-(instancetype)init:(GLKBaseEffect*)baseeffect pointertexture:(GLKVector2*)pointertexture
{
    self = [super init];
    self.baseeffect = baseeffect;
    self.pointertexture = pointertexture;
    
    return self;
}

@end