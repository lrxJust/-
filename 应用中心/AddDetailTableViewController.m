//
//  AddDetailTableViewController.m
//  应用中心
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "AddDetailTableViewController.h"

@interface AddDetailTableViewController ()

@end

@implementation AddDetailTableViewController
{
    float           myWidth;
    NSDictionary    *myOneAPPDict;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    myWidth = self.view.frame.size.width;
    NSLog(@"=====%@",_oneApp);
    _label1.text = _oneApp.name;
    _label2.text = _oneApp.publisher;
    _myScroll.contentSize = CGSizeMake(3*myWidth, _myScroll.frame.size.height);
    _myScroll.bounces = NO;
    _myScroll.showsHorizontalScrollIndicator = NO;
    _myScroll.pagingEnabled = YES;
    [self makeJson];
   
}

-(void)makeJson
{
    NSString *str = [NSString stringWithFormat:MYPAth,_oneApp.uid];
    NSLog(@"===str:%@",str);
    NSURL *url = [NSURL URLWithString:str];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"解析错误!");
        }
        
        NSDictionary *allDict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        myOneAPPDict = [allDict objectForKey:@"value"];
         NSString *str = [myOneAPPDict objectForKey:@"icon"];
        dispatch_async(dispatch_get_main_queue(), ^{
           _imageView1.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:str]]];
        });
       
        
    }];
    
    [task resume];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --UITableView dataSource and delegate


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 20.0;
    }
    else
        return 0.01;
}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
- (IBAction)btnTap:(id)sender {
}
@end
