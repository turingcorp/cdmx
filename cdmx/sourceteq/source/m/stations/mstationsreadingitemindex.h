#import <UIKit/UIKit.h>
#import "uicolor+uicolormain.h"
#import "mstationsreadingitemindexactivity.h"

@interface mstationsreadingitemindex:NSObject

+(instancetype)indexwithpoints:(NSInteger)points;
-(instancetype)init:(NSInteger)points;

@property(strong, nonatomic)mstationsreadingitemindexactivity *outdoors;
@property(strong, nonatomic)mstationsreadingitemindexactivity *exercise;
@property(strong, nonatomic)mstationsreadingitemindexactivity *sensible;
@property(strong, nonatomic)UIColor *color;
@property(nonatomic)NSInteger points;

@end