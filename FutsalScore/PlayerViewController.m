//
//  PlayerViewController.m
//  FutsalScore
//
//  Created by 相川　耕佑 on 2015/10/07.
//  Copyright © 2015年 aikawa. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@property (strong, nonatomic) IBOutlet UILabel *goalLabel;
@property (strong, nonatomic) IBOutlet UILabel *assistLabel;
@property (strong, nonatomic) IBOutlet UILabel *shootLabel;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RLMRealm *realm     = RLMRealm.defaultRealm;
    NSString *playerNum = [self.title substringToIndex:2];
    NSString *where     = [NSString stringWithFormat:@"number = %@", playerNum];
    RLMResults *players = [Player objectsWhere:where];
    
    [realm beginWriteTransaction];
    Player *player    = players[0];
    _goalLabel.text   = [NSString stringWithFormat:@"%d", player.goal];
    _assistLabel.text = [NSString stringWithFormat:@"%d", player.assist];
    _shootLabel.text  = [NSString stringWithFormat:@"%d", player.shoot];
    [realm commitWriteTransaction];

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
- (IBAction)goalButton:(UIButton *)sender {
    RLMRealm *realm     = RLMRealm.defaultRealm;
    NSString *playerNum = [self.title substringToIndex:2];
    NSString *where     = [NSString stringWithFormat:@"number = %@", playerNum];
    RLMResults *players = [Player objectsWhere:where];
    
    [realm beginWriteTransaction];
    Player *player    = players[0];
    player.goal      += 1;
    _goalLabel.text   = [NSString stringWithFormat:@"%d", player.goal];
    [realm commitWriteTransaction];
}

- (IBAction)assistButton:(UIButton *)sender {
    RLMRealm *realm     = RLMRealm.defaultRealm;
    NSString *playerNum = [self.title substringToIndex:2];
    NSString *where     = [NSString stringWithFormat:@"number = %@", playerNum];
    RLMResults *players = [Player objectsWhere:where];
    
    [realm beginWriteTransaction];
    Player *player    = players[0];
    player.assist    += 1;
    _assistLabel.text = [NSString stringWithFormat:@"%d", player.assist];
    [realm commitWriteTransaction];
}

- (IBAction)shootButton:(UIButton *)sender {
    RLMRealm *realm     = RLMRealm.defaultRealm;
    NSString *playerNum = [self.title substringToIndex:2];
    NSString *where     = [NSString stringWithFormat:@"number = %@", playerNum];
    RLMResults *players = [Player objectsWhere:where];
    
    [realm beginWriteTransaction];
    Player *player    = players[0];
    player.shoot     += 1;
    _shootLabel.text  = [NSString stringWithFormat:@"%d", player.shoot];
    [realm commitWriteTransaction];
}

@end
