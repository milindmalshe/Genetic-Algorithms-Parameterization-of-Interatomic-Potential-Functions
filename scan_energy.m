%for scanning Energy

clear();
clc();

%no of files to be scanned
file_total=101;
%file name
file_inp='O3_UMP4_form';
%output file
file_out=sprintf('%s_fmt.dat',file_inp);
fod=fopen(file_out,'w');
r=4.0;
theta=116.8;

for file_no=1:1:file_total
    position=0;
    file_open=sprintf('%s_%d.log',file_inp,file_no);
    fid=fopen(file_open,'r');   
    side=sqrt(1.2^2+r^2-2*1.2*r*cos(theta*3.14/180.0));
    while 1
        tline = fgets(fid);
        if ~ischar(tline),   break,   end

        disp(tline)
    %     length(tline);
        position=position+length(tline);
        if strfind(tline,'UMP4(SDQ)=')
    %     if strmatch(tline,'UMP4(SDQ)')
            disp('gotcha')
            fseek(fid,position-19,'bof');
            data=fscanf(fid,'%s',1);
            str=strrep(data,'D+','E+');
            fprintf(fod,'%s\t%f\t%f\t%f\t%s\n',file_open,1.2,r,side,str);
            break;
    %         A=strread(tline);
        end
    end
    r=r-(4.0-1.2)/(file_total-1);
fclose(fid);
end

fclose(fod);