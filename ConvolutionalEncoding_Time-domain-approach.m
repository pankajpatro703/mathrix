clear all;
clc;
g=input('Enter generator sequences: ');
lg=size(g,2);
tg=size(g,1);
m=input('Enter message signal: ');
lm=size(m,2);
x=zeros(tg,lm+lg-1);
for i=1:(lm+lg-1)
      n=zeros(1,lg);
      for j=1:lg
          if(((i-j+1)<=0) || ((i-j+1)>lm))
               n(j)=0;
          else
               n(j)=m(i-j+1);
          end
          for k=1:tg   
               x(k,i)=mod((x(k,i)+g(k,j)*n(j)),2);
          end
      end 
end
x=fliplr(x);
disp('x=');
disp(x);
y=zeros(1,tg*(lm+lg-1));
k=1;
for i=1:tg:(tg*(lm+lg-1))
      for p=0:tg-1
          y(i+p)=x(p+1,k);
      end
      k=k+1;
end
disp('Encoded signal:');
disp(y);
disp('No. of bits required to represent 1 bit of message:');
disp(tg);
