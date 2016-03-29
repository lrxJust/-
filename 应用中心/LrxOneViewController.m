//
//  LrxOneViewController.m
//  应用中心
//
//  Created by Apple on 16/3/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LrxOneViewController.h"

@interface LrxOneViewController ()

@end

@implementation LrxOneViewController
{
    CGFloat myWidth, myheight;
    UITableView *oneTV11,*oneTV12,*oneTV13,*oneTV14;
    NSArray *group1,*otherArray;
    NSMutableArray *dataArray,*group2,*group3,*group4,*group5,*lrxGroup;
    UIScrollView *justScroll;
    UIPageControl * page;
    int lrxNum;
    NSString *myStr1,*recvStr ;//(用来判断接受的数据的类型)

}
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    myWidth = self.view.frame.size.width;
    myheight = self.view.frame.size.height;
    
    dataArray = [[NSMutableArray alloc] init];
    group2 = [[NSMutableArray alloc] init];
    group3 = [[NSMutableArray alloc] init];
    group4 = [[NSMutableArray alloc] init];
    group5 = [[NSMutableArray alloc] init];
    lrxGroup = [[NSMutableArray alloc] init];
    
   
    [self makeScrollView];
    UINib *nib=[UINib nibWithNibName:@"OneTableViewCell" bundle:[NSBundle mainBundle]];
    [oneTV11 registerNib:nib forCellReuseIdentifier:@"myCell12"];
    [self  makeJson];
    
    
}


-(void)makeScrollView
{
    
    //导航视图
//    NSArray *titleArray = [NSArray arrayWithObjects:@"精选",@"排行",@"新品",@"专题", nil];
    
    float shortW = (myWidth-120)/4;
    UIView *myTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, myWidth, 64)];
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    button1.tag = 1;
    button1.frame = CGRectMake(20, 10, shortW, 40);
    [button1 setTitle:@"精选" forState:(UIControlStateNormal)];
    [button1 addTarget:self action:@selector(chooseBtnTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [myTitleView addSubview:button1];
    lab1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, shortW, 5)];
    lab1.tag = 1;
    lab1.backgroundColor = [UIColor redColor];
    [myTitleView addSubview:lab1];
 
    UIButton *button2 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(chooseBtnTap:) forControlEvents:(UIControlEventTouchUpInside)];
    button2.frame = CGRectMake(40+shortW, 10, shortW, 40);
    [button2 setTitle:@"排行" forState:(UIControlStateNormal)];
    [myTitleView addSubview:button2];
    lab2 = [[UILabel alloc] initWithFrame:CGRectMake(40+shortW, 50, shortW, 5)];
    lab2.tag = 2;
    [myTitleView addSubview:lab2];
    
    UIButton *button3 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(chooseBtnTap:) forControlEvents:(UIControlEventTouchUpInside)];
    button3.frame = CGRectMake(60+2*shortW, 10, shortW, 40);
    [button3 setTitle:@"新品" forState:(UIControlStateNormal)];
    [myTitleView addSubview:button3];
    lab3 = [[UILabel alloc] initWithFrame:CGRectMake(60+2*shortW, 50, shortW, 5)];
    lab3.tag = 1;
    [myTitleView addSubview:lab3];
    
    UIButton *button4 = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    button4.tag = 4;
    [button4 addTarget:self action:@selector(chooseBtnTap:) forControlEvents:(UIControlEventTouchUpInside)];
    button4.frame = CGRectMake(80+3*shortW, 10, shortW, 40);
    [button4 setTitle:@"专题" forState:(UIControlStateNormal)];
    [myTitleView addSubview:button4];
    lab4 = [[UILabel alloc] initWithFrame:CGRectMake(80+3*shortW, 50, shortW, 5)];
    lab4.tag = 4;
    [myTitleView addSubview:lab4];
    
    self.navigationItem.titleView = myTitleView;
    //
    scroll = [[UIScrollView alloc] init];
    scroll.frame = self.view.bounds;
    scroll.delegate = self;
    
    oneTV11 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myheight) style:(UITableViewStyleGrouped)];
    oneTV11.backgroundColor = [UIColor orangeColor];
    oneTV11.delegate = self;
    oneTV11.dataSource = self;
    oneTV11.tag = 11;
    
    oneTV12 = [[UITableView alloc] init];
    oneTV12.frame = CGRectMake(myWidth, 0, myWidth, myheight);
    oneTV12.tag = 12;
    oneTV12.backgroundColor = [UIColor yellowColor];
    oneTV13 = [[UITableView alloc] init];
    oneTV13.frame = CGRectMake(2*myWidth, 0, myWidth, myheight);
    oneTV13.tag = 13;
    oneTV14 = [[UITableView alloc] init];
    oneTV14.frame = CGRectMake(3*myWidth, 0, myWidth, myheight);
    oneTV14.tag = 14;
    oneTV14.backgroundColor = [UIColor yellowColor];
    //
    [scroll addSubview:oneTV11];
    [scroll addSubview:oneTV12];
    [scroll addSubview:oneTV13];
    [scroll addSubview:oneTV14];
    scroll.pagingEnabled=YES;
    [self.view addSubview:scroll];
    scroll.showsHorizontalScrollIndicator=NO;
    scroll.bounces=NO;
    scroll.contentOffset=CGPointMake(1, 0);
    scroll.contentSize=CGSizeMake(4*myWidth, myheight);
    
}
-(void)makeJson
{
    NSURL *url = [NSURL URLWithString:Public];
    
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionTask *task = [mySession dataTaskWithURL:url];
    task.taskDescription = @"ijustto";
    [task resume];
    
}
//＝＝＝＝＝＝＝＝


