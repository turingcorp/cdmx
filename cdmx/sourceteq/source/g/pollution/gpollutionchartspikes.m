#import "gpollutionchartspikes.h"
#import "enotification.h"
#import "ecolor.h"
#import "genericconstants.h"

@interface gpollutionchartspikes ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionchartitempoint*> *points;

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
    
    for(NSUInteger indexpoint = 0; indexpoint < corners; indexpoint++)
    {
        mpollutionchartitempoint *point = self.points[indexpoint];
        CGFloat x = point.x;
        CGFloat y = point.y;
        
        self.pointerposition[indexvector] = GLKVector2Make(x, pollution_drawableheight);
        self.pointercolor[indexvector++] = colorbottom;
        self.pointerposition[indexvector] = GLKVector2Make(x, y);
        self.pointercolor[indexvector++] = colortop;
    }
    
    [NSNotification observe:self glkdraw:@selector(draw:)];
    self.points = nil;
}

@end