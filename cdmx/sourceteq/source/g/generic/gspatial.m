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
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.pointerposition);
    [baseeffect prepareToDraw];
    
    glDrawArrays(GL_TRIANGLES, 0, vectorcorners);
}

-(void)draw:(NSNotification*)notification
{
    mpollutionnotificationdraw *userinfo = (mpollutionnotificationdraw*)notification.userInfo;
    [self drawwithuserinfo:userinfo];
}

-(void)render
{
    CGFloat minx = self.x;
    CGFloat maxx = minx + self.width;
    CGFloat miny = self.y;
    CGFloat maxy = miny + self.height;
    
    self.dataposition = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointerposition[0] = GLKVector2Make(minx, miny);
    self.pointerposition[1] = GLKVector2Make(minx, maxy);
    self.pointerposition[2] = GLKVector2Make(maxx, maxy);
    self.pointerposition[3] = GLKVector2Make(maxx, maxy);
    self.pointerposition[4] = GLKVector2Make(maxx, miny);
    self.pointerposition[5] = GLKVector2Make(minx, miny);
}

-(void)movetotop
{
    [NSNotification glkdrawremove:self];
    [NSNotification observe:self glkdraw:@selector(draw:)];
}

@end