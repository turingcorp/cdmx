#import "vpollutionfront.h"
#import "vpollutionfrontheader.h"
#import "vpollutionfrontcell.h"

static NSString* const frontheaderid = @"frontheader";
static NSString* const frontcellid = @"frontcell";
static NSInteger const frontcellheight = 50;
static NSInteger const frontheaderheight = 200;

@implementation vpollutionfront

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    return self;
}

#pragma mark public

-(void)showdetail
{
    
}

-(void)showlist
{
    
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    return nil;
}

@end