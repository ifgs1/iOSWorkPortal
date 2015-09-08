//
//  UserProfileViewController.m
//  BizagiWorkPortalTest
//
//  Created by Ivan F Garcia S on 9/8/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import "UserProfileViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface UserProfileViewController ()
@property (nonatomic, strong) Connections *APIConnection;


@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.APIConnection = [[Connections alloc] init];
    [self loadUserProfile];
    
    self.title = @"Profile";
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont boldFlatFontOfSize:18],
                                                                    NSForegroundColorAttributeName: [UIColor colorFromHexCode:@"#ffffff"]};
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor colorFromHexCode:@"#e75659"]];
    
}
-(void)loadUserProfile{
    
    self.APIConnection.delegate = self;

    [self.APIConnection getUserProfile];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getUserProfileDidFinishSuccessfully:(NSDictionary*)responseObject{
    
    [self.imgUser  sd_setImageWithURL:[NSURL URLWithString:[responseObject objectForKey:@"picture"]]
                         placeholderImage:[UIImage imageNamed:@"placeholderimage.jpg"]];
    

    self.lblName.text = [NSString stringWithFormat:@"Name: %@",[responseObject objectForKey:@"name"]];
    
    self.lblLastNAme.text = [NSString stringWithFormat:@"Name: %@",[responseObject objectForKey:@"lastName"]];
    
    self.lblLastNAme.text = [NSString stringWithFormat:@"Last Name: %@",[responseObject objectForKey:@"lastName"]];
    
    self.lblAge.text = [NSString stringWithFormat:@"Age : %@",[responseObject objectForKey:@"age"]];

    self.lblGender.text = [NSString stringWithFormat:@"Gender : %@",[responseObject objectForKey:@"gender"]];



}
-(void)getUserProfileDidFinishWithFailure:(NSDictionary*)responseObject{



}

@end
