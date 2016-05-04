#import "mpollutiontexturesitem.h"
#import <GLKit/GLKit.h>

@implementation mpollutiontexturesitem

-(instancetype)init:(NSString*)texturename
{
    self = [super init];
    [self loadtexture:texturename];
    
    return self;
}

#pragma mark functionality

-(void)loadtexture:(NSString*)texturename
{
    UIImage *image = [UIImage imageNamed:texturename];
    GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@YES} error:nil];
    self.textureid = textureinfo.name;
}

@end