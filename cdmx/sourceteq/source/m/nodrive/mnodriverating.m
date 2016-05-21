#import "mnodriverating.h"
#import "mnodriveratingdouble.h"
#import "mnodriveratingzero.h"
#import "mnodriveratingone.h"
#import "mnodriveratingtwo.h"

@interface mnodriverating ()

@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mnodriverating

+(instancetype)rate00
{
    mnodriverating *model = [[mnodriveratingdouble alloc] init];
    
    return model;
}

+(instancetype)rate0
{
    mnodriverating *model = [[mnodriveratingzero alloc] init];
    
    return model;
}

+(instancetype)rate1
{
    mnodriverating *model = [[mnodriveratingone alloc] init];
    
    return model;
}

+(instancetype)rate2
{
    mnodriverating *model = [[mnodriveratingtwo alloc] init];
    
    return model;
}

@end