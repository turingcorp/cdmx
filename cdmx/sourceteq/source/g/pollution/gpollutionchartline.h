#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "mpollutionchartitempoint.h"

@interface gpollutionchartline:NSObject

-(void)add:(mpollutionchartitempoint*)point;
-(void)render;

@property(strong, nonatomic, readonly)NSMutableArray<mpollutionchartitempoint*> *points;
@property(strong, nonatomic)NSMutableData *dataposition;
@property(strong, nonatomic)NSMutableData *datacolor;
@property(assign, nonatomic)GLKVector2 *pointerposition;
@property(assign, nonatomic)GLKVector4 *pointercolor;
@property(assign, nonatomic)NSInteger corners;

@end