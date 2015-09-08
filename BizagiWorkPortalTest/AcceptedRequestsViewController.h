//
//  AcceptedRequestsViewController.h
//  BizagiWorkPortalTest
//
//  Created by Ivan F Garcia S on 9/8/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import <UIKit/UIKit.h>
//FlatUI
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "UINavigationBar+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "FUIButton.h"
#import "Connections.h"
#import "M13BadgeView.h"
@interface AcceptedRequestsViewController : UIViewController<ConnectionsDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableviewAcceptedRequests;
@property (strong, nonatomic)  NSMutableArray *listAccepted;

@property (nonatomic, retain) M13BadgeView *badgeViewCell;

@end
