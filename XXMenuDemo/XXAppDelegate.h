//
//  AppDelegate.h
//  XXMenuDemo
//
//  Created by xiazer on 15/4/29.
//  Copyright (c) 2015年 xiazer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXMenuViewController.h"

@interface XXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) XXMenuViewController *XXMenuVC;

//private method
+ (XXAppDelegate *)sharedAppDelegate;


@end

