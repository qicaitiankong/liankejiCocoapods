//
//  PersonalTableViewCell.h
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalTableViewCell : UITableViewCell
@property (strong,nonatomic)UIImageView *newsImageView;
@property (strong,nonatomic)UILabel *newsTitleLable;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier _tableviewWidth:(UITableView*)_tableView;
@end
