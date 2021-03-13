faceDetector=vision.CascadeObjectDetector('FrontalFaceCART'); %Create a detector object
offset =1;
for a_iter=1:80

img=imread(sprintf('suprise (%d).png',offset)); %Read input image
 if (ndims(img) == 3) 
        img=rgb2gray(img); 

 end

%img=rgb2gray(img); % convert to gray

BB=step(faceDetector,img); % Detect faces

iimg = insertObjectAnnotation(img, 'rectangle', BB, 'Face'); %Annotate detected faces.

figure(1);
imshow(iimg); 
title('Detected face');




%htextinsface = vision.TextInserter('Text', 'face   : %2d', 'Location',  [5 2],'Font', 'Courier New','FontSize', 14);


%imshow(img);
hold on
for i=1:size(BB,1)
    rectangle('position',BB(i,:),'Linewidth',2,'Linestyle','-','Edgecolor','y');
end
hold on
N=size(BB,1);
handles.N=N;
counter=1;
for i=1:N
    face=imcrop(img,BB(i,:));
    savenam = strcat('C:\Users\BADHAN\Desktop\jaffedbase\64x64(CK+)' ,num2str(counter), '.jpg'); %this is where and what your image will be saved
    baseDir  = 'C:\Users\BADHAN\Desktop\jaffedbase\64x64(CK+)\suprise';
    %     baseName = 'image_';
    newName  = [baseDir num2str(counter) '.jpg'];
    handles.face=face;
    while exist(newName,'file')
        counter = counter + 1;
        newName = [baseDir num2str(counter) '.jpg'];
    end
    fac=imresize(face,[64,64]);
    imwrite(fac,newName);

figure(2);
imshow(face); 
title('crop pic');
   
    pause(.5);

end
offset=offset+1;
 end
