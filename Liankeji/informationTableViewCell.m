//
//  informationTableViewCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationTableViewCell.h"

@implementation informationTableViewCell
@synthesize ownImageView;
@synthesize firstLable;
@synthesize secondLable;
@synthesize thirdLable;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView*)_tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        CGFloat ImageViewSpace = 5;
        //行高按100先设置的
        //NSLog(@"inittableview = %lf",);
        CGFloat imageViewHeight = 100 - ImageViewSpace * 2;
        CGFloat imageViewWidth = imageViewHeight;
        
        //lable上下之间的间距
        CGFloat lableSpace = 2;
        
        CGFloat lableWidth = _tableView.frame.size.width - imageViewWidth - 3 * ImageViewSpace;
        
        CGFloat lableHeight = (imageViewHeight - lableSpace * 4) / 3;
        
        ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ImageViewSpace, ImageViewSpace, imageViewWidth, imageViewHeight)];
        ownImageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:ownImageView];
        
        firstLable = [[UILabel alloc]initWithFrame:CGRectMake(ownImageView.frame.origin.x + ownImageView.bounds.size.width + ImageViewSpace, ownImageView.frame.origin.y, lableWidth, lableHeight)];
        //firstLable.backgroundColor = [UIColor grayColor];
        firstLable.textColor = [UIColor blackColor];
        firstLable.font = [UIFont systemFontOfSize:22];
        [self.contentView addSubview:firstLable];
        
        
        
        secondLable = [[UILabel alloc]initWithFrame:CGRectMake(firstLable.frame.origin.x, firstLable.frame.origin.y + firstLable.bounds.size.height +lableSpace, lableWidth, lableHeight)];
        //secondLable.backgroundColor = [UIColor blueColor];
        secondLable.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:secondLable];
        
        
        thirdLable = [[UILabel alloc]initWithFrame:CGRectMake(secondLable.frame.origin.x,secondLable.frame.origin.y + secondLable.bounds.size.height + lableSpace, lableWidth, lableHeight)];
        //thirdLable.backgroundColor = [UIColor redColor];
        thirdLable.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:thirdLable];
        
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
