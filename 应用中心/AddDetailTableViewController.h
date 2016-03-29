//
//  AddDetailTableViewController.h
//  应用中心
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LrxOneApp.h"

#define     MYPAth    @"http://api-app.meizu.com/apps/public/detail/%li?v=4.6.2&firmware=Flyme+OS+4.5.4.2A&imei=869085021426904&screen_size=1080x1920&mzos=4.0&locale=CN&device_model=M5710&sn=810EBMG4J7SW&uid=26922975&language=zh-CN&net=wifi&os=22&vc=202"

@interface AddDetailTableViewController : UITableViewController
<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imagView2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIScrollView *myScroll;
- (IBAction)btnTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView1;
@property (weak, nonatomic) IBOutlet UITableView *tableView2;
@property (weak, nonatomic) IBOutlet UITableView *tableView3;

@property (strong,nonatomic) LrxOneApp *oneApp;
-(void)makeJson;
@end
