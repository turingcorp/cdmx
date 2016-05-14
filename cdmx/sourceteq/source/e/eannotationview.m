#import "eannotationview.h"

@implementation MKAnnotationView (eannotationview)

+(NSString*)reusableidentifier
{
    NSString *classname = NSStringFromClass([self class]);
    
    return classname;
}

@end
