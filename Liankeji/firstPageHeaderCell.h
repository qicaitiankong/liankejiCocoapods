//
//  firstPageHeaderCell.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface firstPageHeaderCell : UITableViewCell
//第一个标题LABLE
@property (strong,nonatomic)UILabel *firstTitleLable;
//第二个标题lable
@property (strong,nonatomic)UILabel *secondTitleLable;
//图片imageview
@property (strong,nonatomic)UIImageView *ownImageView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetView:(UIView*)_tableView;

@end
