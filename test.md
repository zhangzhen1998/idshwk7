我采用的是LSB信息隐藏方法，在信息隐藏与数字水印中我就进行了这个实验，采用的代码是matlab。
test_gray.bmp是我的原始图像，scover_gray.bmp是我隐藏了我的学号和姓名的图片。
隐藏信息的流程：读入原始图像并转化成二进制，读入要隐藏的信息，并转化为二进制，判断嵌入信息是否过大，调用随机间隔函数选取像素点，在LSB位置隐藏信息，生成隐藏信息后的图像。
提取信息的流程：读入隐藏信息图像并转化成二进制，创建用于写入信息的文件，判断嵌入信息是否过大，调用随机间隔函数选取像素点，获取隐藏信息，将隐藏信息写入文件。
rand_lsb_hide.m为隐藏信息，rand_lsb_get.m为提取信息，randinterval.m为随机函数。
