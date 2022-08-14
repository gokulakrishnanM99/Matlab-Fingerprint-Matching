clc;
clear all;
close all;
[a b]=uigetfile('*.*');
c=strcat(b,a);
d=imread(c);
[a2 b2]=uigetfile('*.*');
c2=strcat(b2,a2);
d2=imread(c2);

e=rgb2gray(d)
v1=imadjust(e)
subplot(2,2,1);
imshow(v1);
title("Enhanced Image - 1");
r=edge(v1,'sobel');
subplot(2,2,2);
imshow(r);
title("Edge detection - 1");
k=imresize(r,[500,500])

e2=rgb2gray(d2)
v2=imadjust(e2)
subplot(2,2,3);
imshow(v2);
title("Enhanced Image - 2");
r1=edge(v2,'sobel');
subplot(2,2,4);
imshow(r1);
title("Edge detection - 2");
sgtitle('Fingerprint Matching') 
k1=imresize(r1,[500,500])
m=0;
t=0;
for i=1:500
    for j=1:500
       if k(i,j)==1
           t=t+1;
       end
    end
end
for p=1:500
    for q=1:500
       if k(p,q)==1 && k1(p,q)==1
           m=m+1;
       end
    end
end
l=(m/t)*100;
disp("Percentage matching: ")
disp(l);
if l>90
    disp('Fingerprint is matching')
else
    disp('Fingerprint is not matching')
end
