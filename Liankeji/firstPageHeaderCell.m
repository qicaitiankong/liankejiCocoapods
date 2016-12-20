//
//  firstPageHeaderCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//
//首页中科技头条的CELL

#import "firstPageHeaderCell.h"

@implementation firstPageHeaderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetView:(UIView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //self.backgroundColor = [UIColor grayColor];
        
        _firstTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, _tableView.frame.size.width - 5 * 2, 20)];
        _firstTitleLable.font = [UIFont systemFontOfSize:24];
       // _firstTitleLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_firstTitleLable];
        
        _secondTitleLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 5 + _firstTitleLable.frame.size.height + 2, _firstTitleLable.frame.size.width, 40)];
        _secondTitleLable.textColor = [UIColor lightGrayColor];
        //_secondTitleLable.textColor = [UIColor blackColor];
        _secondTitleLable.numberOfLines = 0;
        //_secondTitleLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_secondTitleLable];
        
        _ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, _secondTitleLable.frame.origin.y + _secondTitleLable.frame.size.height + 2, _secondTitleLable.frame.size.width, 120)];
        //_ownImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_ownImageView];
        
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
