#import "mradiationprecaution.h"
#import "mradiationprecautionumbrella.h"
#import "mradiationprecautionshades.h"
#import "mradiationprecautionsunscreen.h"

@interface mradiationprecaution ()

@property(strong, nonatomic, readwrite)mradiationprecautionlevel *level;
@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mradiationprecaution

+(instancetype)umbrella:(mradiationprecautionlevel*)level
{
    mradiationprecautionumbrella *model = [[mradiationprecautionumbrella alloc] init:level];
    
    return model;
}

+(instancetype)shades:(mradiationprecautionlevel*)level
{
    mradiationprecautionshades *model = [[mradiationprecautionshades alloc] init:level];
    
    return model;
}

+(instancetype)sunscreen:(mradiationprecautionlevel*)level
{
    mradiationprecautionsunscreen *model = [[mradiationprecautionsunscreen alloc] init:level];
    
    return model;
}

-(instancetype)init:(mradiationprecautionlevel*)level
{
    self = [self init];
    self.level = level;
    
    return self;
}

@end