
% Size, the filter size
% Ratio: the ratio between frequency and the span of Gaussian
function [g, num] = GenerateFilters_3D( Size, Ratio)

% gama = yita = ratio * sqrt(2)
% sigma = ratio/F0;

if nargin<2
    Btheta = pi/4;
    Ratio =  sqrt(2*log(2))/(2*pi*tan(Btheta/2));
end
Fmax = 1/4;
Fspace = 2;
Ori_space = pi/4;
NumFreqs = 4;
NumOris = 4;
counter = 0;
for i=0:NumFreqs-1
    F = Fmax/(Fspace^i);
    for j=0:NumOris-1
        Theta = Ori_space*j;  
        for k=0:NumOris-1
            Phi = Ori_space*k;
            counter = counter + 1;
            %function g = gfcreatefilter_3D( F0, theta, phi, ratio, size )
            g{counter} = gfcreatefilter_3D( F, Theta, Phi, Ratio, Size);    
            % if theta =0, the values of Phi doesn't matter
            if (Theta == 0)
                break;
            end
        end
    end
end
num = counter;