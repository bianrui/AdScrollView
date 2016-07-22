//
//  ViewController.m
//  AdsScrollView
//
//  Created by bianruifeng on 16/7/22.
//  Copyright © 2016年 bianruifeng. All rights reserved.
//

#import "ViewController.h"
#import "AdScrollView.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
@interface ViewController ()<
AdScrollViewDelegate,
AdScrollViewDataSource>
{
    NSArray *imageArray;
}
@property (nonatomic, strong) AdScrollView *adsView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.adsView];
    
    [self.adsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(([UIScreen mainScreen].bounds.size.height*0.15));
    }];

    imageArray=@[@"http://f.hiphotos.baidu.com/image/pic/item/c9fcc3cec3fdfc03777a357fd03f8794a5c226f3.jpg",@"http://b.hiphotos.baidu.com/image/pic/item/d009b3de9c82d1580d1b8f76840a19d8bd3e4258.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/6f061d950a7b02084052e92666d9f2d3562cc85a.jpg",@"http://e.hiphotos.baidu.com/image/pic/item/a6efce1b9d16fdfae3ebb2e3b68f8c5494ee7b33.jpg"];
    [self.adsView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)adScrollView:(AdScrollView *)adScrollView didSelectAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}
-(NSInteger)adScrollView:(AdScrollView *)adScrollView numberOfRowsInSection:(NSInteger)index
{
    return imageArray.count;
}
-(UIView *)adScrollView:(AdScrollView *)adScrollView cellForRowAtIndexPath:(NSUInteger)index
{
    UIImageView *image = [[UIImageView alloc] init];
    image.userInteractionEnabled = YES;
    [image sd_setImageWithURL:[NSURL URLWithString:imageArray[index]] placeholderImage:[UIImage imageNamed:@"IMG_1878"]];
    return image;
}
-(AdScrollView *)adsView
{
    if (!_adsView) {
        _adsView=[[AdScrollView alloc] initWithTarget:self interval:4 style:nil];
       
    }
    return _adsView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
