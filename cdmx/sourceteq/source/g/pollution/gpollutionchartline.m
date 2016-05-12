#import "gpollutionchartline.h"
#import "enotification.h"
#import "ecolor.h"
#import "genericconstants.h"

static NSInteger const chartlinewidth = 5;

@interface gpollutionchartline ()

@property(strong, nonatomic, readwrite)NSMutableArray<mpollutionchartitempoint*> *points;

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
    
    for(NSUInteger indexpoint = 0; indexpoint < corners; indexpoint++)
    {
        mpollutionchartitempoint *point = self.points[indexpoint];
        CGFloat x = point.x;
        CGFloat y = point.y;
        
        self.pointerposition[indexpoint] = GLKVector2Make(x, y);
        self.pointercolor[indexpoint] = [point.index.color asvector];
    }
    
    [NSNotification observe:self glkdraw:@selector(draw:)];
    self.points = nil;
}

@end