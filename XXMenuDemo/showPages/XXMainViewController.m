//
//  XXMainViewController.m
//  XXMenuDemo
//
//  Created by shan xu on 14-4-11.
//  Copyright (c) 2014年 夏至. All rights reserved.
//

#import "XXMainViewController.h"
#import "XXAppDelegate.h"
#import "XXNextViewController.h"

@interface XXMainViewController ()

@end

@implementation XXMainViewController
@synthesize indexNum;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        indexNum = 0;
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated{
    DLog(@"viewWillAppear");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = [NSString stringWithFormat:@"我来自%ld",(long)indexNum];

    self.view.layer.shadowColor = [[UIColor blackColor]CGColor];
//    self.view.layer.shadowOffset = CGSizeMake(5, 5);
    self.view.layer.shadowRadius = 5;
    self.view.layer.shadowOpacity = 1;
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(leftMenu:)];
    self.navigationItem.leftBarButtonItem = leftBtn;

    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(rightMenu:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UILabel *bgLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - 20 -44)];
    bgLab.backgroundColor = [UIColor colorWithRed:(arc4random()%255+1)/255.0 green:(arc4random()%255+1)/255.0 blue:(arc4random()%255+1)/255.0 alpha:0.6];
    bgLab.text = [NSString stringWithFormat:@"%ld",(long)indexNum];
    bgLab.textAlignment = NSTextAlignmentCenter;
    bgLab.textColor = [UIColor colorWithRed:(arc4random()%255+1)/255.0 green:(arc4random()%255+1)/255.0 blue:(arc4random()%255+1)/255.0 alpha:0.6];
    bgLab.font = [UIFont systemFontOfSize:120];
    [self.view addSubview:bgLab];

    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 350, screenWidth, 45);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"Go Next" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)goNext:(id)sender{
    XXNextViewController *next = [[XXNextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)leftMenu:(id)sender{
    [[XXAppDelegate sharedAppDelegate].XXMenuVC showMenu:YES];
}
- (void)rightMenu:(id)sender{
    [[XXAppDelegate sharedAppDelegate].XXMenuVC showMenu:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
