//
//  ViewController.m
//  ttttScrollview
//
//  Created by 张立志 on 16/12/1.
//  Copyright © 2016年 张立志. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property(nonatomic,strong) UIButton *btnDe;
@property(nonatomic,strong) UIScrollView *listSCV;
@property(nonatomic,strong) UIView *listBkg;
@property(nonatomic,strong) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btnDe = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnDe.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.btnDe];
    [self.btnDe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(100);
        make.right.mas_equalTo(-100);
        make.height.mas_equalTo(35);
    }];
    [self.btnDe addTarget:self action:@selector(showList:) forControlEvents:UIControlEventTouchUpInside];
    
    self.arr = [@[@"你好",@"很好",@"哈哈哈哈",@"哈哈哈哈哈哈",@"去去"] mutableCopy];
    
}
-(void)showList:(UIButton *)btn{

    self.listSCV = [[UIScrollView alloc]init];
    self.listSCV.userInteractionEnabled = YES;
    self.listSCV.scrollEnabled = YES;
    [self.view addSubview:self.listSCV];
    [self.listSCV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(self.btnDe.mas_bottom);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(120);
    }];
    
    self.listBkg = [[UIView alloc]init];
    self.listBkg.backgroundColor = [UIColor lightGrayColor];
    [self.listSCV addSubview:self.listBkg];
    [self.listBkg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(self.listSCV.mas_width);
    }];
    
    //添加标题
    for (int i = 0; i<self.arr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.tag = 100+i;
        btn.userInteractionEnabled = YES;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 20);
        [btn setTitle:self.arr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickedChooseSortKinds:) forControlEvents:UIControlEventTouchUpInside];
        [self.listBkg addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0).mas_offset(i*30);
            make.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 30));
        }];
        
        //跟新
        [self.listBkg mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(self.listSCV.mas_width);
            make.bottom.mas_equalTo(btn.mas_bottom).mas_offset(15);
        }];
    }

}

-(void)clickedChooseSortKinds:(UIButton *)sender{
    NSLog(@"%ld",sender.tag);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
