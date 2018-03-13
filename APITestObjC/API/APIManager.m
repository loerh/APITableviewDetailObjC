//
//  APIManager.m
//  APITestObjC
//
//  Created by Laurent Meert on 08/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (instancetype)sharedInstance
{
    static APIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[APIManager alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (void) fetchAlbumsWithCompletion:(RequestAlbumsBlock)completion {
    
    /// Define URL
    NSString* url = @"https://itunes.apple.com/lookup?id=909253&entity=album";
    
    /// Fetch using generic function
    [self fetchDataWithURL:url completion:^(NSData * data) {
        
        /// Serialise JSON
        NSError* error = nil;
        NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:&error];
        
        NSArray* clientsJSON = [jsonObject objectForKey:@"results"];
        
        /// Abort if there was an error
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        
        NSMutableArray<MusicAlbum*>* albums = [[NSMutableArray<MusicAlbum*> alloc] init];
        
        for (NSDictionary* dic in clientsJSON) {
            
            if (![dic[@"wrapperType"]  isEqual: @"collection"] || ![dic[@"collectionType"]  isEqual: @"Album"]) {
                continue;
            }
            
            NSNumber* albumID = dic[@"collectionId"];
            NSString* name = dic[@"collectionName"];
            NSString* artistName = dic[@"artistName"];
            NSString* thumbnail = dic[@"artworkUrl100"];
            
            MusicAlbum* album = [[MusicAlbum alloc] initWithAlbumID:albumID name:name artistName:artistName imageThumbnail:thumbnail];
            
            [albums addObject:album];
        }
        
        completion(albums);
        
    }];
}

- (void) fetchTracksWithAlbumID:(NSNumber *)albumID completion:(RequestTracksBlock)completion {
    
    NSString* url = [NSString stringWithFormat:@"https://itunes.apple.com/lookup?id=%@&entity=song", albumID];
    
    [self fetchDataWithURL:url completion:^(NSData* _Nullable data) {
        
        /// Serialise JSON
        NSError* error = nil;
        NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:&error];
        
        NSArray* tracksJSON = [jsonObject objectForKey:@"results"];
        
        /// Abort if there was an error
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        
        NSMutableArray<MusicTrack*>* tracks = [[NSMutableArray<MusicTrack*> alloc] init];
        
        for (NSDictionary* dic in tracksJSON) {
            
            if (![dic[@"wrapperType"]  isEqual: @"track"] || ![dic[@"kind"]  isEqual: @"song"]) {
                continue;
            }
            
            NSString* trackTitle = dic[@"trackName"];
            NSNumber* duration = dic[@"trackTimeMillis"];
            
            MusicTrack* track = [[MusicTrack alloc] initWithTitle:trackTitle duration:duration];
            
            [tracks addObject:track];
        }
        
        completion(tracks);
        
    }];
}

- (void) fetchDataWithURL:(NSString*) url
                   completion: (RequestCompletionBlock) requestCompletionBlock {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod: @"GET"];
    [request setURL:[NSURL URLWithString: url]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData* _Nullable data,
        NSURLResponse* _Nullable response,
        NSError* _Nullable error) {
          requestCompletionBlock(data);
      }] resume];
}

- (void)fetchImageWithURL:(NSString *)imageURL
               completion:(RequestImageBlock)completion {
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        
        NSURL* url = [NSURL URLWithString:imageURL];
        NSData* data = [NSData dataWithContentsOfURL: url];
        
        if (!data) {
            NSLog(@"Could not fetch image for URL: %@", imageURL);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(data);
        });

    });
}

@end
