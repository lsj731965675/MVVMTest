//
//  TableDataSource.m
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

#import "TableDataSource.h"
#import "TestCell.h"

static NSString *const testCell = @"TestCell";
@implementation TableDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:testCell];
    if (cell == nil) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:testCell];
    }
    self.viewModel.row = indexPath.row;
    cell.viewModel = self.viewModel;
    return cell;
}

@end
