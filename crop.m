offset =1;
for a_iter=1:214
k=imread(sprintf('emo1 (%d).jpg',offset));
    k1=imresize(k,[64,64]);
    imwrite(k1,sprintf('emo (%d).jpg',offset));
    offset=offset+1;
end