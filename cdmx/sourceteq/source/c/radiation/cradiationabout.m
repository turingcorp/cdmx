#import "cradiationabout.h"
#import "vradiationabout.h"

@interface cradiationabout ()

@property(strong, nonatomic)vradiationabout *view;

@end

@implementation cradiationabout

@dynamic view;

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)loadView
{
    self.view = [[vradiationabout alloc] init:self];
}

@end