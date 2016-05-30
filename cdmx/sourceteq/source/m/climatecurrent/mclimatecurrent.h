#import <Foundation/Foundation.h>
#import "mclimatecurrentitem.h"

@interface mclimatecurrent:NSObject

@property(strong, nonatomic, readonly)NSArray<mclimatecurrentitem*> *items;

@end