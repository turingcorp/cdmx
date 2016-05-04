#import "gspatial.h"
#import "enotification.h"

static NSInteger const vectorcorners = 6;

@implementation gspatial

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark public

-(void)drawwithuserinfo:(mpollutionnotificationdraw*)userinfo
{
    GLKBaseEffect *baseeffect = userinfo.baseeffect;
    baseeffect.transform.projectionMatrix = self.projection;
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.pointerposition);
    
    [baseeffect prepareToDraw];
    
    glDrawArrays(GL_TRIANGLES, 0, vectorcorners);
}

-(void)draw:(NSNotification*)notification
{
    mpollutionnotificationdraw *userinfo = (mpollutionnotificationdraw*)notification.userInfo;
    [self drawwithuserinfo:userinfo];
}

-(void)movedx:(CGFloat)dx dy:(CGFloat)dy
{
    self.projection = GLKMatrix4Translate(self.projection, dx, dy, 0);
}

-(void)render
{
    NSInteger minx = self.x;
    NSInteger maxx = minx + self.width;
    NSInteger miny = self.y;
    NSInteger maxy = miny + self.height;
    
    self.projection = GLKMatrix4MakeOrtho(0, 300, 300, 0, 1, -1);
    self.dataposition = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointerposition[0] = GLKVector2Make(minx, miny);
    self.pointerposition[1] = GLKVector2Make(minx, maxy);
    self.pointerposition[2] = GLKVector2Make(maxx, maxy);
    self.pointerposition[3] = GLKVector2Make(maxx, maxy);
    self.pointerposition[4] = GLKVector2Make(maxx, miny);
    self.pointerposition[5] = GLKVector2Make(minx, miny);
    
    [self movetotop];
}

-(void)movetotop
{
    [NSNotification glkdrawremove:self];
    [NSNotification observe:self glkdraw:@selector(draw:)];
}

@end