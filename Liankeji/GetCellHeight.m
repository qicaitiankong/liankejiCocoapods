//
//  GetCellHeight.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/2.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "GetCellHeight.h"
static GetCellHeight *getCellHeight = nil;
@implementation GetCellHeight
+ (GetCellHeight*)ShareCellHeight{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        getCellHeight = [[GetCellHeight alloc]init];
    });
    return getCellHeight;
}
- (CGFloat)cellHeight:(UILabel*)targetLabel content:(NSString *)_contentString Cellwidth:(CGFloat)_width{
    NSLog(@"%lf",targetLabel.frame.size.width);
    UILabel *lable = [[UILabel alloc]init];
    lable.backgroundColor = [UIColor grayColor];
    lable.numberOfLines = 0;
    lable.textAlignment = targetLabel.textAlignment;
    lable.font = targetLabel.font;
    lable.text = _contentString;
    NSDictionary *dict = [NSDictionary dictionaryWithObject:lable.font forKey:NSFontAttributeName];
    CGRect rect = [lable.text boundingRectWithSize:CGSizeMake(_width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesDeviceMetrics attributes:dict context:nil];
    return rect.size.height;
}
@end
