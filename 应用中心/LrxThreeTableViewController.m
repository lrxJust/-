//
//  LrxThreeTableViewController.m
//  应用中心
//
//  Created by Apple on 16/3/25.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "LrxThreeTableViewController.h"

@interface LrxThreeTableViewController ()

@end

@implementation LrxThreeTableViewController
{
    UISearchController *sc;
    UISearchBar *mySc;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    sc = [[UISearchController alloc] initWithSearchResultsController:self];
//    self.tableView.backgroundColor = [UIColor redColor];
//    [sc.searchBar setAutocapitalizationType:(UITextAutocapitalizationTypeNone)];
//    [sc.searchBar setAutocorrectionType:(UITextAutocorrectionTypeNo)];
//    
//    [self.tableView setTableHeaderView:sc.searchBar];
    mySc = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    mySc.placeholder = @"search";
    mySc.showsSearchResultsButton = YES;
    
    self.navigationItem.titleView = mySc;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
