#import "vmenu.h"
#import "uicolor+uicolormain.h"

@implementation vmenu

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    
    return self;
}

@end