//
//  Player.h
//  FutsalScore
//
//  Created by 相川　耕佑 on 2015/10/07.
//  Copyright © 2015年 aikawa. All rights reserved.
//

#import <Realm/Realm.h>

@interface Player : RLMObject
@property NSString *id;
@property NSString *firstname;
@property NSString *lastname;
@property int number;
@property NSString *position;
@property int goal;
@property int assist;
@property int shoot;
@property int timer;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Player>
RLM_ARRAY_TYPE(Player)
