#import <Foundation/Foundation.h>
#import "mnodriveitem.h"
#import "mnodriverating.h"
#import "mnodrivetoday.h"

@interface mnodrive:NSObject

-(instancetype)init:(NSDictionary*)dictionary;
-(mnodrivetoday*)today;

@property(strong, nonatomic, readonly)mnodriveitem *today;
@property(strong, nonatomic, readonly)NSArray<mnodriveitem*> *week;
@property(strong, nonatomic, readonly)NSArray<mnodriveitem*> *staturdays;
@property(strong, nonatomic, readonly)NSArray<mnodriverating*> *ratings;
@property(assign, nonatomic, readonly)BOOL allstates;
@property(assign, nonatomic, readonly)BOOL bikesrestricted;

@end