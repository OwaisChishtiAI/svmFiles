function [final] = Main(data)
X = data(:,[1:70]);
Xtrain = data([1:70], [1:70]);
Xtest = data([70:86],[1:70]);
Y = data(:,[71]);
y = (Y==0);
y = ~y;
y = double(y);
Ytrain = y([1:70]);
Ytest = y([70:86]);
C = 1; sigma = 0.1;
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
out = svmPredict(model, Xtest);
compare = [Ytest out];
disp("Ytest,   Ypred")
disp(compare);
final.X = X;
final.y = y;
final.Ytest = Ytest;
final.params = model;
final.predictions = out;
plotData(Xtrain, Ytrain);
end;
