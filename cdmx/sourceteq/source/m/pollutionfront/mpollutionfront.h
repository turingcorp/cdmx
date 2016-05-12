#import <Foundation/Foundation.h>
#import "mpollutionoption.h"
#import "mpollutionfrontitem.h"

@interface mpollutionfront:mpollutionoption

-(void)highlight:(mpollutionitem*)model;

@property(strong, nonatomic, readonly)NSArray<mpollutionfrontitem*> *items;

@end