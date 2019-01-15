
%O3 cluster generation 
%%
clear(); clc();
% [fid, message] = fopen('O2_com.dat','w');
% [fid, message] = fopen('O2_com_p.dat','w');
[fid, message] = fopen('O3_UMP4_com.dat','w');
% O2--------O3
% | theta
% |
% |
% O1

r=1.28;
theta=130.0;
character='%';
% for i=1:1:125
for i=1:1:101
    
    [s, errmsg] = sprintf('O3_UMP4_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  1\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    theta=theta-(130-116.8)/100;
    
end
% O3
% |
% |
% O2
% | 116.8
% |
% |
% O1

r=1.28;
theta=116.8;
character='%';
% for i=1:1:125
for i=102:1:202
    
    [s, errmsg] = sprintf('O3_UMP4_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  1\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    r=r+(4.0-1.28)/100;
    
end


fclose(fid);

%%
[fid, message] = fopen('O3_UMP4_d_com.dat','w');
% O2--------O3
% | theta
% |
% |
% O1

r=1.28;
theta=130.0;
character='%';
% for i=1:1:125
for i=1:1:101
    
    [s, errmsg] = sprintf('O3_UMP4_d_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  2\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    theta=theta-(130-116.8)/100;
    
end
% O3
% |
% |
% O2
% | 116.8
% |
% |
% O1

r=1.28;
theta=116.8;
character='%';
% for i=1:1:125
for i=102:1:202
    
    [s, errmsg] = sprintf('O3_UMP4_d_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  2\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    r=r+(4.0-1.28)/100;
    
end


fclose(fid);





%%

[fid, message] = fopen('O3_UMP4_s_com.dat','w');
% O3
% |
% |
% O2
% | 116.8
% |
% |
% O1

r=1.28;
theta=116.8;
character='%';
% for i=1:1:125
for i=1:1:101
    
    [s, errmsg] = sprintf('O3_UMP4_s_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  7\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    r=r+(4.0-1.28)/100;
    
end


fclose(fid);

%%
[fid, message] = fopen('O3_UMP4_t_com.dat','w');
% O2--------O3
% | theta
% |
% |
% O1

r=1.28;
theta=130.0;
character='%';
% for i=1:1:125
for i=1:1:101
    
    [s, errmsg] = sprintf('O3_UMP4_t_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  3\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    theta=theta-(130-116.8)/100;
    
end
% O3
% |
% |
% O2
% | 116.8
% |
% |
% O1

r=1.28;
theta=116.8;
character='%';
% for i=1:1:125
for i=102:1:202
    
    [s, errmsg] = sprintf('O3_UMP4_t_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  3\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    r=r+(4.0-1.28)/100;
    
end


fclose(fid);


%%
[fid, message] = fopen('O3_UMP4_p_com.dat','w');
% O2--------O3
% | theta
% |
% |
% O1

r=1.28;
theta=130.0;
character='%';
% for i=1:1:125
for i=1:1:101
    
    [s, errmsg] = sprintf('O3_UMP4_p_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  5\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    theta=theta-(130-116.8)/100;
    
end
% O3
% |
% |
% O2
% | 116.8
% |
% |
% O1

r=1.28;
theta=116.8;
character='%';
% for i=1:1:125
for i=102:1:202
    
    [s, errmsg] = sprintf('O3_UMP4_p_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  3\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',r);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    r=r+(4.0-1.28)/100;
    
end


fclose(fid);
%%
clear(); clc();
[fid, message] = fopen('O3_UMP4_form_com.dat','w');
% O2<--------O3
% | 116.8
% |
% |
% O1

r=4.0;
theta=116.8;
character='%';
% for i=1:1:125
for i=1:1:101
    
    [s, errmsg] = sprintf('O3_UMP4_form_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  1\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',1.2);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    r=r-(4.0-1.2)/100;
    
end


fclose(fid);
%%
clear(); clc();
[fid, message] = fopen('O3_UMP4_form_t_com.dat','w');
% O2<--------O3
% | 116.8
% |
% |
% O1

r=4.0;
theta=116.8;
character='%';
% for i=1:1:125
for i=1:1:101
    
    [s, errmsg] = sprintf('O3_UMP4_form_t_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  3\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',1.2);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    r=r-(4.0-1.2)/100;
    
end


fclose(fid);

%%
clear(); clc();
[fid, message] = fopen('O3_UMP4_form_p_com.dat','w');
% O2<--------O3
% | 116.8
% |
% |
% O1

r=4.0;
theta=116.8;
character='%';
% for i=1:1:125
for i=1:1:101
    
    [s, errmsg] = sprintf('O3_UMP4_form_p_%d.log',i);
    count=fprintf(fid,'g03 <<END > %s\n',s);
    fprintf(fid,'%cMEM=200MB\n',character);
    fprintf(fid,'#UMP4(SDQ)/6-31G**\n\n');
%     fprintf(fid,'O2\n\n0  1\n');
    fprintf(fid,'O3\n\n0  5\n');%_1
    fprintf(fid,'O2\nO1 O2 %.3f\n',1.2);
    fprintf(fid,'O3 O2 %.3f O1 %.3f\n\n',r, theta);
    fprintf(fid,'END\n\n');  
    r=r-(4.0-1.2)/100;
    
end


fclose(fid);