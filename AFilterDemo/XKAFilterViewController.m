//
//  ViewController.m
//  AFilterDemo
//
//  Created by mac_leruan on 16/8/29.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "XKAFilterViewController.h"
#import "XKAFilterManger.h"
#import "ColorMatrix.h"
#define imagName  @"dog.jpg"
@interface XKAFilterViewController ()<UIAlertViewDelegate>

/*ImageView*/
@property (strong, nonatomic) UIImageView *currentImageView;

/*segment*/
@property (strong, nonatomic) UISegmentedControl   *segment;

/*scrollerView  Image*/
@property (strong, nonatomic) UIScrollView *scrollerView;

/*redLine  ImageView*/
@property (strong, nonatomic) UIImageView *redlineImageView;


/*filterImage*/
@property (strong, nonatomic) UIImage *currentImage;
/*nameArray*/
@property (strong, nonatomic) NSArray *nameArray;




@end

@implementation XKAFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"滤镜";
    
    _currentImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height))];
    _currentImageView.backgroundColor = [UIColor redColor];

    _currentImageView.image = [UIImage imageNamed:imagName];
    
    _currentImageView.contentMode = UIViewContentModeScaleToFill;
    
    [self.view addSubview:_currentImageView];
    
        self.nameArray = [NSArray arrayWithObjects:@"原图",@"LOMO",@"黑白",@"复古",@"哥特",@"锐色",@"淡雅",@"酒红",@"青柠",@"浪漫",@"光晕",@"蓝调",@"梦幻",@"夜色",@"红",@"绿",@"蓝", nil];
    
    self.segment = [[UISegmentedControl alloc]initWithItems:self.nameArray];
    self.segment.segmentedControlStyle = UISegmentedControlStyleBar;//样式
    //    seg.momentary = YES;//点击后恢复原样
    self.segment.backgroundColor = [UIColor whiteColor];
    self.segment.frame = CGRectMake(0, 50, 640, 30);
    self.segment.tintColor = [UIColor blackColor];

    self.segment.userInteractionEnabled = YES;//关闭用户交互
    
    
    self.scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame) - 100, self.view.frame.size.width, 100)];
    self.scrollerView.backgroundColor = [UIColor clearColor];
    self.scrollerView.indicatorStyle = UIScrollViewIndicatorStyleBlack;//滚动条样式
    self.scrollerView.showsHorizontalScrollIndicator = YES;
    //显示横向滚动条
    self.scrollerView.showsVerticalScrollIndicator = NO;//关闭纵向滚动条
    self.scrollerView.bounces = NO;//取消反弹效果
    self.scrollerView.pagingEnabled = YES;//划一屏
    self.scrollerView.contentSize = CGSizeMake(640, 30);
    
    for(int i=0;i<14;i++)
    {
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10.3+46*i, 10, 25, 30)];
        UIImage *bgImage = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        bgImageView.image = bgImage;
//        [self.scrollerView addSubview:bgImageView];

        
    }
    
    [self.view addSubview:_scrollerView];
    
    [self.scrollerView addSubview:_segment];
    [_segment addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventValueChanged];


//    self.redlineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 45, 50)];
//
//    self.redlineImageView.image = [UIImage imageNamed:@"110.png"];
//    [self.scrollerView addSubview:_redlineImageView];

   
}
-(void)changeImage:(UISegmentedControl *)segment {

    XKAFilterManger *manager = [XKAFilterManger new];

    self.currentImage = [UIImage imageNamed:imagName];
    self.title = self.nameArray[segment.selectedSegmentIndex];
    if (_currentImageView.image == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请选择图片" delegate:self cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alert show];
    }else  {
        
        switch (segment.selectedSegmentIndex) {
            case 0:
            {
                _currentImageView.image = self.currentImage;

            }
                break;
            case 1:
            {
                 _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_lomo];

            }
                break;
            case 2:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_heibai];

            }
                break;
            case 3:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_huajiu];
                
            }
                break;
            case 4:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_gete];
            }
                break;
            case 5:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_ruise];
                
            }
                break;
            case 6:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_danya];

            }
                break;
            case 7:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_jiuhong];

            }
                break;
            case 8:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_qingning];

            }
                break;
            case 9:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_langman];

            }
                break;
            case 10:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_guangyun];

            }
                break;
            case 11:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_landiao];

            }
                break;
            case 12:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_menghuan];

            }
                break;
            case 13:
            {
                  _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_yese];

            }
                break;
            case 14:
            {
                _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_red];

            }
                break;
            case 15:
            {
                _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_GREEN];

            }
                break;
            case 16:
            {
                _currentImageView.image = [manager createImageWithImagePi:_currentImage andColorMatrix:colormatrix_BLUE];
            }
            default:
                break;
        }
        
    }
    


}

- (IBAction)btnClick:(id)sender {
    
    
    XKAFilterManger *manager = [XKAFilterManger new];
    
    _currentImageView.image = [manager createImageWithImagePi:[UIImage imageNamed:imagName] andColorMatrix:colormatrix_menghuan];
    

//    
//    
//    UIImageWriteToSavedPhotosAlbum(_currentImageView.image, nil, nil, nil);
//    
//    
//    float p[20];
//    printf("//\nconst float colormatrix_[] = {\n");
//    for (NSInteger i=0; i<_itemsArr.count; i++) {
//        
//        UITextField *textFiled = _itemsArr[i];
//        
//        if (textFiled.text.length>0) {
//            
//            p[i] = textFiled.text.floatValue;
//            
//            NSLog(@"像素 === %f",p[i]);
//            
//        }else{
//            
//            p[i] = 0.0f;
//        }
//        
//        
//        
//        if (i==19) {
//            
//            printf(" %.2f",p[i]);
//        }else{
//            printf(" %.2f,",p[i]);
//        }
//        
//        if ((i+1)%5==0) {
//            if (i!=19) {
//                printf("\n");
//                
//            }else{
//                
//            }
//            
//        }
//        
//    }
//    printf("\n};");
//    
    //    [manager clear];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
