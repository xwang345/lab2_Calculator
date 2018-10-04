//
//  ViewController.m
//  lab2_Calculator
//
//  Created by Xiaochen Wang on 2018-10-01.
//  Copyright © 2018 Xiaochen Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *items;
@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (void) pushItem:(double)number{
    if(_items==nil){
        _items = [[NSMutableArray alloc]init];
    }else{
        [self.items addObject:[NSNumber numberWithDouble:number]];
    }
}

-(double) calculate:(NSString *)operand{
    if ([operand isEqualToString: @"+"]) {
        NSLog(@"2222222222222%f",[self popItem] + [self popItem]);
        return 0;
    }else if([operand isEqualToString: @"-"]){
        return [self popItem] - [self popItem];
    }else if([operand isEqualToString: @"/"]) {
        return [self popItem] / [self popItem];
    }else if([operand isEqualToString: @"*"]){
        return [self popItem] * [self popItem];
    } else {
        return 0;
    }
}

- (IBAction)Oprator_pressed:(id)sender {
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
    NSString *operandString =[someButton titleForState:UIControlStateNormal];
//    NSLog(@"------------------%f",[self calculate:operandString]);
    [self calculate:operandString];
}

- (IBAction)DigitPressed:(id)sender {
    NSString *numString = ((UIButton*)sender).titleLabel.text;
    NSString *mainLabelString = _Display.text;
    
    _Display.text = [mainLabelString stringByAppendingFormat:@"%@", numString];
}

- (IBAction)Enter_Pressed:(id)sender {
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *numTemp = [numberFormatter numberFromString: _Display.text];
    [self pushItem:[numTemp doubleValue]];
    _Display.text = @"";
}

-(double) popItem{
    NSNumber *nsLastNum = [self.items lastObject];
    [self.items removeLastObject];
    
    return [nsLastNum doubleValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
