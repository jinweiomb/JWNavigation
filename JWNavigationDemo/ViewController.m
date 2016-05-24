//
//  ViewController.m
//  JWNavigationDemo
//
//  Created by szgw on 16/5/24.
//  Copyright © 2016年 JINWEI. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+JWNavigationBar.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
}
@property(nonatomic,strong)UITableView *TableView;


@end

@implementation ViewController

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.navigationController.navigationBar jwReset];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.TableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.TableView.delegate=self;
    self.TableView.dataSource=self;
    [self.TableView setBackgroundColor:[UIColor whiteColor]];
    _TableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    
    [self.view addSubview:self.TableView];
    
}

-(void)setNav{
    
    self.title = @"DEMO";
    
    [self.navigationController.navigationBar jwInitBackgroundColor:[UIColor redColor] Alpha:0];
    
}

#pragma mark-UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    cell.textLabel.text = @"text";
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondViewController *vc = [[SecondViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= - 64) {
        CGFloat alpha = MIN(1, (64 + offsetY)/150);
        [self.navigationController.navigationBar jwSetBackgroundColor:[UIColor redColor] Alpha:alpha];
        
    } else {
        [self.navigationController.navigationBar jwSetBackgroundColor:[UIColor redColor] Alpha:0];
    }
}
@end
