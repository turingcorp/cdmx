#import <XCTest/XCTest.h>
#import "teststools.h"
#import "aparserpollution.h"

@interface testaparserpollution:XCTestCase

@property(strong, nonatomic)NSDictionary *pollutionmockup;

@end

@implementation testaparserpollution

-(void)setUp
{
    [super setUp];
    
    self.pollutionmockup = [teststools loadmock:@"mockpollution_common"];
}

-(void)tearDown
{
    [super tearDown];
    self.pollutionmockup = nil;
}
/*
-(void)testExample
{
    
}

- (void)testPerformanceExample
{
    [self measureBlock:
     ^{
        
    }];
}
*/
@end