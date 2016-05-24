#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface gtexture:NSObject

-(void)loadtexture:(NSString*)texturename srgb:(BOOL)srgb;

@property(assign, nonatomic)GLuint textureid;

@end