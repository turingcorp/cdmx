#import "vpollutionmenu.h"
#import "vpollutionmenucell.h"
#import "ecollectioncell.h"
#import "ecolor.h"
#import "analytics.h"

static NSInteger const menucellwidth = 50;

@implementation vpollutionmenu

-(instancetype)init:(cpollution*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.96]];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    self.model = [[mpollutionmenu alloc] init];
    
    UIButton *buttonmenu = [[UIButton alloc] init];
    [buttonmenu setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonmenu setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonmenu setImage:[[UIImage imageNamed:@"generic_menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonmenu setClipsToBounds:YES];
    [buttonmenu.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonmenu.imageView setClipsToBounds:YES];
    [buttonmenu.imageView setTintColor:[UIColor blackColor]];
    [buttonmenu setImageEdgeInsets:UIEdgeInsetsMake(14, 0, 13, 18)];
    [buttonmenu addTarget:self action:@selector(actionmenu:) forControlEvents:UIControlEventTouchUpInside];
    
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
    self.collection = collection;
    
    UIView *border = [[UIView alloc] init];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setBackgroundColor:[UIColor background]];
    [border setUserInteractionEnabled:NO];
    
    [self addSubview:border];
    [self addSubview:collection];
    [self addSubview:buttonmenu];
    
    NSDictionary *views = @{@"col":collection, @"border":border, @"button":buttonmenu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    
    [self optionsactive:NO];
    [collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    
    return self;
}

#pragma mark actions

-(void)actionmenu:(UIButton*)button
{
    [self.controller menu];
}

#pragma mark functionality

-(mpollutionmenuitem*)modelforindex:(NSIndexPath*)index
{
    mpollutionmenuitem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark public

-(void)optionsactive:(BOOL)active
{
    if(active)
    {
        [self.collection setUserInteractionEnabled:YES];
        [self.collection setAlpha:1];
    }
    else
    {
        [self.collection setUserInteractionEnabled:NO];
        [self.collection setAlpha:0.5];
    }
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
    if(self.controller.model)
    {
        mpollutionmenuitem *model = [self modelforindex:index];
        [model actionselected:self.controller.view];
        
        [[analytics singleton] trackevent:self.controller action:model.asset label:nil];
    }
}

@end