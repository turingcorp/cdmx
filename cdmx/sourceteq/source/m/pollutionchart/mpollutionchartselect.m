#import "mpollutionchartselect.h"

@implementation mpollutionchartselect

-(instancetype)init:(NSArray<mpollutionchartitempoint*>*)points
{
    self = [super init];
    self.spatial = [[gpollutionchartselect alloc] init];
    self.points = points;
    
    return self;
}

#pragma mark public

-(void)hideselector
{
    self.spatial.visible = NO;
}

-(void)newx:(CGFloat)x y:(CGFloat)y
{
    [self.spatial newx:x y:y];
}

@end