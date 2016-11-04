//
//  ViewController.m
//  MoveSwitchView
//
//  Created by 阳永辉 on 16/6/22.
//  Copyright © 2016年 netposa. All rights reserved.
//

#import "ViewController.h"
#import "UIView+UIViewCategory.h"
#import "ColorDealingWay.h"

@interface ViewController (){
    UIImageView *_bottomMoveImageView;
    UIView *_centerView;
    UIImageView *_topMoveImageView;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bottomMoveImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottom"]];
    _bottomMoveImageView.frame = CGRectMake(40, 100, 239, 58);
    [self.view addSubview:_bottomMoveImageView];
    
    _centerView = [[UIView alloc] init];
    _centerView.frame = CGRectMake(0, 0, 60, 60);
    _centerView.layer.cornerRadius = 30;
    [_bottomMoveImageView addSubview:_centerView];
    
    _topMoveImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yuan"]];
    _topMoveImageView.frame = CGRectMake(-3.5, -3.5, 67, 67);
    [_bottomMoveImageView addSubview:_topMoveImageView];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches.allObjects lastObject];
    CGPoint point = [touch  locationInView:self.view];
    if (point.x>_bottomMoveImageView.x-20&&point.x<_bottomMoveImageView.right && point.y>_bottomMoveImageView.y &&point.y<_bottomMoveImageView.bottom) {
        _centerView.backgroundColor = [ColorDealingWay colorWithHexString:@"#8bde78"];
        if (point.x -_bottomMoveImageView.left>239/3) {
            [UIView animateWithDuration:0.3 animations:^{
                _centerView.frame = CGRectMake(0, 0, _bottomMoveImageView.width, 60);
                _topMoveImageView.centerX = _bottomMoveImageView.width-30;
            }];
        }else {
            [UIView animateWithDuration:0.3 animations:^{
                _centerView.frame = CGRectMake(0, 0, 60, 60);
                _topMoveImageView.centerX = 30;
                _centerView.backgroundColor = [UIColor clearColor];
            }];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
