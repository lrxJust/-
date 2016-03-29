//
//  DetailOneAPPViewController.h
//  应用中心
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LrxOneApp.h"
#import "AddDetailTableViewController.h"


@interface DetailOneAPPViewController : UIViewController



@property (strong,nonatomic) LrxOneApp *oneApp;

- (IBAction)tapBtn:(id)sender;
- (IBAction)tapOtherBtn:(id)sender;

@end
