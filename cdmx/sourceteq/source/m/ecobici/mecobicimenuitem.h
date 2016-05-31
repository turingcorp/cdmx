#import <Foundation/Foundation.h>
#import "cecobici.h"

@interface mecobicimenuitem:NSObject

+(instancetype)menu;
+(instancetype)closer;
+(instancetype)user;

-(void)action:(cecobici*)controller;

@property(copy, nonatomic, readonly)NSString *asset;

@end