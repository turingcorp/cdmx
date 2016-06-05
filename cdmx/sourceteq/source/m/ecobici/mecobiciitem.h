#import <UIKit/UIKit.h>
#import "mecobiciitemannotation.h"
#import "mdbecobicistation.h"

@interface mecobiciitem:NSObject

-(instancetype)init:(mdbecobicistation*)dbmodel;
-(mecobiciitemannotation*)asannotation;

@property(weak, nonatomic)mecobiciitemannotation *annotation;
@property(copy, nonatomic, readonly)NSString *name;
@property(copy, nonatomic, readonly)NSNumber *stationid;
@property(assign, nonatomic, readonly)CGFloat latitude;
@property(assign, nonatomic, readonly)CGFloat longitude;
@property(assign, nonatomic)CGFloat kilometers;
@property(assign, nonatomic)BOOL closer;

@end