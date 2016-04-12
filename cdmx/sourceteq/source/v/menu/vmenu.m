#import "vmenu.h"
#import "uicolor+uicolormain.h"
#import "vmenubanner.h"
#import "vmenuheader.h"
#import "vmenucell.h"
#import "cmain.h"

static NSString* const menuheaderid = @"headerid";
static NSString* const menucellid = @"cellid";
static NSUInteger const bannerheight = 200;

@implementation vmenu

-(instancetype)init:(cmenu*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor collection]];
    self.controller = controller;
    self.model = [cmain singleton].pages.model;
    
    vmenubanner *banner = [[vmenubanner alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:1];
    [flow setSectionInset:UIEdgeInsetsMake(bannerheight, 0, collectionbottom, 0)];
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
    
    NSDictionary *views = @{@"banner":banner};
    NSDictionary *metrics = @{@"bannerheight":@(bannerheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[banner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[banner(bannerheight)]" options:0 metrics:metrics views:views]];
    
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
    
}

@end