//
//  UITableView+Helper.m
//  BlankSpace
//
//  Created by stone on 16/3/7.
//  Copyright © 2016年 stone. All rights reserved.
//

#import "UITableView+Helper.h"

@implementation UITableView(Helper)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)hidesExtraSeparator {
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 0.1)];
}

- (void)hidesGroupedHeader {
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.1, 0.1)];
}
@end
