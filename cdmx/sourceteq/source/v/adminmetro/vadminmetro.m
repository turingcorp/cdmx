#import "vadminmetro.h"
#import "cadminmetro.h"

@interface vadminmetro ()

@property(weak, nonatomic)cadminmetro *controller;

@end

@implementation vadminmetro

@dynamic controller;

-(instancetype)init:(cadminmetro*)controller
{
    self = [super init:controller];
    [self.bar title:NSLocalizedString(@"mmenu_item_adminmetro", nil)];
    [self.bar buttonmenu];
    
    return self;
}

@end