#import "mstationsitem.h"

@implementation mstationsitem

#pragma mark public

-(BOOL)ownsreading:(mstationsreadingitem*)reading
{
    BOOL owns = NO;
    
    if([reading.shortname isEqualToString:self.shortname])
    {
        owns = YES;
    }
    
    return owns;
}

@end