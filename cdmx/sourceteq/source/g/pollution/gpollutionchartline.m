#import "gpollutionchartline.h"
#import "enotification.h"
#import "ecolor.h"
#import "genericconstants.h"

@interface gpollutionchartline ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionchartspike*> *spikes;

@end

@implementation gpollutionchartline

-(instancetype)init
{
    self = [super init];
    self.spikes = [NSMutableArray array];
    
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

-(void)add:(mpollutionchartspike*)spike
{
    [self.spikes addObject:spike];
}

-(void)render
{
    NSInteger corners = self.spikes.count;
    NSInteger corners2 = corners * 2;
    NSInteger indexvector = 0;
    self.corners = corners2;
    
    GLKVector4 colortop = [[[UIColor main] colorWithAlphaComponent:0.2] asvector];
    GLKVector4 colorbottom = [[[UIColor main] colorWithAlphaComponent:0.02] asvector];
    
    self.dataposition = [NSMutableData dataWithLength:corners2 * sizeof(GLKVector2)];
    self.datacolor = [NSMutableData dataWithLength:corners2 * sizeof(GLKVector4)];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointercolor = self.datacolor.mutableBytes;
    
    for(NSUInteger indexspike = 0; indexspike < corners; indexspike++)
    {
        mpollutionchartspike *spike = self.spikes[indexspike];
        
        self.pointerposition[indexvector] = GLKVector2Make(spike.x, pollution_drawableheight);
        self.pointercolor[indexvector++] = colorbottom;
        self.pointerposition[indexvector] = GLKVector2Make(spike.x, spike.y);
        self.pointercolor[indexvector++] = colortop;
    }
    
    [NSNotification observe:self glkdraw:@selector(draw:)];
}

@end