#import "vpollutionfront.h"
#import "vpollutionfrontheader.h"
#import "vpollutionfrontcell.h"
#import "ecollectioncell.h"
#import "ecollectionreusable.h"
#import "genericconstants.h"
#import "analytics.h"

static NSInteger const frontcellwidth = 170;

@implementation vpollutionfront
{
    NSInteger currentheadermultiplier;
    NSInteger currentheaderaddheight;
    NSInteger selected;
    NSInteger currentitems;
    NSInteger sections;
    BOOL trackscroll;
}

-(instancetype)init:(cpollution*)controller
{
    self = [super init:controller];
    self.model = (mpollutionfront*)controller.model.option;
    trackscroll = NO;
    selected = -1;
    sections = 1;
    
    vpollutionfrontlayout *layout = [[vpollutionfrontlayout alloc] init];
    self.layout = layout;
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection registerClass:[vpollutionfrontheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[vpollutionfrontheader reusableidentifier]];
    [collection registerClass:[vpollutionfrontcell class] forCellWithReuseIdentifier:[vpollutionfrontcell reusableidentifier]];
    [collection setDataSource:self];
    [collection setDelegate:self];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [self postselect:0];
    [self showdetail:NO];
    
    return self;
}

#pragma mark functionality

-(mpollutionfrontitem*)modelforindex:(NSIndexPath*)index
{
    mpollutionfrontitem *model = self.model.items[index.item];
    
    return model;
}

-(void)postselect:(NSInteger)index
{
    if(index != selected)
    {
        selected = index;
        self.currentitem = self.model.items[selected];
        [self.model highlight:self.currentitem];
    }
}

-(void)updatecollection:(UICollectionViewScrollDirection)direction
{
    NSIndexSet *index = [NSIndexSet indexSetWithIndex:0];
    sections = 0;
    __weak typeof(self) welf = self;
    
    [welf.collection performBatchUpdates:
     ^
     {
         [welf.collection deleteSections:index];
     } completion:
     ^(BOOL done)
     {
         [welf.layout setScrollDirection:direction];
         sections = 1;
         
         [welf.collection performBatchUpdates:
          ^
          {
              [welf.collection insertSections:index];
          } completion:
          ^(BOOL done)
          {
              if(currentitems)
              {
                  [welf.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:selected inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
              }
          }];
     }];
}

#pragma mark public

-(void)showdetail:(BOOL)update
{
    currentheadermultiplier = 1;
    currentheaderaddheight = pollution_drawableheight - navbarheightmin;
    currentitems = 0;
    
    [self.collection setAlwaysBounceHorizontal:NO];
    [self.collection setAlwaysBounceVertical:YES];
    
    if(update)
    {
        [self updatecollection:UICollectionViewScrollDirectionVertical];
    }
}

-(void)showlist
{
    currentheadermultiplier = 0;
    currentheaderaddheight = 0;
    currentitems = self.model.items.count;

    [self.collection setAlwaysBounceHorizontal:YES];
    [self.collection setAlwaysBounceVertical:NO];
    [self updatecollection:UICollectionViewScrollDirectionHorizontal];
}

#pragma mark -
#pragma mark col del

-(void)scrollViewWillBeginDragging:(UIScrollView*)drag
{
    trackscroll = YES;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView*)scroll
{
    trackscroll = NO;
}

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    if(trackscroll)
    {
        CGFloat leftoffset = scroll.contentOffset.x;
        CGFloat width = scroll.bounds.size.width;
        CGFloat width_2 = width / 2.0;
        
        CGPoint point = CGPointMake(leftoffset + width_2, 0);
        NSIndexPath *index = [self.collection indexPathForItemAtPoint:point];
        
        if(index)
        {
            [self postselect:index.item];
            [self.collection selectItemAtIndexPath:index animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        }
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets;
    
    if(currentitems)
    {
        CGFloat width = col.bounds.size.width;
        CGFloat remain = width - frontcellwidth;
        CGFloat margin = remain / 2.0;
        insets = UIEdgeInsetsMake(0, margin, 0, margin);
    }
    else
    {
        insets = UIEdgeInsetsZero;
    }
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = 0;
    CGFloat height = 0;
    
    if(currentitems)
    {
        width = frontcellwidth;
        height = col.bounds.size.height;
    }
    
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGFloat height = col.bounds.size.height;
    CGFloat usewidth = width * currentheadermultiplier;
    CGFloat useheight = height * currentheadermultiplier;
    useheight += currentheaderaddheight;
    CGSize size = CGSizeMake(usewidth, useheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return sections;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return currentitems;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vpollutionfrontheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[vpollutionfrontheader reusableidentifier] forIndexPath:index];
    [header config:self.currentitem controller:self.controller];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionfrontitem *model = [self modelforindex:index];
    vpollutionfrontcell *cell = [col dequeueReusableCellWithReuseIdentifier:[vpollutionfrontcell reusableidentifier] forIndexPath:index];
    [cell config:model front:self];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    trackscroll = NO;
    [col scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self postselect:index.item];
    
    [[analytics singleton] trackevent:self.controller action:@"front" label:self.currentitem.name];
}

@end