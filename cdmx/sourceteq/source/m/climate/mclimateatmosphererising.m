#import "mclimateatmosphererising.h"
#import "mclimateatmosphererisingsteady.h"
#import "mclimateatmosphererisingrising.h"
#import "mclimateatmosphererisingfalling.h"

@interface mclimateatmosphererising ()

@property(copy, nonatomic, readwrite)NSString *name;
@property(copy, nonatomic, readwrite)NSString *asset;

@end

@implementation mclimateatmosphererising

+(instancetype)status:(NSInteger)status
{
    mclimateatmosphererising *model;
    
    switch(status)
    {
        case 1:
            
            model = [[mclimateatmosphererisingrising alloc] init];
            
            break;
            
        case 2:
            
            model = [[mclimateatmosphererisingfalling alloc] init];
            
            break;
            
        default:
            
            model = [[mclimateatmosphererisingsteady alloc] init];
            
            break;
    }
    
    return model;
}

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendFormat:@"[rising %@]", self.name];
    
    return string;
}

@end