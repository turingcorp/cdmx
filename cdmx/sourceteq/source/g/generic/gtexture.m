#import "gtexture.h"

@implementation gtexture

#pragma mark public

-(void)loadtexture:(NSString*)texturename srgb:(BOOL)srgb
{
    UIImage *image = [UIImage imageNamed:texturename];
    GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@(srgb)} error:nil];
    self.textureid = textureinfo.name;
}

@end