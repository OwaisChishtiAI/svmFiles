function y = preProcess(Y)
  y = (Y==0);
  y = ~y;
  y = double(y)
end
