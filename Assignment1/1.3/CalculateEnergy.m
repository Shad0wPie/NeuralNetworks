function [ energy ] = CalculateEnergy( zeta, output )
%CalculateEnergy: calculates the error of the output(output) compared to the
%target(zeta)
    energy = 0;
    for i=1:length(output)
        energy = energy + 1/2*(zeta(i)-output(i))^2;
    end

end

