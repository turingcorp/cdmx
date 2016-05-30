#import "vmenu.h"
#import "cmenu.h"
#import "vmenuheader.h"
#import "vmenucell.h"
#import "vmenubar.h"
#import "ecollectionreusable.h"
#import "ecollectioncell.h"
#import "genericconstants.h"

static NSInteger const menubarheight = 180;
static NSInteger const menucollectionbottom = 40;
static NSInteger const menuheaderheight = 50;
static NSInteger const menucellheight = 60;
static NSInteger const menuinteritem = -1;

@interface vmenu ()

@property(weak, nonatomic)cmenu *controller;

@end

@implementation vmenu

@dynamic controller;

-(instancetype)init:(cmenu*)controller
{
    self = [super init:controller];

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:menuinteritem];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vmenucell class] forCellWithReuseIdentifier:[vmenucell reusableidentifier]];
    [collection registerClass:[vmenuheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vmenuheader reusableidentifier]];
    self.collection = collection;

    [self insertSubview:collection belowSubview:self.bar];
    
    NSDictionary *views = @{@"col":collection, @"bar":self.bar};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:self.bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:menubarheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
    return self;
}

#pragma mark functionality

-(mmenusection*)sectionforindex:(NSIndexPath*)index
{
    mmenusection *model = self.controller.model.sections[index.section - 1];
    
    return model;
}

-(mmenusectionitem*)itemforindex:(NSIndexPath*)index
{
    mmenusectionitem *model = self.controller.model.sections[index.section - 1].items[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offsety = scroll.contentOffset.y;
    CGFloat newbarheight = menubarheight - offsety;
    
    if(newbarheight < navbarheightmin)
    {
        newbarheight = navbarheightmin;
    }
    
    self.layoutbarheight.constant = newbarheight;
}

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets;
    
    if(section)
    {
        insets = UIEdgeInsetsMake(0, 0, menucollectionbottom, 0);
    }
    else
    {
        insets = UIEdgeInsetsMake(menubarheight, 0, 0, 0);
    }
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, menucellheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGFloat height = 0;
    
    if(section)
    {
        height = menuheaderheight;
    }
    
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSInteger countsections = self.controller.model.sections.count + 1;
    
    return countsections;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger countitems = 0;
    
    if(section)
    {
        countitems = self.controller.model.sections[section - 1].items.count;
    }
    
    return countitems;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    mmenusection *model = [self sectionforindex:index];
    vmenuheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vmenuheader reusableidentifier] forIndexPath:index];
    [header config:model];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mmenusectionitem *model = [self itemforindex:index];
    vmenucell *cell = [col dequeueReusableCellWithReuseIdentifier:[vmenucell reusableidentifier] forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mmenusectionitem *model = [self itemforindex:index];
    UIViewController *controller = [model controller];
    [self.controller menuselected:controller];
}

#pragma mark view

-(vviewbar*)loadbar
{
    vmenubar *bar = [[vmenubar alloc] init:self.controller];
    
    return bar;
}

@end