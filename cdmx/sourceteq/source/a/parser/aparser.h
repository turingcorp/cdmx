#import <UIKit/UIKit.h>

@interface aparser:NSObject

-(void)parse:(NSDictionary*)json;
-(NSData*)cleandata:(NSData*)data;

@property(strong, nonatomic)NSDictionary *validjson;

@end