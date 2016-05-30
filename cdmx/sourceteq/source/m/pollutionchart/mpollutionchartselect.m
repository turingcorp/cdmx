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

-(void)newx:(CGFloat)x
{
    CGFloat pointerx = 0;
    CGFloat pointery = 0;
    NSInteger countpoints = self.points.count;
    NSInteger countpoints_1 = countpoints - 1;
    
    for(NSUInteger indexpoints = 0; indexpoints < countpoints; indexpoints++)
    {
        mpollutionchartitempoint *point = self.points[indexpoints];
        CGFloat inpointx = point.x;
        CGFloat inpointy = point.y;
        BOOL match = NO;
        
        if(inpointx == x)
        {
            match = YES;
        }
        else
        {
            CGFloat deltapointx = fabs(inpointx - x);
            
            if(indexpoints < countpoints_1)
            {
                mpollutionchartitempoint *nextpoint = self.points[indexpoints + 1];
                CGFloat innextpointx = nextpoint.x;
                
                CGFloat deltanextpoint = fabs(innextpointx - x);
                
                if(deltapointx <= deltanextpoint)
                {
                    match = YES;
                }
            }
            else
            {
                match = YES;
            }
        }
        
        if(match)
        {
            self.current = point;
            pointerx = inpointx;
            pointery = inpointy;
            
            break;
        }
    }
    
    [self.spatial newx:pointerx y:pointery];
}

@end