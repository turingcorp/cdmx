#import "mnodriveratingone.h"

@interface mnodriverating ()

@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mnodriveratingone

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mnodrive_rating_1", nil);
    
    return self;
}

@end