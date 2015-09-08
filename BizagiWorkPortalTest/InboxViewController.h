//
//  InboxViewController.h
//  BizagiWorkPortalTest
//
//  Created by Ivan Garcia on 9/2/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connections.h"
//FlatUI
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "UINavigationBar+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "FUIButton.h"
#import "SVProgressHUD.h"
@interface InboxViewController : UIViewController<ConnectionsDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableViewInbox;
@property (strong, nonatomic)  NSMutableArray *listInbox;


@end
