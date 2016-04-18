#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface mstationsitemlocation:NSObject

-(instancetype)init:(CGFloat)latitude lon:(CGFloat)longitude;
-(CLLocationCoordinate2D)coordinates;

@property(nonatomic)CGFloat latitude;
@property(nonatomic)CGFloat longitude;

@end
