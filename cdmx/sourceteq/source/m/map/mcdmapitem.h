#import <UIKit/UIKit.h>
#import "mstationsreadingitem.h"

@interface mcdmapitem:NSObject

-(instancetype)init:(NSString*)shortname;

@property(weak, nonatomic)mstationsreadingitem *readingmodel;
@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *lookshortname;
@property(strong, nonatomic)UIImage *asset;

@end