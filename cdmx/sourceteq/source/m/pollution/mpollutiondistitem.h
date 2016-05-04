#import <Foundation/Foundation.h>
#import "gspatialtexture.h"
@interface mpollutiondistitem:NSObject

-(instancetype)init:(NSString*)name texturename:(NSString*)texturename;

@property(strong, nonatomic)gspatialtexture *spatial;
@property(copy, nonatomic)NSString *name;

@end