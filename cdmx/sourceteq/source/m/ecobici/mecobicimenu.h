#import <Foundation/Foundation.h>
#import "mecobicimenuitem.h"

@interface mecobicimenu:NSObject

+(instancetype)basicmenu;
+(instancetype)completemenu;

@property(strong, nonatomic, readonly)NSArray<mecobicimenuitem*> *items;

@end