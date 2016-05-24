#import "gspatialtexture.h"

@implementation gspatialtexture

-(instancetype)init:(NSString*)texturename srgb:(BOOL)srgb
{
    self = [super init];
    self.texture = [[gtexture alloc] init];
    [self.texture loadtexture:texturename srgb:srgb];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)drawwithuserinfo:(mpollutionnotificationdraw*)userinfo
{
    if(self.texture.textureid)
    {
        GLKBaseEffect *baseeffect = userinfo.baseeffect;
        GLKVector2 *pointertexture = userinfo.pointertexture;
        
        baseeffect.texture2d0.enabled = YES;
        baseeffect.texture2d0.envMode = GLKTextureEnvModeModulate;
        baseeffect.texture2d0.name = self.texture.textureid;
        baseeffect.constantColor = self.color;
        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
        glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, pointertexture);
        
        [super drawwithuserinfo:userinfo];
        
        glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
    }
}

@end