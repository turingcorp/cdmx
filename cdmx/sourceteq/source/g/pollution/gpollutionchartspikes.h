#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "mpollutionchartspike.h"

@interface gpollutionchartspikes:NSObject

-(instancetype)init:(UIColor*)colortop bottom:(UIColor*)colorbottom;
-(void)add:(mpollutionchartspike*)spike;
-(void)render;

@property(strong, nonatomic, readonly)NSMutableArray<mpollutionchartspike*> *spikes;
@property(strong, nonatomic)UIColor *colortop;
@property(strong, nonatomic)UIColor *colorbottom;
@property(strong, nonatomic)NSMutableData *dataposition;
@property(strong, nonatomic)NSMutableData *datacolor;
@property(assign, nonatomic)GLKVector2 *pointerposition;
@property(assign, nonatomic)GLKVector4 *pointercolor;
@property(assign, nonatomic)NSInteger corners;

@end