//
//  RankingViewController.m
//  FutsalScore
//
//  Created by 相川　耕佑 on 2015/10/07.
//  Copyright © 2015年 aikawa. All rights reserved.
//

#import "RankingViewController.h"

@interface RankingViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel_1;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel_2;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel_3;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel_1;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel_2;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel_3;

@end

@implementation RankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ランキング";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)estimateRanking{
    //ここにランキングを求めるプログラムを書く
}

@end
