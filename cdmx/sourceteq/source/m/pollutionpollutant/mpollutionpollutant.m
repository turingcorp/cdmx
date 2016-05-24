#import "mpollutionpollutant.h"

static NSString* const pollutantlocalizedname = @"mpollution_pollutant_name_%@";
static NSInteger const pollutanttextmarginhr = 10;

@interface mpollutionpollutant ()

@property(strong, nonatomic, readwrite)NSAttributedString *attributedstring;

@end

@implementation mpollutionpollutant

+(CGFloat)marginhr
{
    return pollutanttextmarginhr;
}

+(instancetype)server:(NSNumber*)serverid
{
    mpollutionpollutant *model = [[mpollutionpollutant alloc] init:serverid];
    
    return model;
}

-(instancetype)init:(NSNumber*)serverid
{
    self = [super init];
    self.serverid = serverid;
    self.cellheight = 0;
    
    NSString *pollutantname = [NSString stringWithFormat:pollutantlocalizedname, serverid];
    self.name = NSLocalizedString(pollutantname, nil);
    
    return self;
}

#pragma mark public

-(void)createattributedstring:(NSString*)string attributes:(NSDictionary*)attributes width:(CGFloat)width
{
    CGFloat usablewidth = width - (pollutanttextmarginhr + pollutanttextmarginhr);
    NSMutableAttributedString *attributedstring = [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
    self.cellheight = ceilf([attributedstring boundingRectWithSize:CGSizeMake(usablewidth, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
    self.attributedstring = attributedstring;
}

@end