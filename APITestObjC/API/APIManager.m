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

- (void) fetchClientsWithCompletion:(requestClientsBlock)completion {
    NSString* url = @"http://localhost:8888/slimapp/public/api/clients";
    
    [self fetchDataWithBaseURL:url completion:^(NSData * data) {
        
        NSError* error = nil;
        NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:&error];
        
        NSArray* clientsJSON = [jsonObject objectForKey:@"clients"];
        
        if (error != nil) {
            NSLog(@"%@", error);
            return;
        }
        
        NSMutableArray<Client*>* clients = [[NSMutableArray<Client *> alloc] init];
        
        for (NSDictionary* dic in clientsJSON) {
            NSNumber* clientID = dic[@"id"];
            NSString* clientName = dic[@"name"];
            
            Client* client = [[Client alloc] initWithClientID: clientID
                                                   clientName:clientName];
            
            [clients addObject:client];
        }
        
        completion(clients);
        
    }];
}

- (void) fetchDataWithBaseURL:(NSString*) baseURL
                   completion: (requestCompletionBlock) requestCompletionBlock {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:baseURL]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error) {
          
          
          NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
          NSLog(@"Data received: %@", myString);
          requestCompletionBlock(data);
      }] resume];
}

@end
