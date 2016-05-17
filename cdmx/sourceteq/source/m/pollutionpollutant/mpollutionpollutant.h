#import <UIKit/UIKit.h>

@interface mpollutionpollutant:NSObject

+(CGFloat)marginhr;
+(instancetype)server:(NSNumber*)serverid;
-(void)createattributedstring:(NSString*)string attributes:(NSDictionary*)attributes width:(CGFloat)width;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSNumber *serverid;
@property(strong, nonatomic, readonly)NSAttributedString *attributedstring;
@property(assign, nonatomic)CGFloat cellheight;

@end