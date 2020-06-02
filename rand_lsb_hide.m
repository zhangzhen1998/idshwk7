function [ste_cover,len_total]=rand_lsb_hide(input,file,output,key)
cover=imread(input);
ste_cover=cover;
ste_cover=double(ste_cover); 
f_id=fopen(file,'r');
[msg,len_total]=fread(f_id,'ubit1');
[m,n]=size(ste_cover);
if len_total>m*n
  error('Ƕ����Ϣ������������ѡ��ͼ��');
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
%��ʾʵ����
subplot(1,2,1);imshow(cover);title('ԭʼͼ��');
subplot(1,2,2);imshow(output);title('������Ϣ��ͼ��');
