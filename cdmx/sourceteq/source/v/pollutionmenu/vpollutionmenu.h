#import <UIKit/UIKit.h>
#import "mpollutionmenu.h"
#import "cpollution.h"

@interface vpollutionmenu:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cpollution*)controller;
-(void)optionsactive:(BOOL)active;

@property(strong, nonatomic)mpollutionmenu *model;
@property(weak, nonatomic)cpollution *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end