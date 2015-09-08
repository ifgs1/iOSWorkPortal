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
        NSLog(@"The response to the inbox request is: %@", responseObject);
        
        
            [self.delegate getInboxDidFinishSuccessfully:responseObject];
            
        
        
        
    }
failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"error report %@",error);
    
        [self.delegate getInboxDidFinishWithFailure:@{  @"operation": operation,
                                                     @"error": error}];
    
}];


}
-(void)getUserProfile{
    [[Client sharedInstance] GET:@"/ivan2" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"The response to the userdata request is: %@", responseObject);
        
        [self.delegate getUserProfileDidFinishSuccessfully:responseObject];
        
    }
                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                             NSLog(@"error report %@",error);
                             
                             [self.delegate getUserProfileDidFinishWithFailure:@{  @"operation": operation,
                                                                             @"error": error}];
                             
                         }];

}
-(void)getApprovedUsers{

    [[Client sharedInstance] GET:@"/ivan3" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"The response to the approved request is: %@", responseObject);
        
        [self.delegate getApprovedDidFinishSuccessfully:responseObject];
        
        
        
    }
                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                             NSLog(@"error report %@",error);
                             
                             [self.delegate getApprovedDidFinishWithFailure:@{  @"operation": operation,
                                                                             @"error": error}];
                             
                         }];
}
@end