#import "mnodriveitem.h"

@interface mnodriveitemplate ()

+(instancetype)number:(NSInteger)number;

@end

@interface mnodriveitem ()

@property(strong, nonatomic, readwrite)NSArray<mnodriveitemplate*> *plates;
@property(assign, nonatomic, readwrite)BOOL permit;

@end

@implementation mnodriveitem

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    return self;
}

@end