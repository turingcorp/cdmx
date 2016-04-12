#import "vmenubanner.h"

@implementation vmenubanner

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

@end