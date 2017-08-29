//
//  TestCell.h
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

/**
 标题：viewcell
 作用：test
 */
#import <UIKit/UIKit.h>
#import "TestViewModel.h"

@interface TestCell : UITableViewCell

/* testViewModel */
@property (strong, nonatomic) TestViewModel *viewModel;

@end
