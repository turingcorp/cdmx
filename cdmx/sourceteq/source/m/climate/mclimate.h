#import <UIKit/UIKit.h>
#import "mclimateconditions.h"
#import "mclimatewind.h"
#import "mclimateatmosphere.h"

@interface mclimate:NSObject

@property(strong, nonatomic, readonly)mclimateconditions *conditions;
@property(strong, nonatomic, readonly)mclimatewind *wind;
@property(strong, nonatomic, readonly)mclimateatmosphere *atmosphere;

@end