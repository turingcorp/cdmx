#import <UIKit/UIKit.h>
#import "vcollectioncell.h"
#import "mpollutionmenuitem.h"

@interface vpollutionmenucell:vcollectioncell

-(void)config:(mpollutionmenuitem*)model;

@property(weak, nonatomic)UIImageView *icon;

@end