%clc;clear all;close all;
a=sim(network3,coif4);
    excelfile= 'Results_CK.xlsx';
    xlswrite(excelfile,a,'coif4','A1');
   