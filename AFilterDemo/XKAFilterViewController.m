//
//  ViewController.m
//  AFilterDemo
//
//  Created by mac_leruan on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "XKAFilterViewController.h"
#import "XKAFilterManger.h"
#define imagName  @"img.jpg"
@interface XKAFilterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *row11;
@property (weak, nonatomic) IBOutlet UITextField *row12;

@property (weak, nonatomic) IBOutlet UITextField *row13;

@property (weak, nonatomic) IBOutlet UITextField *row14;

@property (weak, nonatomic) IBOutlet UITextField *row15;

@property (weak, nonatomic) IBOutlet UITextField *row21;

@property (weak, nonatomic) IBOutlet UITextField *row22;

@property (weak, nonatomic) IBOutlet UITextField *row23;

@property (weak, nonatomic) IBOutlet UITextField *row24;

@property (weak, nonatomic) IBOutlet UITextField *row25;

@property (weak, nonatomic) IBOutlet UITextField *row31;

@property (weak, nonatomic) IBOutlet UITextField *row32;

@property (weak, nonatomic) IBOutlet UITextField *row33;

@property (weak, nonatomic) IBOutlet UITextField *row34;

@property (weak, nonatomic) IBOutlet UITextField *row35;

@property (weak, nonatomic) IBOutlet UITextField *row41;

@property (weak, nonatomic) IBOutlet UITextField *row42;

@property (weak, nonatomic) IBOutlet UITextField *row43;

@property (weak, nonatomic) IBOutlet UITextField *row44;

@property (weak, nonatomic) IBOutlet UITextField *row45;

@property (weak, nonatomic) IBOutlet UIImageView *currentImageView;
@property (weak, nonatomic) IBOutlet UIImageView *curr;

@property (nonatomic,strong)NSArray * itemsArr;

@end

@implementation XKAFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itemsArr = @[_row11,_row12,_row13,_row14,_row15,
                  _row21,_row22,_row23,_row24,_row25,
                  _row31,_row32,_row33,_row34,_row35,
                  _row41,_row42,_row43,_row44,_row45
                  ];

    for (UITextField *field in _itemsArr) {
        
        field.delegate = self;
        
        field.layer.cornerRadius = 5;
        field.layer.borderColor = [UIColor blackColor].CGColor;
        field.layer.masksToBounds = YES;
        field.layer.borderWidth = 1.0;
        field.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        
    }
    
    _currentImageView.image = [UIImage imageNamed:imagName];
    
    _currentImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showImage) name:UITextFieldTextDidChangeNotification object:nil];

}
- (void)showImage{
    
    
    float p[20];
    
    for (NSInteger i=0; i<_itemsArr.count; i++) {
        
        UITextField *textFiled = _itemsArr[i];
        
        
        if (textFiled.text.length>0) {
            
            p[i] = textFiled.text.floatValue;
        }else{
            
            p[i] = 0.0f;
        }
    }
    
    
    
    
    
    
 XKAFilterManger *manager = [XKAFilterManger new];
    
    _currentImageView.image = [manager createImageWithImagePi:[UIImage imageNamed:imagName] andColorMatrix:p];
    
}

- (IBAction)btnClick:(id)sender {
    
    
    UIImageWriteToSavedPhotosAlbum(_currentImageView.image, nil, nil, nil);
    
    
    float p[20];
    printf("//\nconst float colormatrix_[] = {\n");
    for (NSInteger i=0; i<_itemsArr.count; i++) {
        
        UITextField *textFiled = _itemsArr[i];
        
        if (textFiled.text.length>0) {
            
            p[i] = textFiled.text.floatValue;
            
            NSLog(@"像素 === %f",p[i]);
            
        }else{
            
            p[i] = 0.0f;
        }
        
        
        
        if (i==19) {
            
            printf(" %.2f",p[i]);
        }else{
            printf(" %.2f,",p[i]);
        }
        
        if ((i+1)%5==0) {
            if (i!=19) {
                printf("\n");
                
            }else{
                
            }
            
        }
        
    }
    printf("\n};");
    
    //    [manager clear];
    
    
}
-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    
    self.view.frame = CGRectMake(0, -_row11.frame.size.height * 7, self.view.frame.size.width, self.view.frame.size.height);
    

}

/**
 结束编辑UITextField的方法，让原来的界面还原高度
 */
-(void) textFieldDidEndEditing:(UITextField *)textField
{
    
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (UITextField *field in _itemsArr) {
        
        [field resignFirstResponder];
        
    }
    
}



@end
