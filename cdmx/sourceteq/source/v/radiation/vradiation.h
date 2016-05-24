#import <UIKit/UIKit.h>
#import "cradiation.h"
#import "vradiationreactor.h"
#import "vradiationactivities.h"
#import "vradiationprecautions.h"
#import "mradiation.h"

@interface vradiation:UIView

-(instancetype)init:(cradiation*)controller;
-(void)radiationloaded:(mradiation*)model;
-(void)error:(NSString*)error;

@property(weak, nonatomic)cradiation *controller;
@property(weak, nonatomic)vradiationreactor *reactor;
@property(weak, nonatomic)vradiationactivities *activities;
@property(weak, nonatomic)vradiationprecautions *precautions;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *labelerror;
@property(weak, nonatomic)UIButton *buttonerror;
@property(strong, nonatomic)mradiation *model;

@end