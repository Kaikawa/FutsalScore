//
//  MemberViewController.h
//  FutsalScore
//
//  Created by 相川　耕佑 on 2015/10/06.
//  Copyright © 2015年 aikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "PlayerViewController.h"
#import "Player.h"

@interface MemberViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *MemberTable;
    NSMutableArray *playerNames;
    NSMutableArray *playerPositions;
}

@end
