#import "gpollutionchartspikes.h"
#import "enotification.h"
#import "ecolor.h"
#import "genericconstants.h"

@interface gpollutionchartspikes ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionchartspike*> *spikes;

@end

@implementation gpollutionchartspikes

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

#pragma mark functionality

-(void)closurespikes
{
    GLKVector4 color = [[UIColor colorWithWhite:0 alpha:0.1] asvector];
    
    mpollutionchartspike *firstspike = [[mpollutionchartspike alloc] init];
    firstspike.x = 0;
    firstspike.y = pollution_drawableheight;
    firstspike.color = color;
    
    mpollutionchartspike *secondspike = [[mpollutionchartspike alloc] init];
    secondspike.x = [self.spikes lastObject].x;
    secondspike.y = pollution_drawableheight;
    secondspike.color = color;
    
    [self add:secondspike];
}

#pragma mark public

-(void)add:(mpollutionchartspike*)spike
{
    [self.spikes addObject:spike];
}

-(void)render
{
    [self closurespikes];
    self.corners = self.spikes.count;
    
    self.dataposition = [NSMutableData dataWithLength:self.corners * sizeof(GLKVector2)];
    self.datacolor = [NSMutableData dataWithLength:self.corners * sizeof(GLKVector4)];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointercolor = self.datacolor.mutableBytes;
    
    for(NSUInteger indexspike = 0; indexspike < self.corners; indexspike++)
    {
        mpollutionchartspike *spike = self.spikes[indexspike];
        
        self.pointerposition[indexspike] = GLKVector2Make(spike.x, spike.y);
        self.pointercolor[indexspike] = spike.color;
    }
    
    [NSNotification observe:self glkdraw:@selector(draw:)];
}

@end