-(void)makeLoadOtherDate
{
    lrxNum =lrxNum+5;
    NSLog(@"=======lrxNum=%i",lrxNum);
    NSString *str = [NSString stringWithFormat:@"http://api-app.meizu.com/apps/public/feed/layout?start=%i&firmware=Flyme+OS+4.5.4.2A&mzos=4.0&locale=CN&sn=810EBMG4J7SW&net=wifi&os=22&vc=202&v=4.6.2&max=5&imei=869085021426904&screen_size=1080x1920&device_model=M5710&uid=26922975&language=zh-CN",lrxNum];
//    NSLog(@"========str:%@",str);
    
    NSURL *myUrl = [NSURL URLWithString:str];
    
#if 0
    NSURLSession *mySession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionTask *task = [mySession dataTaskWithURL:myUrl];
    [task resume];
    
#else
    NSURLSession *session1 = [NSURLSession sharedSession];
    NSURLSessionTask *otherTask = [session1 dataTaskWithURL:myUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"＝＝＝请求数据失败");
            
        }
        
        NSDictionary *myOtherDict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        
        NSDictionary *otherDict1 = [myOtherDict objectForKey:@"value"];
        otherArray = [otherDict1 objectForKey:@"blocks"];
       
        NSDictionary *otherDict2;
       
        
        for (int i = 0; i < otherArray.count; i++) {
            otherDict2 = otherArray[i];
            recvStr = [otherDict2 objectForKey:@"type"];
            if ([recvStr isEqualToString:@"advertise"])
            {
                [self addOther:otherDict2 andNumber:i];
            }
            else
            {
                [self makeOneAPP:otherDict2 andNumber:i];
            }
        }
        
        [oneTV11 reloadData];
    }];
    [otherTask resume];
