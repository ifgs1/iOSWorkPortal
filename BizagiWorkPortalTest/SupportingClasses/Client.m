//
//  Client.m
//  Shopper
//
//  Created by Ivan Garcia on 3/29/15.
//

#import "Client.h"
@implementation Client
+ (id)sharedInstance{
    static Client *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
                _sharedInstance = [[Client alloc] initWithBaseURL:[NSURL URLWithString:@"http://private-2d854-bizagi.apiary-mock.com"]];
    });
    return _sharedInstance;
}
- (id)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    
    
    if (self) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
    }
    
    return self;
}


@end
