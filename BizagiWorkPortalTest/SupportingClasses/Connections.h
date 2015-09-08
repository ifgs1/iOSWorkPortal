//
//  Connections.h
//  Shopper
//
//  Created by Ivan Garcia on 3/29/15.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "Client.h"

@class Connections;


// methods from other views
@protocol ConnectionsDelegate <NSObject>

@optional
-(void)getInboxDidFinishSuccessfully:(NSDictionary*)responseObject; //  inboxViewController
-(void)getInboxDidFinishWithFailure:(NSDictionary*)responseObject; //  inboxViewController


@end



@interface Connections : NSObject<NSURLConnectionDataDelegate>{
    
    int responseStatusCode;
    
}
@property (nonatomic, strong) IBOutlet id<ConnectionsDelegate> delegate;

-(void)getInbox;


@end
