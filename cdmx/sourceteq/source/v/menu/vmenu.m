#import "vmenu.h"
#import "uicolor+uicolormain.h"
#import "vmenubanner.h"
#import "vmenuheader.h"
#import "vmenucell.h"
#import "cmain.h"
#import "genericconstants.h"

static NSString* const menuheaderid = @"headerid";
static NSString* const menucellid = @"cellid";
static NSInteger const bannerheight = 200;
static NSInteger const headerheight = 55;
static NSInteger const cellheight = 90;
static NSInteger const interitem = -1;

@implementation vmenu

-(instancetype)init:(cmenu*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
//    self.model = [cmain singleton].pages.model;
    
    vmenubanner *banner = [[vmenubanner alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:interitem];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setClipsToBounds:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vmenuheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:menuheaderid];
    [collection registerClass:[vmenucell class] forCellWithReuseIdentifier:menucellid];
    self.collection = collection;
    
    [self addSubview:banner];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"banner":banner, @"col":collection};
    NSDictionary *metrics = @{@"bannerheight":@(bannerheight), @"navbarheightmin":@(navbarheightmin)};
    
    self.layoutbannerheight = [NSLayoutConstraint constraintWithItem:banner attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:bannerheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[banner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[banner]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(navbarheightmin)-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbannerheight];
    
    return self;
}

#pragma mark functionality

-(mpagesitem*)modelatindex:(NSIndexPath*)index
{
    mpagesitem *model = self.model.sections[index.section - 1].items[index.item];
    
    return model;
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offset = self.collection.contentOffset.y;
    CGFloat newbannerheight = bannerheight - offset;
    
    if(newbannerheight < navbarheightmin)
    {
        newbannerheight = navbarheightmin;
    }
    
    self.layoutbannerheight.constant = newbannerheight;
}

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets;
    
    if(section)
    {
        insets = UIEdgeInsetsMake(interitem, 0, collectionbottom, 0);
    }
    else
    {
        insets = UIEdgeInsetsMake(bannerheight, 0, 0, 0);
    }
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGFloat height = 0;
    
    if(section)
    {
        height = headerheight;
    }
    
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSUInteger sections = self.model.sections.count + 1;
    
    return sections;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger items = 0;
    
    if(section)
    {
        items = self.model.sections[section - 1].items.count;
    }
    
    return items;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vmenuheader *reusable = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:menuheaderid forIndexPath:index];
    [reusable config:self.model.sections[index.section - 1]];
    
    return reusable;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpagesitem *model = [self modelatindex:index];
    vmenucell *cell = [col dequeueReusableCellWithReuseIdentifier:menucellid forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mpagesitem *model = [self modelatindex:index];
//    [[cmain singleton].pages page:model animated:YES direction:UIPageViewControllerNavigationDirectionForward];
}

@end