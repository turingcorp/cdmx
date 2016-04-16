#import "mcdmapitem.h"

@implementation mcdmapitem

-(instancetype)init:(NSString*)shortname
{
    self = [super init];
    self.lookshortname = shortname;
    [self findstation];
    
    return self;
}

#pragma mark functionality

-(void)findstation
{
    
}

@end