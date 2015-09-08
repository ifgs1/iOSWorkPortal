//
//  InboxViewController.h
//  BizagiWorkPortalTest
//
//  Created by Ivan Garcia on 9/2/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InboxViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableViewInbox;
@property (strong, nonatomic)  NSMutableArray *listInbox;


@end
