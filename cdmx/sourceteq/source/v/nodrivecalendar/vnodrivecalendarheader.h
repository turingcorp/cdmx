#import <UIKit/UIKit.h>
#import "mnodrivecalendarsection.h"

@interface vnodrivecalendarheader:UICollectionReusableView

-(void)config:(mnodrivecalendarsection*)model;

@property(weak, nonatomic)UILabel *title;

@end