close all;
clear all;
clc;
each_sample = 25000;
AngerTr = []; AngerTe = [];
BoredomTr = []; BoredomTe = [];
DisgustTr = []; DisgustTe = [];
FearTr = []; FearTe = [];
HappyTr = []; HappyTe = [];
NeutralTr = []; NeutralTe = [];
SadTr = []; SadTe = [];
TrainSet = [];
TestSet = [];
paths = 'MAT_data/';
fileList = dir(fullfile(paths, '*.mat'));

%*************************************************************************%
for Kfi=1:numel(fileList)
    [pathstr,name,ext] =fileparts(fullfile(paths, fileList(Kfi).name));
    load(fullfile(paths, fileList(Kfi).name))
    if name == "anger"
        data = anger_audios;
        emotion = 1;
        subTr = AngerTr;
        subTe = AngerTe;
    elseif name == "boredom"
        data = boredom_audios;
        emotion = 2;
        subTr = BoredomTr;
        subTe = BoredomTe;
    elseif name == "disgust"
        data = disgust_audios;
        emotion = 3;
        subTr = DisgustTr;
        subTe = DisgustTe;
    elseif name == "fear"
        data = fear_audios;
        emotion = 4;
        subTr = FearTr;
        subTe = FearTe;
    elseif name == "happy"
        data = happy_audios;
        emotion = 5;
        subTr = HappyTr;
        subTe = HappyTe;
    elseif name == "neutral"
        data = neutral_audios;
        emotion = 6;
        subTr = NeutralTr;
        subTe = NeutralTe;
    elseif name == "sad"
        data = sad_audios;
        emotion = 7;
        subTr = SadTr;
        subTe = SadTe;
    end    
    total_samples = length(data);

%*************************************************************************%
%%% Training
    dstTr = 250;
    for i=1:total_samples
        sample = data{i,1};
        sample_length = length(sample);

        for j = 1:dstTr:sample_length
            % Check window size and length of sample
            if (j+each_sample-1) > sample_length
                break
            end
            X = sample(:, j:j+each_sample-1); 
            X1 =Cal9features(X);
            Xd1 = diff(X);
            X2 = Cal9features(Xd1);
            Xd2 = diff(Xd1);
            X3 = Cal9features(Xd2);
            subTr = [subTr; X1, X2, X3, emotion]; 
        end
    end
    TrainSet = [TrainSet; subTr];
    

%*************************************************************************%
%%% Testing
    for i=1:total_samples
        sample = data{i,1};
        sample_length = length(sample);
        % dstTe=randi([8, 15], 1)*dstTr;
        dstTe = randi([250, 1000], 1);
        for j = 1:dstTe:sample_length
            % Check window size and length of sample
            if (j+each_sample-1) > sample_length
                break
            end
            X = sample(:, j:j+each_sample-1); 
            X1 =Cal9features(X);
            Xd1 = diff(X);
            X2 = Cal9features(Xd1);
            Xd2 = diff(Xd1);
            X3 = Cal9features(Xd2);
            subTe = [subTe; X1, X2, X3, emotion]; 
            % dstTe=randi([8, 15], 1)*dstTr; 
            dstTe = randi([250, 1000], 1);
        end
    end
    TestSet = [TestSet; subTe];
end

%*************************************************************************%
TrainSet = TrainSet(any(~isinf(TrainSet), 2), :);
TrainSet = TrainSet(any(~isnan(TrainSet), 2), :);
TrainSet = TrainSet(all(isfinite(TrainSet),2),:);
TrainSet = double(TrainSet);

TestSet = TestSet(any(~isinf(TestSet), 2), :);
TestSet = TestSet(any(~isnan(TestSet), 2), :);
TestSet = TestSet(all(isfinite(TestSet),2),:);
TestSet = double(TestSet);

%%% Save matrices
save('TrainSet.mat', 'TrainSet');
save('TestSet.mat', 'TestSet');
