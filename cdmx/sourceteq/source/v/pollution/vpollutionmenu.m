#import "vpollutionmenu.h"
#import "vpollutionmenucell.h"

@implementation vpollutionmenu

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    self.model = [[mpollutionmenu alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsZero];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vpollutionmenucell class] forCellWithReuseIdentifier:[vpollutionmenucell reusableidentifier]];
    
    [self addSubview:collection];
    
    return self;
}

#pragma mark functionality

-(mpollutionmenuitem*)modelforindex:(NSIndexPath*)index
{
    mpollutionmenuitem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    NSInteger cellcount = self.model.items.count;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat heightpercell = height / cellcount;
    CGSize size = CGSizeMake(width, heightpercell);
    
    return size;
}

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
    mpollutionmenuitem *model = [self modelforindex:index];
    vpollutionmenucell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionmenucell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end