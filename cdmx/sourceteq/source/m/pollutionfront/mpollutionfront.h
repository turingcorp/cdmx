#import <Foundation/Foundation.h>
#import "mpollutionoption.h"
#import "mpollutionitem.h"

@interface mpollutionfront:mpollutionoption

-(void)highlight:(mpollutionitem*)model;

@property(strong, nonatomic, readonly)NSArray<mpollutionitem*> *items;

@end