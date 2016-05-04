#import "vpollutionfront.h"

@implementation vpollutionfront

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    self.controller = controller;
    
    return self;
}

@end