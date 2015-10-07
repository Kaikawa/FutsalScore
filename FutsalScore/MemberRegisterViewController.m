//
//  MemberRegisterViewController.m
//  FutsalScore
//
//  Created by 相川　耕佑 on 2015/10/06.
//  Copyright © 2015年 aikawa. All rights reserved.
//

#import "MemberRegisterViewController.h"

@interface MemberRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameText;
@property (weak, nonatomic) IBOutlet UITextField *lastNameText;
@property (weak, nonatomic) IBOutlet UITextField *numberText;
@property (weak, nonatomic) IBOutlet UITextField *positionText;
- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)registerButton:(UIButton *)sender;

@end

@implementation MemberRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)cancel:(UIBarButtonItem *)sender {
   [self dismissViewControllerAnimated:YES completion:nil]; 
}

- (IBAction)registerButton:(UIButton *)sender {
    Player *player = [[Player alloc] init];
    player.id = [[NSUUID UUID] UUIDString];
    player.firstname = _firstNameText.text;
    player.lastname  = _lastNameText.text;
    player.number = [_numberText.text intValue];
    player.position = _positionText.text;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:player];
    [realm commitWriteTransaction];
    
    NSNotification *notification = [NSNotification notificationWithName:@"reloadMember" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
