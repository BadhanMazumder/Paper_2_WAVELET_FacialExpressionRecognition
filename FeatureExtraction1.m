clc;
close all;
%----------------------------------------ReadImage-----------------------------------
offset =1;
for a_iter=1:400
k=imread(sprintf('ck (%d).jpg',offset));

%--------------------------------Gamma Intensity Correction------------------------------

GICimage=imadjust(k,[],[],0.3);
imshow(GICimage)


%----------------------------------------WaveletDecomposition-------------------------------

[c,s]=wavedec2(GICimage,6,'db4');
%level-1
[H1,V1,D1] = detcoef2('all',c,s,1);
A1 = appcoef2(c,s,'db4',1);
%level-2
[H2,V2,D2] = detcoef2('all',c,s,2);
A2 = appcoef2(c,s,'db4',2);
%level-3
[H3,V3,D3] = detcoef2('all',c,s,3);
A3 = appcoef2(c,s,'db4',3);
%level-4
[H4,V4,D4] = detcoef2('all',c,s,4);
A4 = appcoef2(c,s,'db4',4);
%figure,
%subplot(4,3,1),imshow(H1);title('HL1');subplot(4,3,2),imshow(V1);title('LH1');subplot(4,3,3),imshow(D1);title('HH1');
%subplot(4,3,4),imshow(H2);title('HL2');subplot(4,3,5),imshow(V2);title('LH2');subplot(4,3,6),imshow(D2);title('HH2');
%subplot(4,3,7),imshow(H3);title('HL3');subplot(4,3,8),imshow(V3);title('LH3');subplot(4,3,9),imshow(D3);title('HH3');
%subplot(4,3,10),imshow(H4);title('HL4');subplot(4,3,11),imshow(V4);title('LH4');subplot(4,3,12),imshow(D4);title('HH4');

%------------------------------------------------Entropy Features-----------------------------------
%ShanonEntropy
%Level1 
SE_H1=wentropy(H1,'shannon');%SE_RH1=ShanonEntropyHorizontal_1
SE_V1=wentropy(V1,'shannon');
SE_D1=wentropy(D1,'shannon');
%Level2
SE_H2=wentropy(H2,'shannon');%SE_RH1=ShanonEntropyHorizontal_2
SE_V2=wentropy(V2,'shannon');
SE_D2=wentropy(D2,'shannon');
%Level3
SE_H3=wentropy(H3,'shannon');%SE_RH1=ShanonEntropyHorizontal_3
SE_V3=wentropy(V3,'shannon');
SE_D3=wentropy(D3,'shannon');
%Level4
SE_H4=wentropy(H4,'shannon');%SE_RH1=ShanonEntropyHorizontal_4
SE_V4=wentropy(V4,'shannon');
SE_D4=wentropy(D4,'shannon');

%ThresholdEntropy 
%Level1
ThE_H1=wentropy(H1,'threshold',0.5);%ThE_RH1=ThresholdEntropyHorizontal_1
ThE_V1=wentropy(V1,'threshold',0.5);
ThE_D1=wentropy(D1,'threshold',0.5);
%Level2
ThE_H2=wentropy(H2,'threshold',0.5);%ThE_RH1=ThresholdEntropyHorizontal_2
ThE_V2=wentropy(V2,'threshold',0.5);
ThE_D2=wentropy(D2,'threshold',0.5);
%Level3
ThE_H3=wentropy(H3,'threshold',0.5);%ThE_RH1=ThresholdEntropyHorizontal_3
ThE_V3=wentropy(V3,'threshold',0.5);
ThE_D3=wentropy(D3,'threshold',0.5);
%Level4
ThE_H4=wentropy(H4,'threshold',0.5);%ThE_RH1=ThresholdEntropyHorizontal_4
ThE_V4=wentropy(V4,'threshold',0.5);
ThE_D4=wentropy(D4,'threshold',0.5);


TestingDataSet1 = [SE_H1,SE_V1,SE_D1,SE_H2,SE_V2,SE_D2,SE_H3,SE_V3,SE_D3,SE_H4,SE_V4,SE_D4,ThE_H1,ThE_V1,ThE_D1,ThE_H2,ThE_V2,ThE_D2,ThE_H3,ThE_V3,ThE_D3,ThE_H4,ThE_V4,ThE_D4];
    excelfile= 'CK+_Features1.xlsx';
    xlswrite(excelfile,TestingDataSet1,'db4',sprintf('A%d',offset));
    
    offset=offset+1;
end