#import "vairdetailinfo.h"
#import "uicolor+uicolormain.h"

@implementation vairdetailinfo

-(instancetype)init:(mstationsreadingitem*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

@end