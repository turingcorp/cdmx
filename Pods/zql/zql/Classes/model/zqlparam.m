#import "zqlparam.h"

static NSString* const zqlparamcreatestring = @"%@ %@";
static NSString* const zqlparamcreatestringunique = @"%@ %@ unique on conflict replace";

@interface zqlparam ()

@property(copy, nonatomic)NSString *comparename;

@end

@implementation zqlparam

+(instancetype)type:(zqltype*)type name:(NSString*)name value:(id)value
{
    zqlparam *param;
    
    if(type && name)
    {
        param = [[zqlparam alloc] init:name];
        param.type = type;
        param.value = value;
    }
    
    return param;
}

-(instancetype)init:(NSString*)name
{
    self = [super init];
    self.name = name;
    self.comparename = name.lowercaseString;
    self.unique = NO;
    
    return self;
}

-(NSString*)description
{
    NSString *descr = [NSString stringWithFormat:@"%@[%@]:%@", self.name, self.type, self.value];
    
    return descr;
}

#pragma mark public

-(NSString*)querycreate
{
    NSString *string;
    
    if(self.unique)
    {
        string = [NSString stringWithFormat:zqlparamcreatestringunique, self.name, [self.type createquery]];
    }
    else
    {
        string = [NSString stringWithFormat:zqlparamcreatestring, self.name, [self.type createquery]];
    }
    
    return string;
}

-(NSString*)queryvalue
{
    NSString *string = [self.type queryvalue:self.value];
    
    return string;
}

@end