#endif //
    
    
}
#pragma mark -- ScrollViewDelegate
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 11){
        
        if (scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height)+50) {
            //  我在这里
            [self makeLoadOtherDate];
        }
    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
   
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger  index;
    if (scrollView.tag == 10000) {
        
        page.currentPage = scrollView.contentOffset.x/self.view.frame.size.width;
        
    }
    else{
        
        index=scrollView.contentOffset.x/self.view.frame.size.width;
        switch (index) {
            case 0:
                lab1.backgroundColor = [UIColor redColor];
                lab2.backgroundColor = nil;
                lab3.backgroundColor = nil;
                lab4.backgroundColor = nil;
                break;
            case 1:
                lab2.backgroundColor = [UIColor redColor];
                lab1.backgroundColor = nil;
                lab3.backgroundColor = nil;
                lab4.backgroundColor = nil;
                break;
            case 2:
                lab3.backgroundColor = [UIColor redColor];
                lab2.backgroundColor = nil;
                lab1.backgroundColor = nil;
                lab4.backgroundColor = nil;
                break;
            case 3:
                lab4.backgroundColor = [UIColor redColor];
                lab2.backgroundColor = nil;
                lab3.backgroundColor = nil;
                lab1.backgroundColor = nil;
                break;
            default:
                break;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)chooseBtnTap:(UIButton *)sender{
    if (sender.tag == 1 ) {
        lab1.backgroundColor = [UIColor redColor];
        lab4.backgroundColor = nil;
        lab3.backgroundColor = nil;
        lab2.backgroundColor = nil;
        scroll.contentOffset=CGPointMake(1, 0);
    }
  
    if (sender.tag == 2) {
        lab2.backgroundColor = [UIColor redColor];
        lab1.backgroundColor = nil;
        lab3.backgroundColor = nil;
        lab4.backgroundColor = nil;
        scroll.contentOffset=CGPointMake(myWidth +1, 0);
    }
    if (sender.tag == 3) {
        lab3.backgroundColor = [UIColor redColor];
        lab1.backgroundColor = nil;
        lab4.backgroundColor = nil;
        lab2.backgroundColor = nil;
        scroll.contentOffset=CGPointMake(2*myWidth +1, 0);
    }
    
    if (sender.tag == 4) {
        lab4.backgroundColor = [UIColor redColor];
        lab1.backgroundColor = nil;
        lab3.backgroundColor = nil;
        lab2.backgroundColor = nil;
        scroll.contentOffset=CGPointMake(3*myWidth +1, 0);
    }
    
}

#pragma mark --tableView delegate
// 分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"=============有多少分区 :%li",dataArray.count);
    return dataArray.count;

}
//每个分区有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    NSArray *new = [dataArray objectAtIndex:section];
   
    if (section == 0) {
        NSLog(@"=====我是1分组里的");
        return 1;
        
    }
    
    else if (new.count == 2)
    {
        return 1;
    }
    else{
        NSLog(@"=============有多少行:%li",new.count);
        return new.count;//[dataArray[section] count];
    }
}
// 单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *new = [dataArray objectAtIndex:indexPath.section];
    if (indexPath.section == 0) {
        UITableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell1"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"myCell1"];
        }
        
        justScroll = [self cell_Section1];
        justScroll.tag = 10000;
      /*  //点击事件
       UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapJustScroll:)];
        [justScroll addGestureRecognizer:myTap];*/
        
        justScroll.delegate = self;
        [cell.contentView  addSubview:justScroll];
        return cell;
    }
    else if(new.count == 2)
    {
        UITableViewCell *cell;
        cell = [tableView dequeueReusableCellWithIdentifier:@"myCell3"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"myCell3"];
        }
        NSArray *arr = [dataArray objectAtIndex:indexPath.section];
        UIImageView *picture;
        LrxOneImg *oneIg;
        NSString *str;
        NSData *data;
        NSURL *url;
        for (int i = 0; i < arr.count; i++)
        {
            oneIg = [arr objectAtIndex:i];
            picture = [[UIImageView alloc] initWithFrame:CGRectMake(i*myWidth/2, 0, myWidth/2, 80)];
            str = oneIg.img_url;
            url = [NSURL URLWithString:str];
            data = [NSData dataWithContentsOfURL:url];
            if ([str hasSuffix:@"webp"]) {
                picture.image = [UIImage imageWithWebPData:data];
            }
            else{
                picture.image = [UIImage imageWithData:data];
            }
            [cell.contentView addSubview:picture];
        }
        
        return cell;
        
    }

    else {

        OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell12"];
    
       
//        NSLog(@"===section=%li",indexPath.section);
        NSArray *arr = [dataArray objectAtIndex:indexPath.section];
//        NSLog(@"=========arr=%@",arr);
        LrxOneApp *one = [arr objectAtIndex:indexPath.row];
//        NSLog(@"====oneApp.name=%@",_oneApp.name);
        cell.mainLab1.text = one.name;
        cell.detailLab2.text = one.category_name;
        cell.countLab3.text = [NSString stringWithFormat:@"%li",one.evaluate_count];
        NSURL *url = [NSURL URLWithString:one.icon];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        if ([one.icon hasSuffix:@"webp"]) {
            cell.mypicture.image = [UIImage imageWithWebPData:data];
        }
        else
        {
            cell.mypicture.image = [UIImage imageWithData:data];
        }

        return cell;
    }
}

