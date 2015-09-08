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
@interface InboxViewController ()
@property (nonatomic, strong) Connections *APIConnection;

@end

@implementation InboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.APIConnection = [[Connections alloc] init];

    [self loadInbox];
}
-(void)loadInbox{
    self.APIConnection.delegate = self;
    self.listInbox = [[NSMutableArray alloc]init];
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

    Process * process = [self.listInbox objectAtIndex:indexPath.row];
    
    cell.lblEmployee.text = [NSString stringWithFormat:@"Employee: %@",process.employee];
    cell.lblDaysRequested.text=process.resquestDate;
    cell.lblToDates.text = [NSString stringWithFormat:@"Number of Days: %@",process.days];
    
    [cell.imgEmployee  sd_setImageWithURL:[NSURL URLWithString:process.image]
                        placeholderImage:[UIImage imageNamed:@"placeholderimage.jpg"]];
    
    
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
        [self.listInbox addObject:process];
    }
    [self.tableViewInbox reloadData];
}
-(void)getInboxDidFinishWithFailure:(NSDictionary*)responseObject{


}

@end
