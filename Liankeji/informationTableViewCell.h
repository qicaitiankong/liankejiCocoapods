//
//  informationTableViewCell.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.

//资讯的首页的自定义CELL

#import <UIKit/UIKit.h>

@interface informationTableViewCell : UITableViewCell

@property (strong,nonatomic)UIImageView *ownImageView;

@property (strong,nonatomic)UILabel *firstLable;

@property (strong,nonatomic)UILabel *secondLable;

@property (strong,nonatomic)UILabel *thirdLable;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView;

@end
