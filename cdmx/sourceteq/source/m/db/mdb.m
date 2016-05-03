#import "mdb.h"
//#import "mdbcreate.h"
//#import "mdirs.h"
//
@implementation mdb
//
//+(void)updatedb
//{
//    NSString *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
//    NSDictionary *def = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"defs" withExtension:@"plist"]];
//    
//    NSString *dbfoldername = @"db";
//    NSString *defdbname = def[@"dbname"];
//    NSString *relative = [dbfoldername stringByAppendingPathComponent:defdbname];
//    NSString *dbfolder = [documents stringByAppendingPathComponent:dbfoldername];
//    [userdef setValue:relative forKey:@"dbname"];
//    
//    NSString *originaldb = [[NSBundle mainBundle] pathForResource:defdbname ofType:@""];
//    dbname = [documents stringByAppendingPathComponent:relative];
//    [mdirs createdir:[NSURL fileURLWithPath:dbfolder]];
//    [mdirs copyfilefrom:originaldb to:dbname];
//    
//    [mdbcreate create];
//}

@end