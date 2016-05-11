#import <UIKit/UIKit.h>
#import "mpollutionmenu.h"
#import "cpollution.h"

@interface vpollutionmenu:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cpollution*)controller;

@property(weak, nonatomic)cpollution *controller;
@property(strong, nonatomic)mpollutionmenu *model;

@end