//
//  BSBaseViewController.m
//  BlankSpace
//
//  Created by stone on 16/4/6.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "BSBaseViewController.h"
#import "LogUtils.h"
#import "BSLoadStatusView.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "SVProgressHUD.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "UIColor+Tools.h"
#import <AFNetworking/AFNetworking.h>

@interface BSBaseViewController ()

@end

@implementation BSBaseViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.clearsSelectionOnViewWillAppear = YES;
    }
    
    return self;
}

- (instancetype)initWithViewModel:(BSViewModel *)viewModel {
    self =  [self initWithNibName:nil bundle:nil];
    if (self) {
        [self setValue:viewModel forKey:@"viewModel"];
    }
    return self;
}

#pragma mark - Life Cycles

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"0x95E5E5"];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    if (!self.tableView) {
        if ([self.view isKindOfClass:[UITableView class]]) {
            self.tableView = (UITableView *) self.view;
        } else if ([[self.view.subviews firstObject] isKindOfClass:[UITableView class]]) {
            self.tableView = (UITableView *) self.view.subviews.firstObject;
        }
    }
    self.tableView.delegate = (id <UITableViewDelegate>) self;
    self.tableView.dataSource = (id <UITableViewDataSource>) self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        self.tableView.layoutMargins = UIEdgeInsetsZero;
    }
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView or CollectionView

/**
 * 加载列表的结果展示
 */
- (void)configLoadRefreshFinishWithError:(NSError *)error loadedCount:(NSInteger)count{
    if (error) {
        [self.tableViewOrCollectionView.loadStatusView setFailText:[NSString stringWithFormat:@"加载失败:%@", error.localizedDescription]];
        [self.tableViewOrCollectionView setStatusFail];
    } else {
        if (count == 0) {
            [self.tableViewOrCollectionView setStatusEmpty];
        } else {
            [self.tableViewOrCollectionView setStatusSuccess];
            [self.tableViewOrCollectionView reloadData];
        }
    }
}

/*
 * 加载完下一页视图展示
 */
- (void)configBottomLoadFinishWithError:(NSError *)error
                            loadedCount:(NSInteger)loadedCount {
    [[self.tableViewOrCollectionView infiniteScrollingView] stopAnimating];
    if (loadedCount == 0) {
        self.tableViewOrCollectionView.infiniteScrollingView.enabled = NO;
    } else {
        [self.tableViewOrCollectionView reloadData];
    }
}


- (void)configPullRefreshFinishWithError:(NSError *)error loadedCount:(NSInteger)count{
    if (error) {
        [self.tableViewOrCollectionView setStatusSuccess];
        [[self.tableViewOrCollectionView pullToRefreshView] stopAnimating];
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"加载失败:%@", error.localizedDescription]];
    } else {
        if (count == 0) {
            [self.tableViewOrCollectionView setStatusEmpty];
        } else {
            [self.tableViewOrCollectionView setStatusSuccess];
        }
        if (self.tableViewOrCollectionView.showsInfiniteScrolling) {
            self.tableViewOrCollectionView.infiniteScrollingView.enabled = YES;
        }
        [self.tableViewOrCollectionView reloadData];
        [[self.tableViewOrCollectionView pullToRefreshView] stopAnimating];
    }
}
/*
 * @notice 调用者应该只调用TableView和CollectionView 签名一样的方法
 * @return TableView或者CollectionView
 */
- (UITableView *)tableViewOrCollectionView {
    if (self.tableView) {
        return self.tableView;
    }
    if (self.collectionView) {
        return (id)self.collectionView;
    }
    return nil;
}

@end
