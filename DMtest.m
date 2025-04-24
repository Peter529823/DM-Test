function dm=DMtest(y,f1,f2,useNW,useQuad)

%returns the Diebold Marianno test statistic 
% dm is the statistic, which is asymptotically N(0,1)
% y is actual forecasted variable
% f1, f2 are the two forecasts; dm > 0 favors f1
% useNW is either 1 <--> use NW stand error  or  0 <--> use usual
% lossfn is either 1 <--> squared  or  0 <--> abs value

if nargin<4, useNW=0; end
if nargin<5, useQuad=1; end
e1=y-f1;
e2=y-f2;
if useQuad==1, d=e2.^2-e1.^2; else d=abs(e2)-abs(e1); end
[b,tstat,nwtstat] = OLS(d,ones(size(d)),0);
dm=b/tstat;
if useNW==1, dm=nwtstat; end

