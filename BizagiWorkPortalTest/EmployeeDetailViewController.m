//
//  EmployeeDetailViewController.m
//  BizagiWorkPortalTest
//
//  Created by Ivan F Garcia S on 9/8/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import "EmployeeDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface EmployeeDetailViewController ()

@end

@implementation EmployeeDetailViewController
-(void)setProcess:(Process *)process
{
    if (_selectedProcess != process) {
        _selectedProcess = process;
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.selectedProcess) {
        
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.btnAccept setStyle:BButtonStyleBootstrapV3];
    [self.btnAccept setType:BButtonTypeSuccess];
    
    
    [self.btnReject setStyle:BButtonStyleBootstrapV3];
    [self.btnReject setType:BButtonTypeDanger];
    [self loadUserData];
    
    self.title = @"Employee";
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont boldFlatFontOfSize:18],
                                                                    NSForegroundColorAttributeName: [UIColor colorFromHexCode:@"#ffffff"]};
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor colorFromHexCode:@"#e75659"]];
}
-(void)loadUserData{

    
    [self.imgEmployee  sd_setImageWithURL:[NSURL URLWithString:self.selectedProcess.image]
                     placeholderImage:[UIImage imageNamed:@"placeholderimage.jpg"]];
    self.lblName.text = [NSString stringWithFormat:@"Employee: %@",self.selectedProcess.employee];
    self.lblDaysRequested.text = [NSString stringWithFormat:@"Days requested %@",self.selectedProcess.days];
    self.lblEndDate.text = [NSString stringWithFormat:@"End Date: %@",self.selectedProcess.endDate];
    
    self.lblrequestDate.text = [NSString stringWithFormat:@"Requested Date %@",self.selectedProcess.resquestDate];

    
    self.imgEmployee.layer.backgroundColor=[[UIColor clearColor] CGColor];
    self.imgEmployee.layer.cornerRadius=10;
    self.imgEmployee.layer.borderWidth=1.0;
    self.imgEmployee.layer.masksToBounds = YES;
    self.imgEmployee.layer.borderColor=[[UIColor lightGrayColor] CGColor];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
