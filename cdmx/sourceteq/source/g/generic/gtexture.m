#import "gtexture.h"
#import "tools.h"

@implementation gtexture

#pragma mark public

-(void)loadtexture:(NSString*)texturename srgb:(BOOL)srgb
{
    __weak typeof(self) welf = self;
    UIImage *image = [UIImage imageNamed:texturename];
    UIImage *imagebuffered = [tools bufferimage:image];
    image = nil;
    
    GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:imagebuffered.CGImage options:@{GLKTextureLoaderSRGB:@(srgb)} error:nil];
    welf.textureid = textureinfo.name;
}

@end