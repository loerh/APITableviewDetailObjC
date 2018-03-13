//
//  DetailViewController.h
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicAlbum.h"
#import "MusicTrack.h"
#import "MusicTrackTableViewCell.h"
#import "APIManager.h"

@interface DetailViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;

@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;

@property (weak, nonatomic) IBOutlet UITableView *tracksTableView;

@property MusicAlbum* musicAlbum;

@property (nonatomic, strong) NSMutableArray<MusicTrack*>* tracks;

- (void) setupAlbumOutlet;

@end
