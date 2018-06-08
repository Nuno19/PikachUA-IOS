//
//  TableCellTableViewCell.h
//  MapTest
//
//  Created by students@deti on 06/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *pokemonName;
@property (weak, nonatomic) IBOutlet UIImageView *pokemonImage;

- (void)displayContent:(UIImage*)image : (NSString*) label;

@end
