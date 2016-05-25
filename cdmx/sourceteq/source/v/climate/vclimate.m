#import "vclimate.h"

@interface vclimate ()

@property(weak, nonatomic, readwrite)cclimate *controller;

@end

@implementation vclimate

-(instancetype)init:(cclimate*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    return self;
}

@end