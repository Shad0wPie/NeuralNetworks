function pError = TheoreticalErrorProbability(p, N)

    fPart = erf(sqrt(N./(2*p)).*(1+(p-1)./N));
    pError = 0.5 * (1 - fPart);

end

