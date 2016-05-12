#import <Foundation/Foundation.h>
#import "vpollution.h"

@interface mpollutionmenuitem:NSObject

-(instancetype)init:(NSString*)asset;
-(void)actionselected:(vpollution*)view;

@property(copy, nonatomic)NSString *asset;

@end