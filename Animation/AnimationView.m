//
//  AnimationView.m
//  Animation
//
//  Created by DT on 2018/6/5.
//  Copyright © 2018年 dt. All rights reserved.
//

#import "AnimationView.h"
#import "AnimationCell.h"
@implementation AnimationView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if(self==[super initWithFrame:frame style:style])
    {
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    AnimationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[AnimationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个",indexPath.row];
    cell.indexPath = indexPath;
    cell.delegateJS =self;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    //循环显示的cell
    for (AnimationCell *item in self.visibleCells) {
        [item closeAnimationsBtn];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 1;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 10;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//}

-(void)closeOtherCellLeftSwipe:(NSIndexPath *)indexPath
{
    for (AnimationCell *item in self.visibleCells) {
        NSIndexPath *path = [self indexPathForCell:item];
        if(indexPath.section!=path.row){
            [item closeAnimationsBtn];
        }
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //循环显示的cell
    for (AnimationCell *item in self.visibleCells) {
        [item closeAnimationsBtn];
    }
}
@end
