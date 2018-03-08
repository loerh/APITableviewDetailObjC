//
//  ViewController.m
//  APITestObjC
//
//  Created by Laurent Meert on 08/03/2018.
//  Copyright © 2018 Laurent Meert. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *clientsTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clients = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
    APIManager* manager = [APIManager sharedInstance];
    [manager fetchClientsWithCompletion:^(NSMutableArray<Client *> * clients) {
        for (Client* client in clients) {
            NSLog(@":::client:::");
            NSLog(@"%@", client.clientName);
            NSLog(@"%@", client.clientID);
            NSLog(@"::::::::::::");
        }
        
        [self.clients addObjectsFromArray:clients];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.clientsTableView reloadData];
        });
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ClientCell"];
    Client* client = self.clients[indexPath.row];
    [[cell textLabel] setText:client.clientName];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.clients.count;
}

@end
