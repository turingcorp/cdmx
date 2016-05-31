#import "vecobicimenu.h"
#import "vecobicimenucell.h"
#import "ecollectioncell.h"

static NSInteger const ecobicimenucellwidth = 60;

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
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    self.collection = collection;
    
    [self addSubview:collection];
    
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
    vecobicimenucell *cell = [col dequeueReusableCellWithReuseIdentifier:[vecobicimenucell reusableidentifier] forIndexPath:index];
    
    return cell;
}

@end