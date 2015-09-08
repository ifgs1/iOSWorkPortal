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

@end

@implementation InboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadInbox];
}
-(void)loadInbox{
    self.listInbox = [[NSMutableArray alloc]init];
    NSURL *URL = [NSURL URLWithString:@"http://private-2d854-bizagi.apiary-mock.com/ivan"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      if (error) {
                                          // Handle error...
                                          return;
                                      }
                                      
                                      if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                          NSLog(@"Response HTTP Status code: %ld\n", (long)[(NSHTTPURLResponse *)response statusCode]);
                                          NSLog(@"Response HTTP Headers:\n%@\n", [(NSHTTPURLResponse *)response allHeaderFields]);
                                      }
                                      NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                                                           options:kNilOptions
                                                                                             error:&error];
                                      
                                      for (NSDictionary * inbox in json) {
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
                                          [self.listInbox addObject:process];
                                      }
                                      [self.tableViewInbox reloadData];
                                  }];
    [task resume];

    
    
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
    
    cell.lblEmployee.text = process.employee;
    cell.lblDaysRequested.text=process.resquestDate;
    cell.lblToDates.text = process.endDate;
    
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


@end
