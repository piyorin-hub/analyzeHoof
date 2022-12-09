function [varargout] = fun_dif_6(pos,varargin)
%1������C2��������Ƃ�
%varargout=[dif1,dif2] varargin �T���v�����O���g��
%%%%%%%%%%%%%%%% 5�_���� %%%%%%%%%%%%%%%%%%%%%%%
format long
if nargin<2
    Fs=1000;%�T���v�����O���g��
end
if nargin>1
    Fs=varargin{1};%�T���v�����O���g��
end

sam_fr=1/Fs;%�T���v�����O���g��1000Hz

[dataMaxNum_m,~]=size(pos);
%%%%%%%%%%%%%%%% 1�K���� %%%%%%%%%%%%%%%%%%%%%%%
dif1=zeros;
for i=1:dataMaxNum_m
    if i==1
        dif1(i,:)=(1/(12*sam_fr))*(-25*pos(i,:)+48*pos(i+1,:)-36*pos(i+2,:)+16*pos(i+3,:)-3*pos(i+4,:));
        
    elseif i==2
        dif1(i,:)=(1/(12*sam_fr))*(-3*pos(i-1,:)-10*pos(i,:)+18*pos(i+1,:)-6*pos(i+2,:)+1*pos(i+3,:));
    
    elseif i==dataMaxNum_m-1
        dif1(i,:)=(1/(12*sam_fr))*(-1*pos(i-3,:)+6*pos(i-2,:)-18*pos(i-1,:)+10*pos(i,:)+3*pos(i+1,:));
    
    elseif i==dataMaxNum_m
        dif1(i,:)=(1/(12*sam_fr))*(3*pos(i-4,:)-16*pos(i-3,:)+36*pos(i-2,:)-48*pos(i-1,:)+25*pos(i,:));
        
    else
        dif1(i,:)=(1/(12*sam_fr))*(1*pos(i-2,:)-8*pos(i-1,:)+8*pos(i+1,:)-1*pos(i+2,:));
    end
end
%%%%%%%%%%%%%%%% 2�K���� %%%%%%%%%%%%%%%%%%%%%%%
dif2=zeros;
for i=1:dataMaxNum_m
    if i==1
        dif2(i,:)=(1/(12*sam_fr))*(-25*dif1(i,:)+48*dif1(i+1,:)-36*dif1(i+2,:)+16*dif1(i+3,:)-3*dif1(i+4,:));
        
    elseif i==2
        dif2(i,:)=(1/(12*sam_fr))*(-3*dif1(i-1,:)-10*dif1(i,:)+18*dif1(i+1,:)-6*dif1(i+2,:)+1*dif1(i+3,:));
    
    elseif i==dataMaxNum_m-1
        dif2(i,:)=(1/(12*sam_fr))*(-1*dif1(i-3,:)+6*dif1(i-2,:)-18*dif1(i-1,:)+10*dif1(i,:)+3*dif1(i+1,:));
    
    elseif i==dataMaxNum_m
        dif2(i,:)=(1/(12*sam_fr))*(3*dif1(i-4,:)-16*dif1(i-3,:)+36*dif1(i-2,:)-48*dif1(i-1,:)+25*dif1(i,:));
        
    else
        dif2(i,:)=(1/(12*sam_fr))*(1*dif1(i-2,:)-8*dif1(i-1,:)+8*dif1(i+1,:)-1*dif1(i+2,:));
    end
end
%%%%%%%%%%%%%%%% 3�K���� %%%%%%%%%%%%%%%%%%%%%%%
dif3=zeros;
for i=1:dataMaxNum_m
    if i==1
        dif3(i,:)=(1/(12*sam_fr))*(-25*dif2(i,:)+48*dif2(i+1,:)-36*dif2(i+2,:)+16*dif2(i+3,:)-3*dif2(i+4,:));
        
    elseif i==2
        dif3(i,:)=(1/(12*sam_fr))*(-3*dif2(i-1,:)-10*dif2(i,:)+18*dif2(i+1,:)-6*dif2(i+2,:)+1*dif2(i+3,:));
    
    elseif i==dataMaxNum_m-1
        dif3(i,:)=(1/(12*sam_fr))*(-1*dif2(i-3,:)+6*dif2(i-2,:)-18*dif2(i-1,:)+10*dif2(i,:)+3*dif2(i+1,:));
    
    elseif i==dataMaxNum_m
        dif3(i,:)=(1/(12*sam_fr))*(3*dif2(i-4,:)-16*dif2(i-3,:)+36*dif2(i-2,:)-48*dif2(i-1,:)+25*dif2(i,:));
        
    else
        dif3(i,:)=(1/(12*sam_fr))*(1*dif2(i-2,:)-8*dif2(i-1,:)+8*dif2(i+1,:)-1*dif2(i+2,:));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%1������A2������l��Ԃ�
if nargout<2 %�Ԃ�l�P��
    varargout{1}=dif1;
elseif nargout<3 %�Ԃ�l2��
    varargout{1}=dif1;
    varargout{2}=dif2;
else %�Ԃ�l3��
    varargout{1}=dif1;
    varargout{2}=dif2;
    varargout{3}=dif3; 
end

    

end