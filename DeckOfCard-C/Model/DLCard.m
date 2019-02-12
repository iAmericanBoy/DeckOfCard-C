//
//  DLCard'.m
//  DeckOfCard-C
//
//  Created by Dominic Lanzillotta on 2/12/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLCard.h"

@implementation DLCard

- (instancetype)initWithSuit:(NSString *)suitName value:(NSString *)value imageURLAsString:(NSString *)url
{
    self = [super init];
    if(self) {
        _suit = suitName;
        _value = value;
        _imageURLAsString = url;
    }
    return self;
}

@end

@implementation DLCard  (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSString *name = dictionary[@"cards"][@"suit"];
    NSString *value = dictionary[@"cards"][@"value"];
    NSString *url = dictionary[@"cards"][@"image"];
    
    if(!name || !value || !url) {
        return nil;
    }

    return  [self initWithSuit:name value:value imageURLAsString:url];
}

@end
