#import "gpollutionchartline.h"
#import "enotification.h"
#import "ecolor.h"
#import "genericconstants.h"

static NSInteger const chartlinewidth = 5;

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

-(void)add:(mpollutionchartspike*)spike
{
    [self.spikes addObject:spike];
}

-(void)render
{
    CGFloat linewidth_2 = chartlinewidth / 2.0;
    NSInteger corners = self.spikes.count;
    self.corners = corners;
    
    self.dataposition = [NSMutableData dataWithLength:corners * sizeof(GLKVector2)];
    self.datacolor = [NSMutableData dataWithLength:corners * sizeof(GLKVector4)];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointercolor = self.datacolor.mutableBytes;
    
    for(NSUInteger indexspike = 0; indexspike < corners; indexspike++)
    {
        mpollutionchartspike *spike = self.spikes[indexspike];
        self.pointerposition[indexspike] = GLKVector2Make(spike.x, spike.y);
        self.pointercolor[indexspike] = [spike.color asvector];
    }
    
    [NSNotification observe:self glkdraw:@selector(draw:)];
    self.spikes = nil;
}

@end