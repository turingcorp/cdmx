#import "mradiationreactor.h"
#import "ecolor.h"

static CGFloat const radiationreactorsunradius = 100;
static CGFloat const radiationreactorstartingradius = 0;
static CGFloat const radiationreactorendingradius = 6.2832;
static CGFloat const radiationreactorraywidth = 0.05;
static CGFloat const radiationreactorrayspacing = 0.02;
static CGFloat const radiationreactorlinewidth = 3;

@implementation mradiationreactor

-(instancetype)init
{
    self = [super init];
    self.color = [UIColor background];
    self.sunradius = radiationreactorsunradius;
    self.startingradius = radiationreactorstartingradius;
    self.endingradius = radiationreactorendingradius;
    self.raywidth = radiationreactorraywidth;
    self.rayspacing = radiationreactorrayspacing;
    self.linewidth = radiationreactorlinewidth;
    
    return self;
}

@end