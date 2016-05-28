#import <UIKit/UIKit.h>
#import "mclimatecondition.h"
#import "mclimatewind.h"
#import "mclimateatmosphere.h"

@interface mclimate:NSObject

@property(strong, nonatomic, readonly)mclimatecondition *condition;
@property(strong, nonatomic, readonly)mclimatewind *wind;
@property(strong, nonatomic, readonly)mclimateatmosphere *atmosphere;

@end