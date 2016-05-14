#import "vpollutionmapdisplayannotation.h"

@interface vpollutionmapdisplayannotation ()

@property(weak, nonatomic)mpollutionmapitemannotation *annotation;

@end

@implementation vpollutionmapdisplayannotation

@dynamic annotation;

-(instancetype)initWithAnnotation:(mpollutionmapitemannotation*)annotation reuseIdentifier:(NSString*)identifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:identifier];
    
    return self;
}

@end