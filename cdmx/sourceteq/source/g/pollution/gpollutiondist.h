#import <Foundation/Foundation.h>
#import "gspatialtexture.h"

@interface gpollutiondist:gspatialtexture

-(instancetype)init:(NSString*)texturename;

@property(assign, nonatomic)GLKVector4 color;
@property(assign, nonatomic)CGFloat initialx;

@end