//
//  TableDelegate.m
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

#import "TableDelegate.h"

@implementation TableDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.viewModel.row = indexPath.row;
    if (_cellClick) {
        self.cellClick(self.viewModel);
    }
}

@end
