#import "gpollutionchartspikes.h"
#import "enotification.h"
#import "ecolor.h"
#import "genericconstants.h"

static CGFloat const chartspikesdeltamove = -5;

@interface gpollutionchartspikes ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionchartitempoint*> *points;
@property(strong, nonatomic)NSMutableArray<NSNumber*> *expected;

@end

@implementation gpollutionchartspikes

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
    
    for(NSUInteger indexpoint = 1; indexpoint < self.corners; indexpoint += 2)
    {
        CGFloat expected = self.expected[indexpoint].floatValue;
        GLKVector2 position = self.pointerposition[indexpoint];
        CGFloat current = position.y;
        
        if(current > expected)
        {
            CGFloat newposition = current + chartspikesdeltamove;
            
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
    
    GLKBaseEffect *baseeffect = userinfo.baseeffect;
    glEnableVertexAttribArray(GLKVertexAttribColor);
    baseeffect.texture2d0.enabled = NO;
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.pointerposition);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.pointercolor);
    [baseeffect prepareToDraw];
    glDrawArrays(GL_TRIANGLE_STRIP, 0, (int)self.corners);
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
    NSInteger corners2 = corners * 2;
    NSInteger indexvector = 0;
    self.corners = corners2;
    
    GLKVector4 colortop = [[[UIColor main] colorWithAlphaComponent:0.1] asvector];
    GLKVector4 colorbottom = GLKVector4Make(0, 0, 0, 0);
    
    self.dataposition = [NSMutableData dataWithLength:corners2 * sizeof(GLKVector2)];
    self.datacolor = [NSMutableData dataWithLength:corners2 * sizeof(GLKVector4)];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointercolor = self.datacolor.mutableBytes;
    self.expected = [NSMutableArray array];
    
    for(NSUInteger indexpoint = 0; indexpoint < corners; indexpoint++)
    {
        mpollutionchartitempoint *point = self.points[indexpoint];
        CGFloat x = point.x;
        CGFloat y = point.y;
        
        [self.expected addObject:@(y)];
        [self.expected addObject:@(y)];
        self.pointerposition[indexvector] = GLKVector2Make(x, pollution_drawableheight);
        self.pointercolor[indexvector++] = colorbottom;
        self.pointerposition[indexvector] = GLKVector2Make(x, pollution_drawableheight);
        self.pointercolor[indexvector++] = colortop;
    }
    
    [NSNotification observe:self glkdraw:@selector(draw:)];
    [NSNotification observe:self glkmove:@selector(move:)];
    self.points = nil;
}

@end