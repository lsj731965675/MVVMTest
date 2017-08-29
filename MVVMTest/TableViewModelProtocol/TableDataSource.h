//
//  TableDataSource.h
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

/**
 标题：table数据源
 作用：生成数据源
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TestViewModel.h"

@interface TableDataSource : NSObject<UITableViewDataSource>
//数据模型数组
@property (nonatomic,strong) TestViewModel *viewModel;

@end

