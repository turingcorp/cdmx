#import "mpollutionitemhourly.h"

@implementation mpollutionitemhourly

-(instancetype)init:(mpollutionindex*)index hour:(NSNumber*)hour
{
    self = [super init];
    self.index = index;
    self.makesstandby = NO;
    
    NSString *localizedstring = [NSString stringWithFormat:@"mpollution_item_hourly_%@", index];
    self.name = NSLocalizedString(localizedstring, nil);
    
    return self;
}

@end