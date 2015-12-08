% Forest


t1= tr(:,1:26);
t2 = tr(:,29);
t =  val;
% t = te;
t3 = t(:,1:26);


forest = fitForest(t1,t2,'randomFeatures',3,'bagSize',1/3);
yhat = predictForest(forest,t3);
error = mse(ytest,yhat)

