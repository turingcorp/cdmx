#import "mnodriveratingtwo.h"

@interface mnodriverating ()

@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mnodriveratingtwo

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mnodrive_rating_2", nil);
    
    return self;
}

@end