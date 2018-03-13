//
//  ViewController.m
//  APITestObjC
//
//  Created by Laurent Meert on 08/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/// The table view holding the 
@property (weak, nonatomic) IBOutlet UITableView *albumsTableView;

@end

@implementation ViewController

int selectedRow;

#pragma mark - Application Lifecyle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// Initialise albums
    self.albums = [[NSMutableArray alloc] init];
    self.albumsTableView.allowsSelection = YES;
    
    /// Fetch albums using API manager
    APIManager* manager = [APIManager sharedInstance];
    [manager fetchAlbumsWithCompletion:^(NSMutableArray<MusicAlbum *> * albums) {
        
        /// Replace albums with freshly fetched data
        self.albums = albums;
        
        /// Reload tableview
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.albumsTableView reloadData];
        });
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (!self.selectedRow) {
        return;
    }
    
    DetailViewController* detailVC = [segue destinationViewController];
    detailVC.musicAlbum = self.albums[self.selectedRow.integerValue];
}

#pragma mark - Tableview Datasource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MusicAlbumTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MusicAlbumCell"];
    
    MusicAlbum* album = self.albums[indexPath.row];
    
    [cell setupWithMusicAlbum: album];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedRow = [[NSNumber alloc] initWithInteger:indexPath.row];
    [self performSegueWithIdentifier:@"detail" sender:self];
}

@end
