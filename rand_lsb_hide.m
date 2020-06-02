function [ste_cover,len_total]=rand_lsb_hide(input,file,output,key)
cover=imread(input);
ste_cover=cover;
ste_cover=double(ste_cover); 
f_id=fopen(file,'r');
[msg,len_total]=fread(f_id,'ubit1');
[m,n]=size(ste_cover);
if len_total>m*n
  error('嵌入信息量过大，请重新选择图像');
end
p=1;
[row,col]=randinterval(ste_cover,len_total,key);
for i=1:len_total
    ste_cover(row(i),col(i))=ste_cover(row(i),col(i))-mod(ste_cover(row(i),col(i)),2)+msg(p,1);
    if p==len_total
        break;
    end
    p=p+1;
end
ste_cover=uint8(ste_cover);
imwrite(ste_cover,output);
%显示实验结果
subplot(1,2,1);imshow(cover);title('原始图像');
subplot(1,2,2);imshow(output);title('隐藏信息的图像');
