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

//-(void)viewDidLoad{
//    [super viewDidLoad];
//    operatorPressed = FALSE;
//    firstEntry = NULL;
//    secondEntry = NULL;
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
////    operatorPressed = FALSE;
//}

-(void) pushItem:(double)number{
    if(_items==nil){
        _items = [[NSMutableArray alloc]init];
    }else{
        [self.items addObject:[NSNumber numberWithDouble:number]];
    }
}

-(double) calculate:(NSString *)oparation{
    if ([oparation isEqualToString: @"+"]) {
        return [self popItem] + [self popItem];
    }else if([oparation isEqualToString: @"-"]){
        return [self popItem] - [self popItem];
    }else if([oparation isEqualToString: @"/"]) {
        return [self popItem] / [self popItem];
    }else if([oparation isEqualToString: @"*"]){
        return [self popItem] * [self popItem];
    } else {
        return 0;
    }
}

- (IBAction)Oprator_Pressed:(id)sender {
}

- (IBAction)DigitPressed:(id)sender {
}

- (IBAction)Enter_Pressed:(id)sender {
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
