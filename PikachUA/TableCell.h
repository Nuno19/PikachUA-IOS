//
//  TableCell.h
//  MapTest
//
//  Created by students@deti on 06/06/18.
//  Copyright © 2018 pikachua@ua.pt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *itemAmount;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;

- (void)displayContent:(UIImage*)image : (NSString*) label1 : (NSString*) label2 : (NSString*) total;


@end
