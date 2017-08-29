//
//  TestViewController.m
//  MVVMTest
//
//  Created by Joy on 2017/8/26.
//  Copyright © 2017年 Joy. All rights reserved.
//

#import "TestViewController.h"
#import "TableDelegate.h"
#import "TableDataSource.h"
#import "TestViewModel.h"
#import "MJRefresh.h"
#import "NextViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController {
    NSMutableArray *totalSource;//数据数组
    TestViewModel *tableViewModel;//viewModel
    UITableView *tableView;//滚动视图
    TableDataSource *tableViewDataSource;//table数据源
    TableDelegate *tableViewDelegate;//table代理
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma mark - 初始化
- (void)setUI {
    if ([[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
    self.title = @"MVVMTest";
    self.view.backgroundColor=[UIColor whiteColor];
    [self configMainView];
    //下拉刷新
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshAction)];
    //上拉加载
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshAction)];
    //开始下拉刷新
    [tableView.mj_header beginRefreshing];
    //点击cell
    __weak typeof(tableViewModel) weakTableViewModel = tableViewModel;
    tableViewDelegate.cellClick = ^(TestViewModel *viewModel) {
        NSLog(@"点击cell");
        [weakTableViewModel gotoNextVCWithViewModel:viewModel];
    };
    //点击cell回调后的跳转
    __weak typeof(self) weakSelf = self;
    tableViewModel.goToVC = ^(TestEnum testEnum) {
        switch (testEnum) {
            case 0:
            {
                NextViewController *vc = [[NextViewController alloc] init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                SecondViewController *vc = [[SecondViewController alloc] init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
            {
                ThirdViewController *vc = [[ThirdViewController alloc] init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
                break;
        }
    };

}

/**
 主视图
 */
- (void)configMainView {
    totalSource = 0;
    /* 这个也可以考虑封装起来放到view层(更符合vc只充当胶水的作用) */
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableViewDataSource = [[TableDataSource alloc] init];
    tableViewDelegate = [[TableDelegate alloc] init];
    tableView.dataSource = tableViewDataSource;
    tableView.delegate = tableViewDelegate;
    tableViewModel = [[TestViewModel alloc] init];
}

/**
 下拉刷新
 */
- (void)headerRefreshAction {
    __weak typeof(tableViewModel) weakTableViewModel = tableViewModel;
    [tableViewModel headerRefreshRequestWithCallback:^(NSArray<TestModel *> *models){
        weakTableViewModel.models = (NSMutableArray *)models;
        tableViewDataSource.viewModel = weakTableViewModel;
        tableViewDelegate.viewModel = weakTableViewModel;
        [tableView.mj_header endRefreshing];
        [tableView reloadData];
    }];
}

/**
 上拉加载
 */
- (void)footerRefreshAction {
    __weak typeof(tableViewModel) weakTableViewModel = tableViewModel;
    [tableViewModel footerRefreshRequestWithCallback:^(NSArray<TestModel *> *models){
        weakTableViewModel.models = (NSMutableArray *)models;
        tableViewDataSource.viewModel = weakTableViewModel;
        tableViewDelegate.viewModel = weakTableViewModel;
        [tableView.mj_header endRefreshing];
        [tableView reloadData];
        
    }];
}


@end
