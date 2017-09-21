function [ energy ] = CalculateEnergy( zeta, output )
%CalculateEnergy: calculates the error of the output(output) compared to the
%target(zeta)
    errorSquared = (zeta - output).^2;
    energy = 0.5 * sum(errorSquared);

end