//
//  MemberViewController.m
//  FutsalScore
//
//  Created by 相川　耕佑 on 2015/10/06.
//  Copyright © 2015年 aikawa. All rights reserved.
//

#import "MemberViewController.h"

@interface MemberViewController ()

@end

@implementation MemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    playerNames = [[NSMutableArray alloc] init];
    [self setPlayerNames];
    
    MemberTable.delegate = self;
    MemberTable.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadMember) name:@"reloadMember" object:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setPlayerNames{
    if (playerNames.count != 0) {
        [playerNames removeAllObjects];
    }
    
    RLMRealm *realm    = RLMRealm.defaultRealm;
    RLMResults *players = [Player allObjects];
    
    [realm beginWriteTransaction];
    for (Player *player in players) {
        NSString *playerName = [NSString stringWithFormat:@"%@  %@",player.lastname,player.firstname];
        [playerNames addObject:playerName];
    }
    [realm commitWriteTransaction];
}

-(void) reloadMember
{
    [self setPlayerNames];
    [MemberTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return playerNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    //ここをrealm化
    //NSArray *numbers         = [[NSArray alloc] initWithObjects:@"10", @"81",@"29",@"21",@"17",nil];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text       = [playerNames objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text = [numbers objectAtIndex:indexPath.row];
    cell.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
