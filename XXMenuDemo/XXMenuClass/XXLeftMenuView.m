//
//  XXLeftMenuView.m
//  XXMenuDemo
//
//  Created by xiazer on 14-6-4.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "XXLeftMenuView.h"
#import "XXDetailViewController.h"
#import "XXAppDelegate.h"
#import "PushBackNavigationController.h"

@implementation XXLeftMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
- (void)layoutSubviews{
    UITableView *tableList    = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    tableList.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    tableList.delegate        = self;
    tableList.dataSource      = self;
    [self addSubview:tableList];
}


#pragma mark tableViewDelegate;
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld 个leftMenu",(long)indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XXDetailViewController *detailVC = [[XXDetailViewController alloc] init];
    detailVC.titStr = [NSString stringWithFormat:@"我来自Page-- %ld",(long)indexPath.row];
    detailVC.indexNum = indexPath.row;
    

    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }
    PushBackNavigationController *nav = [[PushBackNavigationController alloc] initWithRootViewController:detailVC];
    [[XXAppDelegate sharedAppDelegate].XXMenuVC replaceRootVC:nav isFromLeft:YES];
    [[XXAppDelegate sharedAppDelegate].XXMenuVC showMenu:YES];
}

@end
