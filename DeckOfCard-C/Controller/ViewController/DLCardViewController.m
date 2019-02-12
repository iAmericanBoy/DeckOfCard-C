//
//  DLCardViewController.m
//  DeckOfCard-C
//
//  Created by Dominic Lanzillotta on 2/12/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLCardViewController.h"
#import "DLCardController.h"

@interface DLCardViewController ()

@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

@end

@implementation DLCardViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)drawCardButtonTapped:(UIButton *)sender {
    [DLCardController fetchCardForOneCount:@"1" completion:^(DLCard * _Nullable card) {
        if (card){
            [DLCardController fetchImageForCard:card completion:^(UIImage * _Nullable pic) {
                if (pic ) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.suitLabel.text = card.suit;
                        self.valueLabel.text = card.value;
                        self.cardImageView.image = pic;
                    });
                }
            }];
        }
    }];
}


@end
