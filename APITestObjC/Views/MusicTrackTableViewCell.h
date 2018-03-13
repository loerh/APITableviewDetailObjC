//
//  MusicTrackTableViewCell.h
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicTrack.h"

@interface MusicTrackTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *trackTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *trackDurationLabel;

- (void)setupWithMusicTrack: (MusicTrack*)musicTrack;

@end
