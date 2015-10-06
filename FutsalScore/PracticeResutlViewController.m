//
//  PracticeResutlViewController.m
//  FutsalScore
//
//  Created by 相川　耕佑 on 2015/10/06.
//  Copyright © 2015年 aikawa. All rights reserved.
//

#import "PracticeResutlViewController.h"

@interface PracticeResutlViewController ()
- (IBAction)cancel:(UIBarButtonItem *)sender;

@end

@implementation PracticeResutlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    resultView.delegate = self;
    resultView.dataSource = self;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    //ここをrealm化
    NSArray *gameNames    = [[NSArray alloc] initWithObjects:@"①　vs　②", @"③　vs　④",@"①　vs　③",@"②　vs　④",@"②　vs　③",nil];
    NSArray *days         = [[NSArray alloc] initWithObjects:@"10月5日", @"10月4日",@"10月3日",@"10月2日",@"10月1日",nil];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text       = [gameNames objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [days objectAtIndex:indexPath.row];
    cell.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
