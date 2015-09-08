//
//  ViewController.h
//  BizagiWorkPortalTest
//
//  Created by Ivan Garcia on 9/2/15.
//  Copyright (c) 2015 IvanGarcia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BButton.h"
@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet BButton *btnStart;
- (IBAction)start:(id)sender;

@end

