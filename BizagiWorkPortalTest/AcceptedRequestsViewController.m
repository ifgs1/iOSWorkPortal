//
//  AcceptedRequestsViewController.m
//  BizagiWorkPortalTest
//
//  Created by Ivan F Garcia S on 9/8/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import "AcceptedRequestsViewController.h"
#import "Process.h"
#import "InboxCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface AcceptedRequestsViewController ()
@property (nonatomic, strong) Connections *APIConnection;

@end

@implementation AcceptedRequestsViewController{
    M13BadgeView *badgeView2;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Accepted Requests";
    self.APIConnection = [[Connections alloc] init];

    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont boldFlatFontOfSize:18],
                                                                    NSForegroundColorAttributeName: [UIColor colorFromHexCode:@"#ffffff"]};
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor colorFromHexCode:@"#e75659"]];
    
    [self loadAcceptedRequests];
}
-(void)loadAcceptedRequests{
    self.APIConnection.delegate = self;
    self.listAccepted = [[NSMutableArray alloc]init];
    [self.APIConnection getApprovedUsers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getApprovedDidFinishSuccessfully:(NSDictionary*)responseObject{
    NSLog(@"response %@",responseObject);
    for (NSDictionary * inbox in responseObject) {
        if ([[inbox objectForKey:@"status"] isEqualToString:@"approved"]) {
            
        Process * process = [[Process alloc]init];
        process.employee = [inbox objectForKey:@"employee"];
        process.endDate = [inbox objectForKey:@"endDate"];
        process.image = [inbox objectForKey:@"image"];
        process.beginDate = [inbox objectForKey:@"beginDate"];
        process.process = [inbox objectForKey:@"status"];
        process.processId = [inbox objectForKey:@"processId"];
        process.days = [inbox objectForKey:@"daysApproved"];
        process.resquestDate = [inbox objectForKey:@"requestDate"];
        [self.listAccepted addObject:process];
       }
    }
    [self.tableviewAcceptedRequests reloadData];
}
-(void)getApprovedDidFinishWithFailure:(NSDictionary*)responseObject{



}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark - TableView Datasource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listAccepted.count;
    
}
#pragma mark - TableView Delegate Methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"InboxCell";
    InboxCell *cell = (InboxCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"InboxCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    Process * process = [self.listAccepted objectAtIndex:indexPath.row];
    
    cell.lblEmployee.text = [NSString stringWithFormat:@"Employee: %@",process.employee];
    cell.lblToDates.text = [NSString stringWithFormat:@"Number of Days: %@",process.days];
    
    [cell.imgEmployee  sd_setImageWithURL:[NSURL URLWithString:process.image]
                         placeholderImage:[UIImage imageNamed:@"placeholderimage.jpg"]];
    
    cell.imgEmployee.layer.backgroundColor=[[UIColor clearColor] CGColor];
    cell.imgEmployee.layer.cornerRadius=10;
    cell.imgEmployee.layer.borderWidth=1.0;
    cell.imgEmployee.layer.masksToBounds = YES;
    cell.imgEmployee.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    NSString * stringBadge = [NSString stringWithFormat:@"%@",process.days];

    badgeView2 = [[M13BadgeView alloc] initWithFrame:CGRectMake(200, 0, 20.0, 20.0)];
    badgeView2.shadowBorder = NO;
    badgeView2.borderColor = [UIColor whiteColor];
    badgeView2.badgeBackgroundColor=[UIColor redColor];
    badgeView2.borderWidth = 1.0;
    badgeView2.text = stringBadge;
    badgeView2.verticalAlignment = M13BadgeViewVerticalAlignmentMiddle;
    badgeView2.horizontalAlignment = M13BadgeViewHorizontalAlignmentRight;
    [badgeView2 setHidesWhenZero:YES];
    [cell addSubview:badgeView2];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
