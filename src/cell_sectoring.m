clc;
sir = input("Enter SIR value(in dB): ");
n = input("Enter value for path loss exponent(2-4): ");
i0 = [6 2 1];   %No. of interfering co-channel cells in the first ring for omnidirectional, 120 degree and 60 degree sectoring
Nmin = (((10 ^ (sir/10)) .* i0) .^ (2/n)) ./ 3;
disp("Minimum cluster size limits required for no sectoring, 120 degree and 60 degree sectoring are");
disp(Nmin);
N = [0 0 0];
for i = 1 : 3
    M = 0;
    while N(i) < Nmin(i)
        M = M + 1;
        for j = fix((M+1)/2) : M
            N(i) = j^2 + (M-j)^2 + j*(M-j);
            if N(i) >= Nmin(i)
                break
            end
        end
    end
end
disp("Minimum value of cluster sizes for no sectoring, 120 degree and 60 degree sectoring are");
disp(N);
ir = [N(1)/N(1) N(1)/N(2) N(2)/N(3)];
disp("Capacity improvement ratio for no sectoring, 120 degree and 60 degree sectoring are");
disp(ir);
[m,idx] = max(ir);
switch idx
    case 1
        disp("No sectoring is preferred");
    case 2
        disp("120 degree sectoring is preferred");
    case 3
        disp("60 degree sectoring is preferred");
end

