#import "mpollutionread.h"
#import "mdbselect.h"

@implementation mpollutionread

+(instancetype)load
{
    NSArray<modeldaily*> *modeldaily = [mdbselect pollutiondaily];
    
    return nil;
}

+(instancetype)lastread
{
    mpollutionindex *index = [mpollutionindex points:170];
    mpollutionread *read = [[mpollutionread alloc] init];
    read.items = @[
                   [mpollutionreaditem global:index]
                   ];
    
    return read;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

@end