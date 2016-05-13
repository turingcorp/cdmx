#import "vpollutionmap.h"

@implementation vpollutionmap

-(instancetype)init:(cpollution*)controller
{
    self = [super init:controller];
    
    vpollutionmapdisplay *display = [[vpollutionmapdisplay alloc] init];
    self.display = display;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.collection = collection;
    
    [self addSubview:display];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"display":display, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[display]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[display]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end