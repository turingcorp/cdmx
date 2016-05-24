#import "mradiationprecautionlevel.h"
#import "mradiationprecautionlevelnotnecessary.h"
#import "mradiationprecautionleveladvised.h"
#import "mradiationprecautionlevelmandatory.h"

@interface mradiationprecautionlevel ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationprecautionlevel

+(instancetype)notnecessary
{
    mradiationprecautionlevelnotnecessary *model = [[mradiationprecautionlevelnotnecessary alloc] init];
    
    return model;
}

+(instancetype)advised
{
    mradiationprecautionleveladvised *model = [[mradiationprecautionleveladvised alloc] init];
    
    return model;
}

+(instancetype)mandatory
{
    mradiationprecautionlevelmandatory *model = [[mradiationprecautionlevelmandatory alloc] init];
    
    return model;
}

@end