//
//  InboxCell.h
//  BizagiWorkPortalTest
//
//  Created by Ivan Garcia on 9/2/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InboxCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblEmployee;
@property (strong, nonatomic) IBOutlet UILabel *lblDaysRequested;
@property (strong, nonatomic) IBOutlet UILabel *lblToDates;
@property (strong, nonatomic) IBOutlet UIImageView *imgEmployee;

@end
