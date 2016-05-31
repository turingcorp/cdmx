#import "vecobicimenu.h"

@interface vecobicimenu ()

@property(weak, nonatomic, readwrite)UICollectionView *collection;
@property(weak, nonatomic, readwrite)cecobici *controller;
@property(strong, nonatomic, readwrite)mecobicimenu *model;

@end

@implementation vecobicimenu

-(instancetype)init:(cecobici*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    self.controller = controller;
    self.model = [[mecobicimenu alloc] init];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    
}

@end