#import "vecobici.h"

static NSInteger const ecobicimenuheight = 50;

@implementation vecobici

-(instancetype)init:(cecobici*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    return self;
}

@end