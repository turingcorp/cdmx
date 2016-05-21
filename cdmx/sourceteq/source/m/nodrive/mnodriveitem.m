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
    self.permit = [dictionary[@"permit"] boolValue];
    NSArray *rawplates = dictionary[@"plates"];
    
    NSMutableArray<mnodriveitemplate*> *plates = [NSMutableArray array];
    NSUInteger countplates = rawplates.count;
    
    for(NSUInteger indexplates = 0; indexplates < countplates; indexplates++)
    {
        NSNumber *rawplate = rawplates[indexplates];
        mnodriveitemplate *plate = [mnodriveitemplate number:rawplate.integerValue];
        
        [plates addObject:plate];
    }
    
    self.plates = plates;
    
    return self;
}

@end