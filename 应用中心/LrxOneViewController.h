//
//  LrxOneViewController.h
//  应用中心
//
//  Created by Apple on 16/3/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+WebP.h"
#import "DetailOneAPPViewController.h"
#import "AddDetailTableViewController.h"
#import "LRXFootViewController.h"
#import "OneTableViewCell.h"
#import "LrxOneApp.h"
#import "LrxOneImg.h"
#define     Public    @"http://api-app.meizu.com/apps/public/index?start=0&firmware=Flyme+OS+4.5.4.2A&mzos=4.0&locale=CN&sn=810EBMG4J7SW&net=wifi&os=22&vc=202&v=4.6.2&max=10&imei=869085021426904&screen_size=1080x1920&device_model=M5710&uid=26922975&language=zh-CN"


@interface LrxOneViewController : UIViewController
<
    UIScrollViewDelegate,
    NSURLSessionDelegate,
    UITableViewDelegate,
    UITableViewDataSource
>
{
    UIScrollView *scroll;
    UILabel *lab1,*lab2,*lab3,*lab4;

}
@property (strong,nonatomic) LrxOneApp *oneApp;
@property (strong,nonatomic) LrxOneImg *oneImg;

- (void)chooseBtnTap:(UIButton *)sender;
-(void)makeScrollView;
-(void)makeJson;
-(void)makeOneAPP:(NSDictionary *)sender andNumber:(int)num;
-(void)addOther:(NSDictionary *)sender andNumber:(int)num;
-(void)makeLoadOtherDate;
-(UIScrollView *)cell_Section1;



@end
