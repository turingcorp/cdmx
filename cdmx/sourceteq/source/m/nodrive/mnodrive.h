#import <Foundation/Foundation.h>
#import "mnodriveitem.h"

@interface mnodrive:NSObject

-(instancetype)init:(NSDictionary*)dictionary;

@property(strong, nonatomic, readonly)mnodriveitem *today;
@property(strong, nonatomic, readonly)NSArray<mnodriveitem*> *week;
@property(strong, nonatomic, readonly)NSArray<mnodriveitem*> *staturdays;

@end