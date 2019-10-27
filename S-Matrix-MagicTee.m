clear all;
close all;
clc;
p=input('Enter no. of ports: ');    %4
isolated=input('Enter isolated ports matrix: ');   %[1,2;3,4]
input_ports=input('Enter input port numbers: ');   %[3,4]

s=rand(p);              
s=s*(1+1i);
disp('Randomly created S-matrix');
disp(s)

for i=1:size(input_ports,2)
    output_ports=input(sprintf('Enter outputs for input at port %d: ',input_ports(i)));    %output_ports=[1,2] or [1,-2]
    s(abs(output_ports(1)),input_ports(i))=sign(output_ports(2))*s(abs(output_ports(2)),input_ports(i));
end
disp('S-matrix after input-output relations')
disp(s)

matched=input('Enter matched ports numbers');      %[1,2,3,4]
for i=1:size(matched,2)   
    s(matched(i),matched(i))=0; %matched
end
disp('S-matrix after considering perfectly matched terminations')
disp(s)

if(isolated~=0)             %if ports are isolated
    for i=1:size(isolated,1)
        s(isolated(i,1),isolated(i,2))=0;
        s(isolated(i,2),isolated(i,1))=0;
    end
end
disp('S-matrix after considering perfectly isolated ports')
disp(s)

for i=1:p
    for j=i:p
        s(j,i)=s(i,j);
    end
end
disp('S-matrix after considering symmetry')
disp(s)

A = s + s';
[s,~] = qr(A);
for i=1:p
    for j=i:p
        s(j,i)=s(i,j);
    end
end

disp('Scattering matrix after unitary property');
disp(s);
