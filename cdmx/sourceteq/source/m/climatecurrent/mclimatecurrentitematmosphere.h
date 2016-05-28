#import <Foundation/Foundation.h>
#import "mclimatecurrentitem.h"
#import "mclimateatmosphere.h"

@interface mclimatecurrentitematmosphere:mclimatecurrentitem

@property(weak, nonatomic, readonly)mclimateatmosphere *atmosphere;

@end