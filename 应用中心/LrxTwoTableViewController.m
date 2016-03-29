//
//  LrxTwoTableViewController.m
//  应用中心
//
//  Created by Apple on 16/3/16.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LrxTwoTableViewController.h"

@interface LrxTwoTableViewController ()

@end

@implementation LrxTwoTableViewController
{
   
    NSArray *allData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    lab.text = @"分类";
    [lab setFont:[UIFont systemFontOfSize:22]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:lab];
    self.navigationItem.leftBarButtonItem = item;
    
    [self receiveData];
}

//接受数据
-(void)receiveData
{
    NSURL *url = [NSURL URLWithString:URLPath];
//    NSURLRequest *myRequest = [NSURLRequest requestWithURL:url];

    
    NSURLSession *mySession = [NSURLSession sharedSession];
    NSURLSessionTask *task = [mySession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"有错！");
            return ;
        }
        NSError *justerror;
        NSDictionary *myDict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:&justerror];
        if (justerror) {
            NSLog(@"接受数据有错!");
            return;
        }
        if (myDict == nil) {
            NSLog(@"没有数据！");
        }
        NSDictionary *justDict = [myDict objectForKey:@"value"];
        NSArray *arr1 = [justDict objectForKey:@"blocks"];
        NSDictionary *newDict = [arr1 firstObject];
        allData= [newDict objectForKey:@"data"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];

    [task resume]; 
    
}

//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

  
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return allData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"myCell"];
    }
    // Configure the cell...
    NSDictionary *myNeed = [allData objectAtIndex:indexPath.row];
    
    NSString *name = [myNeed objectForKey:@"name"];
    NSString *path = [myNeed objectForKey:@"icon"];
    NSURL *urlPath = [NSURL URLWithString:path];
    NSData *data=[NSData dataWithContentsOfURL:urlPath];
    cell.textLabel.text = name;
    cell.imageView.image = [UIImage imageWithData:data];
//    cell.contentView
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
