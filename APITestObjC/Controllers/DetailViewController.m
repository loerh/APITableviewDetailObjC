//
//  DetailViewController.m
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.musicAlbum) {
        return;
    }
    
    self.title = self.musicAlbum.name;
    [self setupAlbumOutlet];
    
    [[APIManager sharedInstance] fetchTracksWithAlbumID:self.musicAlbum.albumID completion:^(NSMutableArray<MusicTrack *> * _Nullable tracks) {
        if (!tracks) {
            return;
        }
        
        self.tracks = tracks;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tracksTableView reloadData];
        });
        
    }];
}

#pragma mark - Other functions

- (void)setupAlbumOutlet {
    [[APIManager sharedInstance] fetchImageWithURL:self.musicAlbum.imageThumbnail completion:^(NSData* _Nullable data) {
        UIImage* image = [[UIImage alloc] initWithData:data];
        [self.albumImageView setImage:image];
    }];
    
    [self.albumNameLabel setText:self.musicAlbum.name];
    [self.artistNameLabel setText:self.musicAlbum.artistName];
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MusicTrackTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MusicTrackTableViewCell"];
    
    MusicTrack* track = self.tracks[indexPath.row];
    
    [cell setupWithMusicTrack:track];
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracks.count;
}

@end
