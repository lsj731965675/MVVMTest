//
//  TableDelegate.h
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

/**
 标题：table代理
 作用：生成代理和代理逻辑
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TestViewModel.h"

//cell点击回调
typedef void (^CellClick) (TestViewModel *viewModel);

@interface TableDelegate : NSObject<UITableViewDelegate>

//数据模型数组
@property (nonatomic,strong) TestViewModel *viewModel;
/* cell点击回调 */
@property (copy, nonatomic) CellClick cellClick;

@end
