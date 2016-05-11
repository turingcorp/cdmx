#import "gpollutionchartline.h"
#import "enotification.h"
#import "ecolor.h"
#import "genericconstants.h"

static NSInteger const chartlinewidth = 50;
static NSInteger const chartvectorcorners = 6;

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
    glDrawArrays(GL_TRIANGLES, 0, (int)self.corners);
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
    NSInteger corners_1 = corners - 1;
    NSInteger vectorcorners = corners * chartvectorcorners;
    NSInteger indexposition = 0;
    NSInteger indexcolor = 0;
    self.corners = vectorcorners;
    
    self.dataposition = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.datacolor = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector4)];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointercolor = self.datacolor.mutableBytes;
    
    for(NSUInteger indexspike = 0; indexspike < corners_1;)
    {
        mpollutionchartspike *spikea = self.spikes[indexspike++];
        mpollutionchartspike *spikeb = self.spikes[indexspike];
        GLKVector4 colora = [spikea.color asvector];
        GLKVector4 coloratrans = GLKVector4Make(1, 1, 1, 0);
        GLKVector4 colorb = [spikeb.color asvector];
        GLKVector4 colorbtrans = GLKVector4Make(1, 1, 1, 0);
        CGFloat ax = spikea.x;
        CGFloat ay = spikea.y;
        CGFloat bx = spikeb.x;
        CGFloat by = spikeb.y;
        
        self.pointerposition[indexposition++] = GLKVector2Make(ax, ay - chartlinewidth);
        self.pointerposition[indexposition++] = GLKVector2Make(ax, ay);
        self.pointerposition[indexposition++] = GLKVector2Make(bx, by);
        self.pointerposition[indexposition++] = GLKVector2Make(bx, by);
        self.pointerposition[indexposition++] = GLKVector2Make(bx, by - chartlinewidth);
        self.pointerposition[indexposition++] = GLKVector2Make(ax, ay - chartlinewidth);
        
        self.pointercolor[indexcolor++] = coloratrans;
        self.pointercolor[indexcolor++] = colora;
        self.pointercolor[indexcolor++] = colorb;
        self.pointercolor[indexcolor++] = colorb;
        self.pointercolor[indexcolor++] = colorbtrans;
        self.pointercolor[indexcolor++] = coloratrans;
    }
    
    [NSNotification observe:self glkdraw:@selector(draw:)];
    self.spikes = nil;
}

@end