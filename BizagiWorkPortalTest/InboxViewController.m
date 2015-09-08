//
//  InboxViewController.m
//  BizagiWorkPortalTest
//
//  Created by Ivan Garcia on 9/2/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import "InboxViewController.h"
#import "Process.h"
#import "InboxCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "EmployeeDetailViewController.h"
@interface InboxViewController ()
@property (nonatomic, strong) Connections *APIConnection;

@end

@implementation InboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.APIConnection = [[Connections alloc] init];

    [self loadInbox];
    
    self.title = @"Inbox";
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont boldFlatFontOfSize:18],
                                                                    NSForegroundColorAttributeName: [UIColor colorFromHexCode:@"#ffffff"]};
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor colorFromHexCode:@"#e75659"]];

    
    self.edgesForExtendedLayout=UIRectEdgeNone;
}
-(void)loadInbox{
    self.APIConnection.delegate = self;
    self.listInbox = [[NSMutableArray alloc]init];
    [SVProgressHUD show];
    [self.APIConnection getInbox];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark - TableView Datasource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listInbox.count;
    
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
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    Process * process = [self.listInbox objectAtIndex:indexPath.row];
    
    cell.lblEmployee.text = [NSString stringWithFormat:@"Employee: %@",process.employee];
    cell.lblDaysRequested.text=[NSString stringWithFormat:@"Date: %@",process.resquestDate];
    cell.lblToDates.text = [NSString stringWithFormat:@"Number of Days: %@",process.days];
    
    [cell.imgEmployee  sd_setImageWithURL:[NSURL URLWithString:process.image]
                        placeholderImage:[UIImage imageNamed:@"placeholderimage.jpg"]];
    
    cell.imgEmployee.layer.backgroundColor=[[UIColor clearColor] CGColor];
    cell.imgEmployee.layer.cornerRadius=10;
    cell.imgEmployee.layer.borderWidth=1.0;
    cell.imgEmployee.layer.masksToBounds = YES;
    cell.imgEmployee.layer.borderColor=[[UIColor lightGrayColor] CGColor];
    
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Process * process = [self.listInbox objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"detail" sender:process];
}
-(void)getInboxDidFinishSuccessfully:(NSDictionary*)responseObject{
    
    for (NSDictionary * inbox in responseObject) {
        Process * process = [[Process alloc]init];
        process.activity = [inbox objectForKey:@"activity"];
        process.activityId = [inbox objectForKey:@"activityId"];
        process.beginDate = [inbox objectForKey:@"beginDate"];
        process.employee = [inbox objectForKey:@"employee"];
        process.endDate = [inbox objectForKey:@"endDate"];
        process.image = [inbox objectForKey:@"image"];
        process.lastVacationOn = [inbox objectForKey:@"lastVacationOn"];
        process.process = [inbox objectForKey:@"process"];
        process.processId = [inbox objectForKey:@"processId"];
        process.days = [inbox objectForKey:@"vacationDays"];
        process.resquestDate = [inbox objectForKey:@"requestDate"];
        [self.listInbox addObject:process];
    }
    [SVProgressHUD dismiss];

    [self.tableViewInbox reloadData];
}
-(void)getInboxDidFinishWithFailure:(NSDictionary*)responseObject{
    [SVProgressHUD dismiss];


}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString:@"detail"])
    {
        EmployeeDetailViewController *controller = segue.destinationViewController;
        [controller setProcess:sender];
        
    }
}

@end
