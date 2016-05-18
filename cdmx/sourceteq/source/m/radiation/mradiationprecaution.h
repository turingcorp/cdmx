#import <Foundation/Foundation.h>
#import "mradiationprecautionlevel.h"

@interface mradiationprecaution:NSObject

+(instancetype)umbrella:(mradiationprecautionlevel*)level;
+(instancetype)shades:(mradiationprecautionlevel*)level;
+(instancetype)sunscreen:(mradiationprecautionlevel*)level;

@property(strong, nonatomic, readonly)mradiationprecautionlevel *level;
@property(copy, nonatomic, readonly)NSString *name;
@property(copy, nonatomic, readonly)NSString *asset;

@end