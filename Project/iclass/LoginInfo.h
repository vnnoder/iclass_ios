

#import <Foundation/Foundation.h>
#import "User.h"    

@interface LoginInfo : NSObject

@property (strong) User *user;
@property (strong) NSString *token;
@property (strong) NSString *error;
@property BOOL success;

@end
