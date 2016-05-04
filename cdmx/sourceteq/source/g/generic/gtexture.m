#import "gtexture.h"
#import "tools.h"

@implementation gtexture

#pragma mark public

-(void)loadtexture:(NSString*)texturename srgb:(BOOL)srgb
{
    UIImage *image = [UIImage imageNamed:texturename];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@(srgb)} error:nil];
                       
                       self.textureid = textureinfo.name;
                   });
}

@end