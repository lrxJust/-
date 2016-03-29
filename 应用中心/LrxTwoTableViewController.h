//
//  LrxTwoTableViewController.h
//  应用中心
//
//  Created by Apple on 16/3/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define     URLPath             @"http://api-app.meizu.com/apps/public/category/layout?v=4.6.2&firmware=Flyme+OS+4.5.4.2A&imei=869085021426904&screen_size=1080x1920&mzos=4.0&locale=CN&device_model=M5710&sn=810EBMG4J7SW&uid=26922975&language=zh-CN&net=wifi&os=22&vc=202"

@interface LrxTwoTableViewController : UITableViewController
<
    NSURLSessionDataDelegate
>
@end
