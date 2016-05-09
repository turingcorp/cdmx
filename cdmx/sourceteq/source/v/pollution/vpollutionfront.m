#import "vpollutionfront.h"
#import "vpollutionfrontheader.h"
#import "vpollutionfrontcell.h"
#import "genericconstants.h"

static NSString* const frontheaderid = @"frontheader";
static NSString* const frontcellid = @"frontcell";
static NSInteger const frontcellwidth = 170;

@implementation vpollutionfront
{
    CGRect rect1;
    NSInteger currentcellmultiplier;
    NSInteger currentheadermultiplier;
    NSInteger currentheaderaddheight;
    NSInteger currentitems;
    NSInteger selected;
    BOOL trackscroll;
}

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    [self showdetail];
    
    trackscroll = NO;
    selected = -1;
    rect1 = CGRectMake(0, 0, 1, 1);
    
    UICollectionViewFlowLayout *flowdetail = [[UICollectionViewFlowLayout alloc] init];
    [flowdetail setHeaderReferenceSize:CGSizeZero];
    [flowdetail setMinimumInteritemSpacing:0];
    [flowdetail setMinimumLineSpacing:0];
    [flowdetail setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.flowdetail = flowdetail;
    
    UICollectionViewFlowLayout *flowlist = [[UICollectionViewFlowLayout alloc] init];
    [flowlist setFooterReferenceSize:CGSizeZero];
    [flowlist setMinimumInteritemSpacing:0];
    [flowlist setMinimumLineSpacing:0];
    [flowlist setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.flowlist = flowlist;
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowdetail];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection registerClass:[vpollutionfrontheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:frontheaderid];
    [collection registerClass:[vpollutionfrontcell class] forCellWithReuseIdentifier:frontcellid];
    [collection setDataSource:self];
    [collection setDelegate:self];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [self postselect:0];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 100), dispatch_get_main_queue(),
                   ^
                   {
                       [collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:selected inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                   });
    
    return self;
}

-(void)dealloc
{
    self.flowlist = nil;
    self.flowdetail = nil;
    [self.collection removeFromSuperview];
}

#pragma mark functionality

-(mpollutionitem*)modelforindex:(NSIndexPath*)index
{
    mpollutionitem *model = self.controller.model.items[index.item];
    
    return model;
}

-(void)postselect:(NSInteger)index
{
    if(index != selected)
    {
        selected = index;
        self.currentitem = self.controller.model.items[selected];
        [self.controller.model highlight:self.currentitem];
    }
}

#pragma mark public

-(void)showdetail
{
    currentheadermultiplier = 1;
    currentheaderaddheight = pollution_distminsize + pollution_distposy + pollution_distposy - navbarheightmin;
    currentcellmultiplier = 0;
    
    [self.collection setAlwaysBounceHorizontal:NO];
    [self.collection setAlwaysBounceVertical:YES];
    [self.collection setCollectionViewLayout:self.flowdetail animated:YES];
}

-(void)showlist
{
    currentheadermultiplier = 0;
    currentheaderaddheight = 0;
    currentcellmultiplier = 1;
    
    [self.collection setAlwaysBounceHorizontal:YES];
    [self.collection setAlwaysBounceVertical:NO];
    [self.collection setCollectionViewLayout:self.flowlist animated:YES];
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
    
    if(layout == self.flowlist)
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
    CGFloat height = col.bounds.size.height;
    CGFloat useheight = height * currentcellmultiplier;
    CGSize size = CGSizeMake(frontcellwidth, useheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForFooterInSection:(NSInteger)section
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
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.controller.model.items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vpollutionfrontheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:frontheaderid forIndexPath:index];
    [header config:self.currentitem controller:self.controller];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionitem *model = [self modelforindex:index];
    vpollutionfrontcell *cell = [col dequeueReusableCellWithReuseIdentifier:frontcellid forIndexPath:index];
    [cell config:model front:self];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [col scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self postselect:index.item];
    trackscroll = NO;
}

@end