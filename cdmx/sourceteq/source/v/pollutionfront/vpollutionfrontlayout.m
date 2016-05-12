#import "vpollutionfrontlayout.h"

@implementation vpollutionfrontlayout

-(instancetype)init
{
    self = [super init];
    [self setFooterReferenceSize:CGSizeZero];
    [self setMinimumInteritemSpacing:0];
    [self setMinimumLineSpacing:0];
    
    return self;
}

@end