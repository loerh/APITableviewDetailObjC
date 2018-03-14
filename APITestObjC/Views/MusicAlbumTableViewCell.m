//
//  MusicAlbumTableViewCell.m
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "MusicAlbumTableViewCell.h"

@implementation MusicAlbumTableViewCell

- (void)setupWithMusicAlbum:(MusicAlbum *)musicAlbum {
    [self.albumNameLabel setText:musicAlbum.name];
    [self.artistNameLabel setText:musicAlbum.artistName];
    
    /// Clean image
    [self.albumImageView setImage: nil];
    [self.albumImageView setAlpha: 0];
    
    /// Image
    [[APIManager sharedInstance] fetchImageWithURL:musicAlbum.imageThumbnail completion:^(NSData* _Nullable data) {
        if (!data) {
            return;
        }
        
        UIImage* image = [[UIImage alloc] initWithData: data];
        [self.albumImageView setImage: image];
        
        [UIView animateWithDuration:0.4 animations:^{
            [self.albumImageView setAlpha: 1];
        }];
    }];
}

@end
