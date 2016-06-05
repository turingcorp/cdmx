#import "mecobiciitem.h"

@interface mecobiciitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSNumber *stationid;
@property(assign, nonatomic, readwrite)CGFloat latitude;
@property(assign, nonatomic, readwrite)CGFloat longitude;

@end

@implementation mecobiciitem

-(instancetype)init:(mdbecobicistation*)dbmodel
{
    self = [super init];
    self.name = dbmodel.name;
    self.stationid = dbmodel.stationid;
    self.latitude = dbmodel.latitude.floatValue;
    self.longitude = dbmodel.longitude.floatValue;
    self.closer = NO;
    self.kilometers = 0;
    
    return self;
}

#pragma mark public

-(mecobiciitemannotation*)asannotation
{
    mecobiciitemannotation *annotation = [[mecobiciitemannotation alloc] init:self.latitude lon:self.longitude];
    annotation.model = self;
    self.annotation = annotation;
    
    return annotation;
}

@end