close all;
clear all;
clc;
load('TrainSet.mat')
load('TestSet.mat')
X_train = TrainSet(:,1:27); Y_train = TrainSet(:, 28);
X_test = TestSet(:,1:27); Y_test = TestSet(:, 28);

Classes = [];
for i=1:length(Y_train)
    if Y_train(i) == 1
        Classes = [Classes; 1 0 0 0 0 0 0];
    elseif Y_train(i) == 2
        Classes = [Classes; 0 1 0 0 0 0 0];
    elseif Y_train(i) == 3
        Classes = [Classes; 0 0 1 0 0 0 0];
    elseif Y_train(i) == 4
        Classes = [Classes; 0 0 0 1 0 0 0];
    elseif Y_train(i) == 5
        Classes = [Classes; 0 0 0 0 1 0 0];
    elseif Y_train(i) == 6
        Classes = [Classes; 0 0 0 0 0 1 0];
    elseif Y_train(i) == 7
        Classes = [Classes; 0 0 0 0 0 0 1];
    end
end

YClasses = [];
for i=1:length(Y_test)
    if Y_test(i) == 1
        YClasses = [YClasses; 1 0 0 0 0 0 0];
    elseif Y_test(i) == 2
        YClasses = [YClasses; 0 1 0 0 0 0 0];
    elseif Y_test(i) == 3
        YClasses = [YClasses; 0 0 1 0 0 0 0];
    elseif Y_test(i) == 4
        YClasses = [YClasses; 0 0 0 1 0 0 0];
    elseif Y_test(i) == 5
        YClasses = [YClasses; 0 0 0 0 1 0 0];
    elseif Y_test(i) == 6
        YClasses = [YClasses; 0 0 0 0 0 1 0];
    elseif Y_test(i) == 7
        YClasses = [YClasses; 0 0 0 0 0 0 1];
    end
end

net = patternnet([32, 64, 64, 32, 16], 'trainscg', 'crossentropy');

net = configure(net, X_train', Classes');

net = init(net);

net.trainParam.epochs = 3000;

net = train(net, X_train', Classes');

view(net);

y = net(X_test');

figure(1);
plotconfusion(YClasses',y);

figure(2);
plotroc(YClasses',y);