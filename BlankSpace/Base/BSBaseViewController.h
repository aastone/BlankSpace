//
//  BSBaseViewController.h
//  BlankSpace
//
//  Created by stone on 16/4/6.
//  Copyright © 2016年 stone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSViewModel.h"

#define DECLARE_VIEWMODEL(type) @property(strong, nonatomic) type *viewModel;
#define DECLARE_VIEWMODEL_GETTER(type) - (type *)viewModel {\
if (!_viewModel) {                                                   \
_viewModel = [type new];                              \
}                                                                    \
return _viewModel;                                                    \
}                                                                     \

#define WEAK_SELF __weak typeof(self) weakSelf = self;

@interface BSBaseViewController : UIViewController

@property(nonatomic, weak) IBOutlet UITableView *tableView;
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property(nonatomic, assign) BOOL clearsSelectionOnViewWillAppear; // Default to YES

- (instancetype)initWithViewModel:(BSViewModel *)viewModel;

- (void)configLoadRefreshFinishWithError:(NSError *)error loadedCount:(NSInteger)count;
- (void)configBottomLoadFinishWithError:(NSError *)error loadedCount:(NSInteger)loadedCount;
- (void)configPullRefreshFinishWithError:(NSError *)error loadedCount:(NSInteger)count;


@end
