#import "cair.h"
#import "vair.h"
#import "cmain.h"
#import "cairgeo.h"
#import "cairdetail.h"

@interface cair ()

@property(strong, nonatomic)vair *view;

@end

@implementation cair

@dynamic view;

-(void)loadView
{
    self.view = [[vair alloc] init:self];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(!self.view.collection)
    {
        [self.view viewappear];
    }
}

#pragma mark public

-(void)openmenu
{
    [[cmain singleton].pages pagemenu];
}

-(void)opengeo
{
    cairgeo *controller = [[cairgeo alloc] init];
    [[cmain singleton] pushViewController:controller animated:YES];
}

-(void)selectitem:(mstationsreadingitem*)item
{
    cairdetail *controller = [[cairdetail alloc] init:item];
    [self.navigationController pushViewController:controller animated:YES];
}

@end