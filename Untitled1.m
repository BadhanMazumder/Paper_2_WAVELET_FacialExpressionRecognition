    k=imread('face1.jpg');
    GICimage=imadjust(k,[],[],0.3);
    imshow(GICimage);
    imwrite(GICimage,('emo2.png'));
    