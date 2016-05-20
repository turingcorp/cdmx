#import "vradiationabout.h"
#import "cradiationabout.h"

@interface vradiationabout ()

@property(weak, nonatomic)cradiationabout *controller;

@end

@implementation vradiationabout

@dynamic controller;

-(instancetype)init:(ccontroller*)controller
{
    self = [super init:controller];
    [self.bar buttonback];
    [self.bar title:NSLocalizedString(@"vradiation_about_title", nil)];
    
    return self;
}

@end