// 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSArray *new = [dataArray objectAtIndex:indexPath.section];
    if (indexPath.section==0) {
        return 200;
    }
    if(new.count == 2)
    {
        return 80;
    }
    return 80.0;
    
}
// 每分区的尾高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSLog(@"===========just");
    if (section == dataArray.count-1) {
        return 45;
    }
    else
    return 0.01;
}
//
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == dataArray.count-1) {
        LRXFootViewController *footVC = [[LRXFootViewController alloc] initWithNibName:@"LRXFootViewController"bundle:nil];
        
        return footVC.view;
    }
    else
        return nil;
}
//头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}
// 每分区的头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    NSArray *new = [dataArray objectAtIndex:section];
    if (section == 0) {
        return 65;
    }
   else if (new.count == 2) {
        return 0.01;
    }
    else
        return 0.01;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    DetailOneAPPViewController *oneAPP = [[DetailOneAPPViewController alloc] init];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddDetailTableViewController *oneAPP = [story instantiateViewControllerWithIdentifier:@"MRlin"];
    NSArray *new = [dataArray objectAtIndex:indexPath.section];
    oneAPP.oneApp = [new objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:oneAPP animated:YES];
}

#pragma mark --PagekaddTag  and UITapGestureRecognizer
//精选里面的轮播
-(void)pageChange:(id)sender
{
    justScroll.contentOffset = CGPointMake(page.currentPage*myWidth, 0);
}

#pragma mark --NSURLSession delegate
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    //允许响应
    completionHandler(NSURLSessionResponseAllow);
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
   
//    NSLog(@"＝＝＝＝＝＝dataTask.taskInde＝%lu", (unsigned long)dataTask.taskIdentifier);
    NSLog(@"==========de:%@",dataTask.taskDescription);
    if (![dataTask.taskDescription isEqualToString:@"ijustto"]) {
        NSLog(@"=======不是我！");
        return;
    }
    NSDictionary *oldDict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
    //整理数据
    NSDictionary *myDict = [oldDict objectForKey:@"value"];
    NSArray *allArray = [myDict objectForKey:@"blocks"];

    for (int i = 0; i < allArray.count; i++)
    {
        NSDictionary *passDict = allArray[i];

        myStr1 = [passDict objectForKey:@"type"];
        if ([myStr1 isEqualToString:@"banner"]) {
            group1 = [passDict objectForKey:@"data"];
            [dataArray addObject:group1];
        }
        else if([myStr1 isEqualToString:@"advertise"])
        {
             [self addOther:passDict andNumber:i];
        }
        else
        {
            [self makeOneAPP:passDict andNumber:i];
        }

    }
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if(error)
    {
        NSLog(@"错误:%@",error.localizedDescription);
    }
    else
    {
        NSLog(@"加载完成...");
//        NSLog(@"====zong dataarray==%@====",dataArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            [oneTV11 reloadData];
        });
        
    }
}
#pragma mark --cell_Section1
-(UIScrollView *)cell_Section1
{
    UIImageView *imageView;
    UIScrollView *myScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,myWidth, 200)];
    myScroll.backgroundColor = [UIColor grayColor];
//    NSLog(@"====%li",group1.count);
    NSString *url;
    NSDictionary *myOne;
    for (int i = 0; i < group1.count; i++) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*myWidth, 0, myWidth, 200)];
        myOne = group1 [i];
        
        url = [myOne objectForKey:@"img_url"];
