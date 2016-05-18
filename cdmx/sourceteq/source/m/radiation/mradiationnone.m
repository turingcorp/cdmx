#import "mradiationnone.h"
#import "ecolor.h"

@interface mradiation ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(strong, nonatomic, readwrite)UIColor *color;

@end

@implementation mradiationnone

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"mradiation_index_none", nil);
    
    return self;
}

@end