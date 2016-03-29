//
//  LrxOneApp.h
//  应用中心
//
//  Created by Apple on 16/3/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LrxOneApp : NSObject

@property (strong,nonatomic) NSString *category_name,*custom_icon,*icon,*name,*package_name,*recommend_desc,*url,*publisher;
@property (assign,nonatomic) NSInteger download7day_count,download_count,evaluate_count,uid,star,version_code;
@property (assign,nonatomic) float price,version_name;
@property (assign,nonatomic) double size;
@property (strong,nonatomic) NSDictionary *tags;


@end

/*
 "category_name":"生活助理",
 "custom_icon":"http://app.res.meizu.com/fileserver/app_custom_icon/2/7c047cf603d94780a22460fe4bb14778.png",
 "download7day_count":1210196,
 "download_count":25022451,
 "evaluate_count":35172,
 "icon":"http://i1.res.meizu.com/fileserver/app_icon/webp/283/a414b85c20f54d868d80dd01df8aa906.webp",
 "id":475191,
 "name":"百度糯米-美食电影",
 "package_name":"com.nuomi",
 "price":0,
 "publisher":"北京百度网讯科技有限公司",
 "recommend_desc":"宠爱升级，10万份免单3.7送女生",
 "size":14965067,
 "star":49,
 "tags":{
 "hasgift":false,
 "icon":"",
 "names":[
 
 ]
 },
 "url":"/apps/public/detail/475191",
 "version_code":165,
 "version_name":"6.4.0"
 },
}*/

/*
 {
 "aid":214,
 "content_id":120010,
 "img_height":336,
 "img_size":2,
 "img_url":"http://i2.res.meizu.com/fileserver/ad/img/webp/37/1e4a4456830d4893a6d3898797858a4f.webp",
 "img_width":764,
 "name":"手机淘宝",
 "package_name":"com.taobao.taobao",
 "page_id":1000,
 "tag":"",
 "tag_color":"",
 "type":"app",
 "url":"/apps/public/detail/120010"
 },
 */