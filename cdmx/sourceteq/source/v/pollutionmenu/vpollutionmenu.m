#import "vpollutionmenu.h"
#import "vpollutionmenucell.h"
#import "ecell.h"

static NSInteger const menucellwidth = 50;

@implementation vpollutionmenu

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    self.model = [[mpollutionmenu alloc] init];
    
    UIImageView *background = [[UIImageView alloc] init];
    [background setUserInteractionEnabled:NO];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background setClipsToBounds:YES];
    [background setContentMode:UIViewContentModeBottom];
    [background setImage:[UIImage imageNamed:@"pollution_background"]];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
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
    
    [self addSubview:background];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"background":background};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[background]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[background]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    
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

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    NSInteger cellcount = self.model.items.count;
    CGFloat width = col.bounds.size.width;
    CGFloat widthallcells = cellcount * menucellwidth;
    CGFloat remain = width - widthallcells;
    CGFloat margin = remain / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat height = self.bounds.size.height;
    CGSize size = CGSizeMake(menucellwidth, height);
    
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

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    UICollectionViewCell *cell = [col cellForItemAtIndexPath:index];
    BOOL selectable = !cell.isSelected;
    
    return selectable;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionmenuitem *model = [self modelforindex:index];
    [model actionselected:self.controller.view];
}

@end