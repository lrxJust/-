//
//  LrxOneImg.h
//  应用中心
//
//  Created by Apple on 16/3/18.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LrxOneImg : NSObject
@property (strong,nonatomic) NSString *img_url,*name,*package_name,*url,*type;
@property (assign,nonatomic) NSInteger aid,content_id,img_height,img_size,
img_width,page_id;
/*
 {
 "aid":5617,
 "content_id":3001870,
 "img_height":336,
 "img_size":2,
 "img_url":"http://i3.res.meizu.com/fileserver/ad/img/webp/34/144d696b3abd4275a9202830feb67aab.webp",
 "img_width":764,
 "name":"有道e读",
 "package_name":"com.youdao.sw",
 "page_id":1000,
 "tag":"",
 "tag_color":"",
 "type":"app",
 "url":"/apps/public/detail/3001870"
 },
 */

/*
 -(void)tapJustScroll:(UITapGestureRecognizer *)sender
 {
 CGPoint curPoint =[sender locationInView:justScroll];
 if (CGRectContainsPoint(justScroll.bounds, curPoint))
 {
 switch (page.currentPage) {
 case 0:
 NSLog(@"我是第一页");
 break;
 case 1:
 NSLog(@"我是第二页");
 break;
 case 2:
 NSLog(@"我是第三页");
 break;
 case 3:
 NSLog(@"我是第四页");
 break;
 case 4:
 NSLog(@"我是第五页");
 break;
 case 5:
 NSLog(@"我是第六页");
 break;
 default:
 break;
 }
 
 }
 
 }*///点击事件
@end
