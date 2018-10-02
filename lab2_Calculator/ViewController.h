//
//  ViewController.h
//  lab2_Calculator
//
//  Created by Xiaochen Wang on 2018-10-01.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic) double number;
//@property (nonatomic) char oparation;
//@property (nonatomic) bool operatorPressed;
@property (weak, nonatomic) IBOutlet UILabel *Display;

-(void)pushItem:(double) number;
-(double) calculate: (NSString*) oparation;

- (IBAction)Oprator_Pressed:(id)sender;
- (IBAction)DigitPressed:(id)sender;
- (IBAction)Enter_Pressed:(id)sender;




//-(IBAction)DigitPressed:(id)sender;
//-(IBAction)Oprator_pressed:(id)sender;
//-(IBAction)Enter_pressed:(id)sender;

@end


