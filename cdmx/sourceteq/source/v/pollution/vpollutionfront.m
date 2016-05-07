#import "vpollutionfront.h"
#import "vpollutionfrontheader.h"
#import "vpollutionfrontcell.h"
#import "genericconstants.h"

static NSString* const frontheaderid = @"frontheader";
static NSString* const frontcellid = @"frontcell";
static NSInteger const frontcellwidth = 200;

@implementation vpollutionfront
{
    CGRect rect1;
    NSInteger currentcellmultiplier;
    NSInteger currentheadermultiplier;
    NSInteger currentheaderaddheight;
    NSInteger currentitems;
}

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    [self showdetail];
    
    rect1 = CGRectMake(0, 0, 1, 1);
    self.model = [mpollutionread lastread];
    self.currentreaditem = self.model.items[0];
    
    UICollectionViewFlowLayout *flowdetail = [[UICollectionViewFlowLayout alloc] init];
    [flowdetail setFooterReferenceSize:CGSizeZero];
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
    [collection registerClass:[vpollutionfrontheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:frontheaderid];
    [collection registerClass:[vpollutionfrontcell class] forCellWithReuseIdentifier:frontcellid];
    [collection setDataSource:self];
    [collection setDelegate:self];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    self.flowlist = nil;
    self.flowdetail = nil;
    [self.collection removeFromSuperview];
}

#pragma mark functionality

-(mpollutionreaditem*)modelforindex:(NSIndexPath*)index
{
    mpollutionreaditem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark public

-(void)showdetail
{
    currentheadermultiplier = 1;
    currentheaderaddheight = pollution_distminsize + pollution_distposy + pollution_distposy - navbarheightmin;
    currentcellmultiplier = 0;
    
    [self.collection setAlwaysBounceHorizontal:NO];
    [self.collection setAlwaysBounceVertical:YES];
    
    __weak typeof(self) welf = self;
    
    [self.collection setCollectionViewLayout:self.flowdetail animated:YES completion:
     ^(BOOL done)
     {
         [welf.collection scrollRectToVisible:rect1 animated:YES];
     }];
}

-(void)showlist
{
    currentheadermultiplier = 0;
    currentheaderaddheight = 0;
    currentcellmultiplier = 1;
    
    [self.collection setAlwaysBounceHorizontal:YES];
    [self.collection setAlwaysBounceVertical:NO];
    
    __weak typeof(self) welf = self;
    
    [self.collection setCollectionViewLayout:self.flowlist animated:YES completion:
     ^(BOOL done)
     {
         [welf.collection scrollRectToVisible:rect1 animated:YES];
     }];
}

#pragma mark -
#pragma mark col del

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
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vpollutionfrontheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:frontheaderid forIndexPath:index];
    [header config:self.currentreaditem controller:self.controller];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mpollutionreaditem *model = [self modelforindex:index];
    
    vpollutionfrontcell *cell = [col dequeueReusableCellWithReuseIdentifier:frontcellid forIndexPath:index];
    [cell config:model front:self];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
}

@end