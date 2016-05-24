#import <Foundation/Foundation.h>
#import "gspatialtexture.h"

@interface gpollutionchartselect:gspatialtexture

-(void)newx:(CGFloat)x y:(CGFloat)y;

@property(assign, nonatomic)BOOL visible;
@property(assign, nonatomic)BOOL rerender;

@end