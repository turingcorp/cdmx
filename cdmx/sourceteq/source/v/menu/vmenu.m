#import "vmenu.h"
#import "cmenu.h"

@interface vmenu ()

@property(weak, nonatomic)cmenu *controller;

@end

@implementation vmenu

@dynamic controller;

-(instancetype)init:(cmenu*)controller
{
    self = [super init:controller];
    
    return self;
}

@end