//        NSLog(@"====lianjie:%@",url);
        if ([url hasSuffix:@"webp"]) {
            imageView.image = [UIImage imageWithWebPData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
        }
        else
        {
            imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
        }
        
        [myScroll addSubview:imageView];
    }
    
    page = [[UIPageControl alloc] initWithFrame:CGRectMake((myWidth-100)/2, 160, 100, 30)];
    page.numberOfPages = group1.count;
    page.currentPage = 0;
    [page addTarget:self action:@selector(pageChange:) forControlEvents:(UIControlEventValueChanged)];
    [oneTV11 addSubview:page];
    
    myScroll.contentSize = CGSizeMake(myWidth * group1.count, 200);
    myScroll.pagingEnabled = YES;
    myScroll.bounces = NO;
    myScroll.showsHorizontalScrollIndicator = NO;
    return myScroll;

}

#pragma mark --OneImg and OneAPP
-(void)addOther:(NSDictionary *)sender andNumber:(int)num
{

    NSArray *pass1 = [sender objectForKey:@"data"];
    if (pass1.count == 0) {
        NSLog(@"＝＝＝＝＝＝＝返回Img");
        return;
    }
    NSDictionary *obj;
    for (int i = 0; i < pass1.count; i++)
    {
        obj = pass1[i];
        _oneImg = [[LrxOneImg alloc] init];
        _oneImg.img_url = [obj objectForKey:@"img_url"];
        _oneImg.name = [obj objectForKey:@"name"];
        _oneImg.package_name = [obj objectForKey:@"package_name"];
        _oneImg.url = [obj objectForKey:@"url"];
        _oneImg.type = [obj objectForKey:@"type"];
        _oneImg.aid = [[obj objectForKey:@"aid"] integerValue];
        _oneImg.content_id = [[obj objectForKey:@"content_id"] integerValue];
        _oneImg.img_height = [[obj objectForKey:@"img_height"] integerValue];
        _oneImg.img_size = [[obj objectForKey:@"img_size"] integerValue];
        _oneImg.img_width = [[obj objectForKey:@"img_width"] integerValue];
        _oneImg.page_id = [[obj objectForKey:@"page_id"] integerValue];

        [lrxGroup addObject:_oneImg];

    }
    
    NSArray *test1 = [lrxGroup copy];
    [lrxGroup removeAllObjects];
    [dataArray addObject:test1];
   
}

-(void)makeOneAPP:(NSDictionary *)sender andNumber:(int)num
{
    NSArray *pass1 = [sender objectForKey:@"data"];
    if (pass1.count == 0) {
    
        return;
    }
    NSDictionary *obj;
    for (int i = 0; i < pass1.count; i++)
    {
        obj = pass1[i];
//        NSLog(@"======字典obj：%@",obj);
        _oneApp = [[LrxOneApp alloc] init];
        _oneApp.category_name = [obj objectForKey:@"category_name"];
        _oneApp.custom_icon = [obj objectForKey:@"custom_icon"];
        _oneApp.icon = [obj objectForKey:@"icon"];
        _oneApp.name = [obj objectForKey:@"name"];
        _oneApp.recommend_desc = [obj objectForKey:@"recommend_desc"];
        _oneApp.url = [obj objectForKey:@"url"];
        _oneApp.publisher = [obj objectForKey:@"publisher"];
        
        _oneApp.download7day_count = [[obj objectForKey:@"download7day_count"] integerValue];
        _oneApp.download_count = [[obj objectForKey:@"download_count"] integerValue];
        _oneApp.evaluate_count = [[obj objectForKey:@"evaluate_count"] integerValue];
        _oneApp.uid = [[obj objectForKey:@"id"] integerValue];
        _oneApp.star = [[obj objectForKey:@"star"] integerValue];
        _oneApp.version_code = [[obj objectForKey:@"version_code"] integerValue];
        _oneApp.price = [[obj objectForKey:@"price"] floatValue];
        _oneApp.version_name = [[obj objectForKey:@"version_name"] floatValue];
        _oneApp.size = [[obj objectForKey:@"size"] doubleValue];
        _oneApp.tags = [obj objectForKey:@"tags"];
        [lrxGroup addObject:_oneApp];
    }
    NSArray *test2 = [lrxGroup copy];
    [lrxGroup removeAllObjects];
    [dataArray addObject:test2];
    
}
@end
