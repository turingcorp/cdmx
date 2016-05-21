#import "mnodriveratingdouble.h"

@interface mnodriverating ()

@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mnodriveratingdouble

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mnodrive_rating_00", nil);
    
    return self;
}

@end