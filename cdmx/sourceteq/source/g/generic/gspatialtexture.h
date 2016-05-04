#import <Foundation/Foundation.h>
#import "gspatial.h"
#import "gtexture.h"

@interface gspatialtexture:gspatial

-(instancetype)init:(NSString*)texturename srgb:(BOOL)srgb;

@property(strong, nonatomic)gtexture *texture;

@end