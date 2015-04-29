//
//  XXNextViewController.m
//  XXMenuDemo
//
//  Created by xiazer on 14-6-5.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "XXNextViewController.h"

@interface XXNextViewController ()

@end

@implementation XXNextViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"next";
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
