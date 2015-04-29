###先上效果图
![Mou icon](https://raw.githubusercontent.com/kingundertree/XXMenuDemo/master/XXMenuGif.gif)

###github地址

https://github.com/kingundertree/XXMenuDemo

###说明
左右滑动，显示左侧菜单。这种交互在2014年比较火，我最喜欢的实现效果是华住app。不过后台他也改成tab结构。

这个Demo实在左侧菜单的基础上，增加为支持左右侧菜单。并且支持主视图缩放效果。

后面还附上swift版本github项目。

主要基于手势控制，以及缩放动画实现。再以及工程的设计思路。

并且添加的手势滑动返回功能，见：http://kingundertree.github.io/2015/04/24/手势滑动返回/

###功能
1. 支持右滑，显示左侧菜单
2. 支持左滑，显示右侧菜单
3. 支持左右侧菜单滑动切换
4. 支持手势滑动返回
5. 支持滑动时，主视图平滑缩放效果
	
###实现机制
1. XXMenuVC基于viewController，add initWithRootViewController生成的PushBackNavigationController视图
2. 赋予XXMenuVC给 self.window.rootViewController
3. 在XXMenuVC add 左右菜单视图，并添加UITapGestureRecognizer、UIPanGestureRecognizer手势控制。
4. XXMenuVC视图的移动控制KVO实现
4. 基于手势控制调整主视图的frame和缩放。
5. 通过XXMenuVC控制视图切换和左右菜单的交互
	
###使用方法

目前，所有功能都已经集成到XXMenuViewController中，需要定制XXLeftMenuView、XXRightMenuView。

1.初始化

在AppDelegate中add主视图XXMenuVC，并设置XXMenuVC为变量

    XXMainViewController *mainVC = [[XXMainViewController alloc] init];
    PushBackNavigationController *nav = [[PushBackNavigationController alloc] initWithRootViewController:mainVC];
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        [[UIApplication sharedApplication] setStatusBarHidden:TRUE];
    }
    XXMenuVC = [[XXMenuViewController alloc] initWithRootVC:nav];
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }
    
    self.window.rootViewController = XXMenuVC;

2.设置左右菜单view
	
     leftMenuView = [[XXLeftMenuView alloc] initWithFrame:frame];
     rightMenuView = [[XXRightMenuView alloc] initWithFrame:frame];


3.显示隐藏左右菜单
	
	- (void)showMenu:(BOOL)isLeftMenu;

4.设置初始化主视图
	
	- (id)initWithRootVC:(UIViewController *)controller

5.左右菜单的操作事件，替换主视图
	
	- (void)replaceRootVC:(UIViewController *)replaceVC isFromLeft:

6.XXMenuVC

主视图的所有交互通过XXMenuVC实现
	
	[XXAppDelegate sharedAppDelegate].XXMenuVC


###swift版本

####github地址

	https://github.com/kingundertree/XXMenuBySwiftDemo
	
只实现主要功能，包括手势控制和左右菜单显示和隐藏