#import <Foundation/Foundation.h>
#import "mpollutionchartitempoint.h"
#import "mpollution.h"
#import "gpollutionchartspikes.h"
#import "gpollutionchartline.h"

@interface mpollutionchartitem:NSObject

-(instancetype)init:(NSString*)name;
-(void)loadmodel:(mpollution*)model;
-(void)clean;

@property(strong, nonatomic, readonly)NSArray<mpollutionchartitempoint*> *points;
@property(strong, nonatomic)gpollutionchartspikes *spatialspikes;
@property(strong, nonatomic)gpollutionchartline *spatialline;
@property(copy, nonatomic)NSString *name;

@end