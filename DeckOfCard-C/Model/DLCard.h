//
//  DLCard'.h
//  DeckOfCard-C
//
//  Created by Dominic Lanzillotta on 2/12/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLCard : NSObject

@property(nonatomic,readonly,copy)NSString *suit;
@property(nonatomic,readonly,copy) NSString *value;
@property(nonatomic,readonly,copy) NSString *imageURLAsString;

-(instancetype)initWithSuit:(NSString *)suitName
                      value:(NSString *)value
           imageURLAsString:(NSString *)url;

@end

@interface DLCard  (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
