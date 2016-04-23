#import "vairmap.h"
#import "genericconstants.h"
#import "uicolor+uicolormain.h"

static CGFloat const animationaddseconds = 0.3;
static NSInteger const marginvr = 50;

@implementation vairmap

-(instancetype)init:(cair*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.controller = controller;
    
    return self;
}

#pragma mark functionality

-(void)loadmap
{
    self.model = [[mcdmap alloc] init];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf displaymap];
                   });
}

-(void)displaymap
{
    CGFloat height = airmapheight - (marginvr + marginvr);
    
    UIView *overview = [[UIView alloc] init];
    [overview setUserInteractionEnabled:NO];
    [overview setClipsToBounds:YES];
    [overview setTranslatesAutoresizingMaskIntoConstraints:NO];
    [overview setBackgroundColor:[UIColor clearColor]];
    self.overview = overview;
    
    [self addSubview:overview];
    
    NSDictionary *views = @{@"over":overview};
    NSDictionary *metrics = @{@"height":@(height), @"marginvr":@(marginvr)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[over]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(marginvr)-[over(height)]" options:0 metrics:metrics views:views]];
    
    NSArray<mcdmapitem*> *items = self.model.items;
    CGFloat animationseconds = animationaddseconds;
    
    for(mcdmapitem *item in items)
    {
        UIImageView *view = [[UIImageView alloc] init];
        [view setUserInteractionEnabled:NO];
        [view setClipsToBounds:YES];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        [view setContentMode:UIViewContentModeCenter];
        [view setTintColor:item.readingmodel.index.color];
        [view setAlpha:0];
        
        __weak typeof(view) wiew = view;
        
        [overview addSubview:view];
        
        views = @{@"view":view};
        
        [overview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:metrics views:views]];
        [overview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:metrics views:views]];
        animationseconds += animationaddseconds;
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [wiew setImage:item.asset];
                           
                           [UIView animateWithDuration:animationseconds animations:
                            ^
                            {
                                [wiew setAlpha:1];
                            }];
                       });
    }
}

#pragma mark public

-(void)refresh
{
    [self clean];
    
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [welf loadmap];
                   });
}

-(void)clean
{
    [self.overview removeFromSuperview];
}

@end