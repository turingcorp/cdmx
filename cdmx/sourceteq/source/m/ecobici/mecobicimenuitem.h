#import <Foundation/Foundation.h>
#import "cecobici.h"

@interface mecobicimenuitem:NSObject

+(instancetype)menu;
+(instancetype)closer;
+(instancetype)user;

-(void)action:(cecobici*)controller;

@end