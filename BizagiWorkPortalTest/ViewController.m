//
//  ViewController.m
//  BizagiWorkPortalTest
//
//  Created by Ivan Garcia on 9/2/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import "ViewController.h"
#import "BButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.btnStart setStyle:BButtonStyleBootstrapV3];
    [self.btnStart setType:BButtonTypeGray];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
}
@end
