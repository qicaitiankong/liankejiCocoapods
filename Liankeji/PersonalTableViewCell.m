//
//  PersonalTableViewCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "PersonalTableViewCell.h"

@implementation PersonalTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier _tableviewWidth:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.newsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 100, 100)];
        
        //self.newsImageView.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.newsImageView];
        self.newsTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(110, 5, _tableView.frame.size.width - 115, 30)];
        //self.newsTitleLable.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.newsTitleLable];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
