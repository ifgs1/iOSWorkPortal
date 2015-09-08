//
//  Client.h
//  Shopper
//
//  Created by Ivan Garcia on 3/29/15.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

@interface Client :AFHTTPSessionManager

 
+ (id)sharedInstance;
- (instancetype)initWithBaseURL:(NSURL *)url;

@end
