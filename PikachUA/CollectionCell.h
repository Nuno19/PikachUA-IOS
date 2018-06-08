//
//  CollectionCell.h
//  MapTest
//
//  Created by students@deti on 02/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *pokemonName;
@property (weak, nonatomic) IBOutlet UIImageView *pokemonImage;
@property (weak, nonatomic) IBOutlet UILabel *pokemonValue;

- (void)displayContent:(UIImage*)image : (NSString*) label : (NSString*) label2;


@end
