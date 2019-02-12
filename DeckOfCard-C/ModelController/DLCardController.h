//
//  DLCardController.h
//  DeckOfCard-C
//
//  Created by Dominic Lanzillotta on 2/12/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLCard.h"
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface DLCardController : NSObject

+(void)fetchCardForOneCount:(NSString *)count
                      completion:(void (^_Nullable) (DLCard *_Nullable))completion;
+(void)fetchImageForCard:(DLCard *)card
                 completion:(void (^_Nullable) (UIImage *_Nullable))completion;

@end

NS_ASSUME_NONNULL_END
