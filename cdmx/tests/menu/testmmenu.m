#import <XCTest/XCTest.h>
#import "mmenu.h"
#import "mmenusectionadmin.h"

@interface testmmenu:XCTestCase

@end

@implementation testmmenu

-(void)testmenuadminprivate
{
    BOOL foundadminsection = NO;
    mmenu *model = [[mmenu alloc] init];
    
    for(mmenusection *section in model.sections)
    {
        Class sectionclass = [section class];
        
        if(sectionclass == [mmenusectionadmin class])
        {
            foundadminsection = YES;
            
            break;
        }
    }
    
#if DEBUG
    
    XCTAssertTrue(foundadminsection, @"admin should be available in debug");
    
#else
    
    XCTAssertFalse(foundadminsection, @"admin should not be available in release");
    
#endif
    
}

@end