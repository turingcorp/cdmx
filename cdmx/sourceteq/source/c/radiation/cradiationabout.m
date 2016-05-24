#import "cradiationabout.h"
#import "vradiationabout.h"

@interface cradiationabout ()

@property(strong, nonatomic)vradiationabout *view;

@end

@implementation cradiationabout

@dynamic view;

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.view viewdidappear];
}

-(void)loadView
{
    self.view = [[vradiationabout alloc] init:self];
}

@end