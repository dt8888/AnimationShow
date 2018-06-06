//
//  AnimationCell.m
//  Animation
//
//  Created by DT on 2018/6/5.
//  Copyright © 2018年 dt. All rights reserved.
//

#import "AnimationCell.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height//获取屏幕高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width//获取屏幕宽度
@implementation AnimationCell
{
    UIButton  * _editBtn;
    UIButton *_delectBtn;//弹出删除
    UIButton *_upBtn;//下架
    UIView *_shadeView;//下架项目的遮罩
    UILabel*_goDown;//下架
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createView];
    }
    return self;
}

-(void)createView{
    
    self.contentView.backgroundColor = [UIColor lightTextColor];
    self.backgroundColor = [UIColor lightTextColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    
    _delectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _delectBtn.tag = 300;
    _delectBtn.frame = CGRectMake((kScreenWidth-20)-40, 0, 40, 85);
    _delectBtn.backgroundColor =[UIColor redColor];
      _delectBtn.titleLabel.font = [UIFont systemFontOfSize:14*kScreenWidth/375];
    [_delectBtn setTitle:@"删    除" forState:UIControlStateNormal];
    [_delectBtn addTarget:self action:@selector(editInfoTap:) forControlEvents:UIControlEventTouchUpInside];
    [_delectBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_delectBtn.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_delectBtn];
    
    
    
    _upBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _upBtn.frame = CGRectMake((kScreenWidth-20)-40, 0, 40, 85);
    _upBtn.backgroundColor = [UIColor yellowColor];
    _upBtn.titleLabel.font = [UIFont systemFontOfSize:14*kScreenWidth/375];
    [_upBtn addTarget:self action:@selector(editInfoTap:) forControlEvents:UIControlEventTouchUpInside];
     [_upBtn setTitle:@"下    架" forState:UIControlStateNormal];
    _upBtn.tag = 200;
    [_upBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_upBtn.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_upBtn];
    
    
    _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _editBtn.frame = CGRectMake((kScreenWidth-20)-40, 0, 40, 85);
    _editBtn.backgroundColor = [UIColor greenColor];
    [_editBtn setTitle:@"编    辑" forState:UIControlStateNormal];
       _editBtn.titleLabel.font = [UIFont systemFontOfSize:14*kScreenWidth/375];
    [_editBtn addTarget:self action:@selector(editTap:) forControlEvents:UIControlEventTouchUpInside];
     _editBtn.tag = 100;
    UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:_upBtn.bounds  byRoundingCorners:UIRectCornerTopRight |  UIRectCornerBottomRight    cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer2 = [[CAShapeLayer alloc] init];
    maskLayer2.frame = _editBtn.bounds;
    maskLayer2.path = maskPath2.CGPath;
    _editBtn.layer.mask = maskLayer2;
    [_editBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_editBtn.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_editBtn];

}

-(void)editTap:(UIButton *)btn{
    
    //只能打开一个
    if ([self.delegateJS respondsToSelector:@selector(closeOtherCellLeftSwipe:)]){
        [self.delegateJS closeOtherCellLeftSwipe:_indexPath];
    }
    [UIView beginAnimations:nil context:nil];
    _upBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
    _upBtn.frame = CGRectMake((kScreenWidth-20)-80, 0, 40, 85);
    _delectBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
    _delectBtn.frame = CGRectMake((kScreenWidth-20)-120, 0, 40, 85);
    [UIView commitAnimations];
    if([btn.currentTitle isEqualToString:@"更    改"]){
        [self editInfoTap:_editBtn];
        [btn setTitle:@"编    辑" forState:UIControlStateNormal];
    }else
    {
        [btn setTitle:@"更    改" forState:UIControlStateNormal];
    }
}
//关闭动画
-(void)closeAnimationsBtn{
    
    [_editBtn setTitle:@"编    辑" forState:UIControlStateNormal];
    
    [UIView beginAnimations:nil context:nil];
    _upBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
    _upBtn.frame = CGRectMake((kScreenWidth-20)-40, 0, 40, 85);
    _delectBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
    _delectBtn.frame = CGRectMake((kScreenWidth-20)-40, 0, 40, 85);
    [UIView commitAnimations];
}
-(void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
}

-(void)editInfoTap:(UIButton *)btn{
    [self closeAnimationsBtn];
    if(btn.tag ==100){
        //更改信息
      
    }else if (btn.tag==200){
        //发送通知
      
    }else if (btn.tag ==300){
        //删除
}
}
@end
