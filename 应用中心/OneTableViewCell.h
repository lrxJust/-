//
//  OneTableViewCell.h
//  应用中心
//
//  Created by Apple on 16/3/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mypicture;
@property (weak, nonatomic) IBOutlet UILabel *mainLab1;
@property (weak, nonatomic) IBOutlet UILabel *detailLab2;
@property (weak, nonatomic) IBOutlet UILabel *countLab3;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;

@property (weak, nonatomic) IBOutlet UIImageView *myxing2;
@end
