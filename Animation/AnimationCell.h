//
//  AnimationCell.h
//  Animation
//
//  Created by DT on 2018/6/5.
//  Copyright © 2018年 dt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AnimationCell;
@protocol AnimationCellDelegate <NSObject>
@optional
- (void)closeOtherCellLeftSwipe:(NSIndexPath*)indexPath;              //关闭其他单元格的左滑
@end
@interface AnimationCell : UITableViewCell
@property(nonatomic,weak)id<AnimationCellDelegate>delegateJS; //代理
@property(nonatomic,strong)NSIndexPath *indexPath;
-(void)closeAnimationsBtn;
@end
