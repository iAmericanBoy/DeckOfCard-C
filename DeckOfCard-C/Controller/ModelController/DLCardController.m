//
//  DLCardController.m
//  DeckOfCard-C
//
//  Created by Dominic Lanzillotta on 2/12/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLCardController.h"

static NSString * const baseURlString = @"https://deckofcardsapi.com/api/deck/new/draw/";

@implementation DLCardController
+ (void)fetchCardForOneCount:(NSString *)count completion:(void (^)(DLCard * _Nullable))completion
{
    NSURL *baseURL = [[NSURL alloc]initWithString:baseURlString];
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *countQuery = [NSURLQueryItem queryItemWithName:@"count" value: count];
    components.queryItems = @[countQuery];
    
    NSURL *searchURL = components.URL;
    NSLog(@"%@", searchURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an Error in %s :%@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return ;
        }
        if (response) {
            NSLog(@"%@",response);
        }
        
        if (data) {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options: 0 error:&error];
            if (!topLevelDictionary) {
                NSLog(@"error parsing the JSON %@", error);
                completion(nil);
                return;
            }
            DLCard *card = [[DLCard alloc] initWithDictionary:topLevelDictionary];
            NSLog(@"%@", card.value);
            completion(card);
        }
    }] resume];
}

+ (void)fetchImageForCard:(DLCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:card.imageURLAsString];
    NSLog(@"%@",baseURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an Error in %s :%@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return ;
        }
        if (response) {
            NSLog(@"%@",response);
        }
        
        if (data) {
            UIImage *cardpic = [[UIImage alloc] initWithData:data scale:1];
            completion(cardpic);
        }
    }] resume];
}

@end
