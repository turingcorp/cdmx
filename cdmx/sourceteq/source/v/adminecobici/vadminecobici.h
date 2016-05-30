#import <UIKit/UIKit.h>
#import "vview.h"
#import "vspinner.h"

@interface vadminecobici:vview

-(void)error:(NSString*)error;
-(void)succeded:(NSURL*)dburl;

@property(strong, nonatomic, readonly)NSURL *dburl;
@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UILabel *labelerror;
@property(weak, nonatomic)UILabel *labelexport;
@property(weak, nonatomic)UIButton *buttonretry;
@property(weak, nonatomic)UIButton *buttonexport;

@end