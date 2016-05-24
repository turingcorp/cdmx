#import "mnodriveratingzero.h"

@interface mnodriverating ()

@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mnodriveratingzero

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mnodrive_rating_0", nil);
    
    return self;
}

@end