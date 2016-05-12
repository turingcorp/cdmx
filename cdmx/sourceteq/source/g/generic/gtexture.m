#import "gtexture.h"
#import "tools.h"

@implementation gtexture

-(instancetype)init
{
    self = [super init];
    self.textureid = 0;
    
    return self;
}

-(void)dealloc
{
    GLuint reference = self.textureid;
    
    if(reference)
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           glDeleteTextures(1, &reference);
                       });
    }
}

#pragma mark public

-(void)loadtexture:(NSString*)texturename srgb:(BOOL)srgb
{
    __weak typeof(self) welf = self;
    
    UIImage *image = [UIImage imageNamed:texturename];
    GLKTextureLoader *loader = [[GLKTextureLoader alloc] initWithSharegroup:[EAGLContext currentContext].sharegroup];
    [loader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@(srgb)} queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) completionHandler:
     ^(GLKTextureInfo * _Nullable textureinfo, NSError * _Nullable outerror)
    {
        welf.textureid = textureinfo.name;
    }];
}

@end