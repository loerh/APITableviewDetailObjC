//
//  MusicAlbum.m
//  APITestObjC
//
//  Created by Laurent Meert on 13/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "MusicAlbum.h"

@implementation MusicAlbum

- (id) initWithAlbumID: (NSNumber*)albumID
                  name: (NSString*)name
            artistName: (NSString*)artistName
        imageThumbnail: (NSString*)imageThumbnail {
    
    self = [super init];
    
    if (self) {
        self.albumID = albumID;
        self.name = name;
        self.artistName = artistName;
        self.imageThumbnail = imageThumbnail;
    }
    
    return self;
}

@end
