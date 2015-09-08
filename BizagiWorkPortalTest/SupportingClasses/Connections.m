//
//  Connections.m
//  Shopper
//
//  Created by Ivan Garcia on 3/29/15.
//

#import "Connections.h"
#import "Client.h"

@implementation Connections



-(void)getInbox{
    [[Client sharedInstance] GET:@"/ivan" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"The response to the login request is: %@", responseObject);
        
        NSLog(@"%@", operation.response.allHeaderFields);
        
            [self.delegate getInboxDidFinishSuccessfully:responseObject];
            
        
        
        
    }
failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"error report %@",error);
    
        [self.delegate getInboxDidFinishWithFailure:@{  @"operation": operation,
                                                     @"error": error}];
    
}];


}
@end