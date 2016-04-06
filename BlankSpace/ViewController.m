//
//  ViewController.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *strongStr;
@property (nonatomic, copy) NSString *copyedStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testFunction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

- (void)testFunction
{
    NSString *str = [NSString stringWithFormat:@"abc"];
    self.strongStr = str;
    self.copyedStr = str;
    
    NSMutableString *mutableCopyedStr = [str mutableCopy];
    NSString *copyedString = [str copy];
    
    NSLog(@"origin str: %p --- %p", str, &str);
    NSLog(@"strong str: %p --- %p", _strongStr, &_strongStr);
    NSLog(@"copyed str: %p --- %p", _copyedStr, &_copyedStr);
    NSLog(@"strong str: %p --- %p", mutableCopyedStr, &mutableCopyedStr);
    NSLog(@"copyed str: %p --- %p", copyedString, &copyedString);
}















@end
