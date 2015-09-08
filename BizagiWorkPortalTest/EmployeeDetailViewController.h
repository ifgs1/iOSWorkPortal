//
//  EmployeeDetailViewController.h
//  BizagiWorkPortalTest
//
//  Created by Ivan F Garcia S on 9/8/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Process.h"
#import "BButton.h"

@interface EmployeeDetailViewController : UIViewController

@property (strong, nonatomic)Process *selectedProcess;

-(void)setProcess:(Process *)process;

@property (weak, nonatomic) IBOutlet UIImageView *imgEmployee;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UILabel *lblrequestDate;
@property (weak, nonatomic) IBOutlet UILabel *lblEndDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDaysRequested;
@property (weak, nonatomic) IBOutlet BButton *btnAccept;
@property (weak, nonatomic) IBOutlet BButton *btnReject;


@end
