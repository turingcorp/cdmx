#import "gspatialcolor.h"
#import "ecolor.h"

static NSInteger const colorcorners = 6;

@implementation gspatialcolor

-(instancetype)init:(UIColor*)topleft toprigh:(UIColor*)topright bottomleft:(UIColor*)bottomleft bottomright:(UIColor*)bottomright
{
    self = [super init];
    
    GLKVector4 colortopleft = [topleft asvector];
    GLKVector4 colortopright = [topright asvector];
    GLKVector4 colorbottomleft = [bottomleft asvector];
    GLKVector4 colorbottomright = [bottomright asvector];
    
    self.datacolor = [NSMutableData dataWithLength:colorcorners * sizeof(GLKVector4)];
    self.pointercolor = self.datacolor.mutableBytes;
    self.pointercolor[0] = colortopleft;
    self.pointercolor[1] = colorbottomleft;
    self.pointercolor[2] = colorbottomright;
    self.pointercolor[3] = colorbottomright;
    self.pointercolor[4] = colortopright;
    self.pointercolor[5] = colortopleft;
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)drawwithuserinfo:(mpollutionnotificationdraw*)userinfo
{
    GLKBaseEffect *baseeffect = userinfo.baseeffect;
    baseeffect.texture2d0.enabled = NO;
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.pointercolor);
    
    [super drawwithuserinfo:userinfo];
    
    glDisableVertexAttribArray(GLKVertexAttribColor);
}

@end