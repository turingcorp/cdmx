#import "gpollutionchartline.h"
#import "enotification.h"
#import "ecolor.h"
#import "genericconstants.h"

static CGFloat const chartlinedeltamove = -4;
static NSInteger const chartlinewidth = 5;

@interface gpollutionchartline ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionchartitempoint*> *points;
@property(strong, nonatomic)NSMutableArray<NSNumber*> *expected;

@end

@implementation gpollutionchartline

-(instancetype)init
{
    self = [super init];
    self.points = [NSMutableArray array];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)move:(NSNotification*)notification
{
    BOOL completed = YES;
    
    for(NSUInteger indexpoint = 0; indexpoint < self.corners; indexpoint++)
    {
        CGFloat expected = self.expected[indexpoint].floatValue;
        GLKVector2 position = self.pointerposition[indexpoint];
        CGFloat current = position.y;
        
        if(current > expected)
        {
            CGFloat newposition = current + chartlinedeltamove;
            
            if(newposition < expected)
            {
                newposition = expected;
            }
            
            position = GLKVector2Make(position.x, newposition);
            completed = NO;
            
            self.pointerposition[indexpoint] = position;
        }
    }
    
    if(completed)
    {
        [NSNotification glkmoveremove:self];
        self.expected = nil;
    }
}

-(void)draw:(NSNotification*)notification
{
    mpollutionnotificationdraw *userinfo = (mpollutionnotificationdraw*)notification.userInfo;
    
    glLineWidth(chartlinewidth);
    GLKBaseEffect *baseeffect = userinfo.baseeffect;
    glEnableVertexAttribArray(GLKVertexAttribColor);
    baseeffect.texture2d0.enabled = NO;
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.pointerposition);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.pointercolor);
    [baseeffect prepareToDraw];
    glDrawArrays(GL_LINE_STRIP, 0, (int)self.corners);
    glDisableVertexAttribArray(GLKVertexAttribColor);
}

#pragma mark public

-(void)add:(mpollutionchartitempoint*)point
{
    [self.points addObject:point];
}

-(void)render
{
    NSInteger corners = self.points.count;
    self.corners = corners;
    self.dataposition = [NSMutableData dataWithLength:corners * sizeof(GLKVector2)];
    self.datacolor = [NSMutableData dataWithLength:corners * sizeof(GLKVector4)];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointercolor = self.datacolor.mutableBytes;
    self.expected = [NSMutableArray array];
    
    for(NSUInteger indexpoint = 0; indexpoint < corners; indexpoint++)
    {
        mpollutionchartitempoint *point = self.points[indexpoint];
        CGFloat x = point.x;
        CGFloat y = point.y;
        
        [self.expected addObject:@(y)];
        self.pointerposition[indexpoint] = GLKVector2Make(x, pollution_drawableheight);
        self.pointercolor[indexpoint] = [point.index.color asvector];
    }
    
    [NSNotification observe:self glkdraw:@selector(draw:)];
    [NSNotification observe:self glkmove:@selector(move:)];
    self.points = nil;
}

@end