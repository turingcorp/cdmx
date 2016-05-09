#import <Foundation/Foundation.h>
#import "gspatialtexture.h"

@interface gpollutiondist:gspatialtexture

-(instancetype)init:(NSString*)texturename;
-(void)originalsize;
-(void)extrasize;

@property(assign, nonatomic)CGFloat initialx;

@end