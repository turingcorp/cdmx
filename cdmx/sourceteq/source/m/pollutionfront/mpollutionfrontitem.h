#import <Foundation/Foundation.h>
#import "gpollutiondist.h"
#import "mpollutionindex.h"
#import "mdbdistrict.h"
#import "mpollutionpollutant.h"
#import "mpollutionfrontitemoption.h"

@class mpollutionfront;

@interface mpollutionfrontitem:NSObject

+(instancetype)district:(mdbdistrict*)district marginx:(CGFloat)marginx;
+(instancetype)global:(NSInteger)pollution;
-(void)turnon;
-(void)turnoff;
-(void)standby;
-(NSArray<mpollutionfrontitemoption*>*)options;

@property(weak, nonatomic)mpollutionfront *parent;
@property(strong, nonatomic, readonly)mpollutionindex *index;
@property(strong, nonatomic, readonly)mpollutionpollutant *pollutant;
@property(strong, nonatomic, readonly)gpollutiondist *spatial;
@property(copy, nonatomic, readonly)NSString *name;

@end