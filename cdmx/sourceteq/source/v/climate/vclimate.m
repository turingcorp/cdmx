#import "vclimate.h"
#import "vclimatebar.h"
#import "vclimatecell.h"
#import "efont.h"

@interface vclimate ()

@property(strong, nonatomic, readwrite)mclimatecurrent *model;
@property(weak, nonatomic, readwrite)cclimate *controller;

@end

@implementation vclimate

-(instancetype)init:(cclimate*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    vclimatebar *bar = [[vclimatebar alloc] init:controller];
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setSectionInset:UIEdgeInsetsZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setUserInteractionEnabled:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection setHidden:YES];
    self.collection = collection;
    
    [self addSubview:spinner];
    [self addSubview:collection];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"spinner":spinner, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[spinner]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionbuttonerror:(UIButton*)button
{
    [self displayloading];
    [self.controller loadclimate];
}

#pragma mark functionality

-(void)displayloaded
{
    [self.spinner setHidden:YES];
    [self.spinner stopAnimating];
    [self.collection setHidden:NO];
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
}

-(void)displayloading
{
    [self.spinner setHidden:NO];
    [self.spinner startAnimating];
    [self.collection setHidden:YES];
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
}

-(void)displayerror
{
    [self.spinner setHidden:YES];
    [self.spinner stopAnimating];
    [self.collection setHidden:YES];
    [self.labelerror removeFromSuperview];
    [self.buttonerror removeFromSuperview];
}

-(mclimatecurrentitem*)modelforindex:(NSIndexPath*)index
{
    mclimatecurrentitem *model = self.model.items[index.item];
    
    return model;
}

#pragma mark public

-(void)climateloaded:(mclimatecurrent*)model
{
    self.model = model;
    [self displayloaded];
    
    for(mclimatecurrentitem *item in model.items)
    {
        [self.collection registerClass:item.cellclass forCellWithReuseIdentifier:item.reusableidentifier];
    }
    
    [self.collection reloadData];
}

-(void)error:(NSString*)error
{
    [self displayerror];
    
    UILabel *labelerror = [[UILabel alloc] init];
    [labelerror setBackgroundColor:[UIColor clearColor]];
    [labelerror setUserInteractionEnabled:NO];
    [labelerror setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelerror setUserInteractionEnabled:NO];
    [labelerror setNumberOfLines:0];
    [labelerror setTextAlignment:NSTextAlignmentCenter];
    [labelerror setFont:[UIFont regularsize:16]];
    [labelerror setTextColor:[UIColor colorWithWhite:0.5 alpha:1]];
    [labelerror setText:error];
    self.labelerror = labelerror;
    
    UIButton *buttonerror = [[UIButton alloc] init];
    [buttonerror setBackgroundColor:[UIColor clearColor]];
    [buttonerror setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonerror setClipsToBounds:YES];
    [buttonerror setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonerror setTitleColor:[[UIColor colorWithWhite:0.8 alpha:1] colorWithAlphaComponent:0.2] forState:UIControlStateHighlighted];
    [buttonerror setTitle:NSLocalizedString(@"api_retry", nil) forState:UIControlStateNormal];
    [buttonerror.titleLabel setFont:[UIFont boldsize:16]];
    [buttonerror addTarget:self action:@selector(actionbuttonerror:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonerror = buttonerror;
    
    [self addSubview:labelerror];
    [self addSubview:buttonerror];
    
    NSDictionary *views = @{@"label":labelerror, @"button":buttonerror};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[button]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[label(60)]-0-[button(40)]" options:0 metrics:metrics views:views]];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    mclimatecurrentitem *model = [self modelforindex:index];
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, model.cellheight);
    
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
    mclimatecurrentitem *model = [self modelforindex:index];
    vclimatecell *cell = [col dequeueReusableCellWithReuseIdentifier:model.reusableidentifier forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end