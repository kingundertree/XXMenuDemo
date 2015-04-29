//
//  XXDetailViewController.m
//  XXMenuDemo
//
//  Created by xiazer on 14-4-23.
//  Copyright (c) 2014年 夏至. All rights reserved.
//

#import "XXDetailViewController.h"
#import "XXNextViewController.h"
#import "XXAppDelegate.h"

@interface XXDetailViewController ()

@end

@implementation XXDetailViewController
@synthesize indexNum;
@synthesize titStr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.title = titStr;
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(leftMenu:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(rightMenu:)];
    self.navigationItem.rightBarButtonItem = rightBtn;

    
    // Do any additional setup after loading the view.
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenWidth)];
    lab.text = [NSString stringWithFormat:@"%ld",(long)indexNum];
    lab.textColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.backgroundColor = [UIColor redColor];
    lab.font = [UIFont systemFontOfSize:160];
    [self.view addSubview:lab];

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 350, screenWidth, 45);
    btn.backgroundColor = [UIColor grayColor];
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
