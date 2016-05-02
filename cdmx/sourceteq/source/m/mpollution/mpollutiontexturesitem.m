#import "mpollutiontexturesitem.h"
#import <GLKit/GLKit.h>

@implementation mpollutiontexturesitem

-(instancetype)init:(NSString*)name assetname:(NSString*)assetname
{
    self = [super init];
    self.name = name;
    self.assetname = assetname;
    [self loadtexture];
    
    return self;
}

#pragma mark functionality

-(void)loadtexture
{
    UIImage *image = [UIImage imageNamed:self.assetname];
    GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@YES} error:nil];
    self.textureid = textureinfo.name;
}

@end