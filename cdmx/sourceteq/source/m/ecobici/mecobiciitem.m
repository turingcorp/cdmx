#import "mecobiciitem.h"

@interface mecobiciitem ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(assign, nonatomic, readwrite)CGFloat latitude;
@property(assign, nonatomic, readwrite)CGFloat longitude;

@end

@implementation mecobiciitem

#pragma mark public

-(mecobiciitemannotation*)asannotation
{
    mecobiciitemannotation *annotation = [[mecobiciitemannotation alloc] init:self.latitude lon:self.longitude];
    annotation.model = self;
    self.annotation = annotation;
    self.closer = NO;
    
    return annotation;
}

@end