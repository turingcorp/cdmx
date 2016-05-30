#import "aparserclimate.h"

@interface mclimate ()

-(instancetype)init:(NSDictionary*)dictionary;

@end

@interface aparserclimate ()

@property(strong, nonatomic, readwrite)mclimate *climate;

@end

@implementation aparserclimate

-(void)parse:(NSDictionary*)json
{
    [super parse:json];
    
    if(self.validjson)
    {
        self.climate = [[mclimate alloc] init:self.validjson];
    }
}

@end