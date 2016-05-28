#import <Foundation/Foundation.h>
#import "mclimatecurrentitem.h"
#import "mclimateconditions.h"

@interface mclimatecurrentitemconditions:mclimatecurrentitem

@property(weak, nonatomic, readonly)mclimateconditions *conditions;

@end