function varargout = interfaz_proyecto(varargin)
% INTERFAZ_PROYECTO MATLAB code for interfaz_proyecto.fig
%      INTERFAZ_PROYECTO, by itself, creates a new INTERFAZ_PROYECTO or raises the existing
%      singleton*.
%
%      H = INTERFAZ_PROYECTO returns the handle to a new INTERFAZ_PROYECTO or the handle to
%      the existing singleton*.
%
%      INTERFAZ_PROYECTO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ_PROYECTO.M with the given input arguments.
%
%      INTERFAZ_PROYECTO('Property','Value',...) creates a new INTERFAZ_PROYECTO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_proyecto_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_proyecto_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz_proyecto

% Last Modified by GUIDE v2.5 20-Nov-2018 17:14:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz_proyecto_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz_proyecto_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before interfaz_proyecto is made visible.
function interfaz_proyecto_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz_proyecto (see VARARGIN)

% Choose default command line output for interfaz_proyecto
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz_proyecto wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz_proyecto_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calcular_gs.
function calcular_gs_Callback(hObject, eventdata, handles)

y=str2double(get(handles.y , 'string'));
u=str2double(get(handles.u , 'string'));
answer = inputdlg('ingrese ecuacion de salida separada ','y(s)',[1 50]);
vec_s=str2num(answer{1});
answer2 = inputdlg('ingrese ecuacion de entrada separada ','u(s)',[1 50]);
vec_e=str2num(answer2{1});

if (y+1)~=length(vec_s)
errordlg('el grado no concuerda con la ecuacion de salida','Error en el grado');
else
    if (u+1) ~= length(vec_e)
    errordlg('el grado no concuerda con la ecuacion de entrada','Error en el grado');
    else
        
        if vec_s(1) ~= 1
        ns=rdivide(vec_s,vec_s(1));
        ne=rdivide(vec_e,vec_s(1));
        else
            ns=vec_s;
            ne=vec_e;
        end
        %grafica del sistema%
gs=tf(ne,ns);
[z,p,k]=tf2zp(ne,ns);
r=evalc('gs');
set(handles.result,'string',r);
step(handles.grafsis,gs,'r');
xlabel(handles.grafsis,'Eje Real');
ylabel(handles.grafsis,'Eje Imaginario');
title(handles.grafsis,'Grafica del Sistema');

if isempty(z)
set(handles.ceros,'string','no hay ceros')
else
z1=evalc('z');
set(handles.ceros,'String',z1);   
end
k1=evalc('k');
p1=evalc('p');
set(handles.polos,'string',p1);
set(handles.ganancia,'string',k1);
%grafica del mapa de polos y ceros%
pzmap(handles.mzpk,gs,'g');
xlabel(handles.mzpk,'Eje Real');
ylabel(handles.mzpk,'Eje Imaginario');
title(handles.mzpk,'Mapa de ceros y polos');

aux=false;
for i = 1:size(p)
if p(i) > 0
    aux=true;
    break
end
end

   

if aux == true
    set(handles.estabilidad,'string','el sistema es inestable');
else
    set(handles.estabilidad,'string','el sistema es estable');
    s=tf('s');
    ee=1/s;
    er=1/s^2;
    gesc=gs*ee;
    %grafica de entrada escalon%
    step(handles.grafesc,gesc,'r');
    xlabel(handles.grafesc,'Tiempo');
    ylabel(handles.grafesc,'Amplitud');
    title(handles.grafesc,'Grafica Entrada Escalon');
    
    gramp=gs*er;
    %grafica de entrada rampa%
    step(handles.graframp,gramp,'r');
    xlabel(handles.graframp,'Tiempo');
    ylabel(handles.graframp,'Amplitud');
    title(handles.graframp,'Grafica Entrada Rampa');
   
    info=stepinfo(gs);
    tp=info.PeakTime;
    sp=info.Overshoot/100;
    x=log(sp);
    Z=sqrt(x^2/(pi^2+x^2));
    wn=pi/(tp*sqrt(1-Z^2));
    if Z == 0
        set(handles.amortiguamiento,'string','criticamente amortiguado');
    elseif Z>1
        set(handles.amortiguamiento,'string','sobreamortiguado');
    elseif Z<0
        set(handles.amortiguamiento,'string','amortiguamiento negativo');
    else
        set(handles.amortiguamiento,'string','subamortiguado');
        ts=3.2/(Z*wn);
        set(handles.sp,'string',sp);
        set(handles.ts,'string',ts);
    end
    
    syms s;
    [m,n]=tfdata(gs);
    ecn=poly2sym(cell2mat(m),s);
    ecd=poly2sym(cell2mat(n),s);
    p1=limit(ecn,s,0);
    p2=limit(ecd,s,0);
    
if y == 1
    tsis = y-1;
    Ep=p2/p+k*p1;
    Ev=inf;
    Ea=inf;
    ep=evalc('Ep');
    ev=evalc('Ev');
    ea=evalc('Ea');
    set(handles.tiposis,'string',tsis);
    set(handles.ep,'string',ep);
    set(handles.ev,'string',ev);
    set(handles.ea,'string',ea);
    
elseif y == 2
    tsis = y-1;
    Ep=0;
    Ev=p2/k*p1;
    Ea=inf;
    ep=evalc('Ep');
    ev=evalc('Ev');
    ea=evalc('Ea');
    set(handles.tiposis,'string',tsis);
    set(handles.ep,'string',ep);
    set(handles.ev,'string',ev);
    set(handles.ea,'string',ea);
    
    
elseif y == 3
    tsis = y-1;
    Ep=0;
    Ev=0;
    Ea=p2/k*p1;
    ep=evalc('Ep')
    ev=evalc('Ev')
    ea=evalc('Ea')
    set(handles.tiposis,'string',tsis);
    set(handles.ep,'string',ep);
    set(handles.ev,'string',ev);
    set(handles.ea,'string',ea);
    
    
else
    tsis=y-1;
    Ep=0;
    Ev=0;
    Ea=0;
    set(handles.tiposis,'string',tsis);
    set(handles.ep,'string',Ep);
    set(handles.ev,'string',Ev);
    set(handles.ea,'string',Ea);
    
end

 %ecuacion de estado matricial y ecuacion de salida%
 
 [A1,B1,C1,D]=tf2ss(ne,ns);
 if y == 1 || y == 2 || y == 3
    AUX=fliplr(A1(1,:));
    A1(1,:)=AUX;
    C=fliplr(C1);
    A1([1 end],:)=A1([end 1],:);
    aux=fliplr(A1(2,:));
    A1(2,:)=aux;
    A=A1;
    B1([1 end],:)=B1([end 1],:);
    B=B1;

elseif y == 4
    AUX=fliplr(A1(1,:));
    A1(1,:)=AUX;
    A1([1 2],:)=A1([2 1],:);
    A1([2 3],:)=A1([3 2],:);
    A1([3 4],:)=A1([4 3],:);
    B1([1 end],:)=B1([end 1],:);
    aux=fliplr(A1(1,:));
    A1(1,:)=aux;
    A1([1 2],:)=A1([2 1],:);
    A1([2 3],:)=A1([3 2],:);
    C=fliplr(C1);
    A=A1;
    B=B1;

    
elseif y == 5
    AUX=fliplr(A1(1,:));
    A1(1,:)=AUX;
    A1([1 2],:)=A1([2 1],:);
    A1([2 3],:)=A1([3 2],:);
    A1([3 4],:)=A1([4 3],:);
    A1([4 5],:)=A1([5 4],:);
    aux=fliplr(A1(1,:));
    A1(1,:)=aux;
    A1([1 2],:)=A1([2 1],:);
    A1([2 3],:)=A1([3 2],:);
    A1([3 4],:)=A1([4 3],:);
    B1([1 end],:)=B1([end 1],:);
    C=fliplr(C1);
    A=A1;
    B=B1;
 end
 A;
 B;
 C;
 D;
 matA=evalc('A');
 matB=evalc('B');
 matC=evalc('C');
 if D==0
 matD=0;
 else
 matD=evalc('D');
 end
 set(handles.matA,'string',matA);
 set(handles.matB,'string',matB);
 set(handles.matC,'string',matC);
 set(handles.matD,'string',matD);
 if y == 1
     vx='x1 ';
     set(handles.confx,'string',vx);
      dx='d(x1)';
     set(handles.dex,'string',dx);
     vx2='x1';
     set(handles.confx2,'string',vx2);
 elseif y == 2
     vx=['x1 ';'x2 '];
     set(handles.confx,'string',vx);
     dx=['d(x1)';'d(x2)'];
     set(handles.dex,'string',dx);
     vx2=['x1';'x2'];
     set(handles.confx2,'string',vx2);
 elseif y == 3
     vx=['x1 ';'x2 ';'x3 '];
     set(handles.confx,'string',vx);
     dx=['d(x1)';'d(x2)';'d(x3)'];
     set(handles.dex,'string',dx);
     vx2=['x1';'x2';'x3'];
     set(handles.confx2,'string',vx2);
 elseif y == 4
     vx=['x1 ';'x2 ';'x3 ';'x4 '];
     set(handles.confx,'string',vx);
     dx=['d(x1)';'d(x2)';'d(x3)';'d(x4)'];
     set(handles.dex,'string',dx);
     vx2=['x1';'x2';'x3';'x4'];
     set(handles.confx2,'string',vx2);
 else
     vx=['x1 ';'x2 ';'x3 ';'x4 ';'x5 '];
     set(handles.confx,'string',vx); 
     dx=['d(x1)';'d(x2)';'d(x3)';'d(x4)';'d(x5)'];
     set(handles.dex,'string',dx);
     vx2=['x1';'x2';'x3';'x4';'x5'];
     set(handles.confx2,'string',vx2);
 end
 
 ut = inputdlg('ingrese el valor de u(t) ','U(T)');
 syms s;
 tamA=size(A);
 i=eye(tamA);
 sia=(s*i)-A;
 insia=inv(sia);
 x0=zeros(y,1);
 us=laplace(sym(ut));
 xs=insia*B*us;
 xt=ilaplace(xs);
 ec=C*xt + D*us;
 matRe=evalc('ec');
 set(handles.matRe,'string',matRe);

end
    end
end


% hObject    handle to calcular_gs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function y_Callback(hObject, eventdata, handles)
% global a;
% a=str2double(get(hObject.y,'string'));


% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y as text
%        str2double(get(hObject,'String')) returns contents of y as a double


% --- Executes during object creation, after setting all properties.
function y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function u_Callback(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global b;
% b=str2double(get(hObject.u,'string'))

% Hints: get(hObject,'String') returns contents of u as text
%        str2double(get(hObject,'String')) returns contents of u as a double


% --- Executes during object creation, after setting all properties.
function u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y2_Callback(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y2 as text
%        str2double(get(hObject,'String')) returns contents of y2 as a double


% --- Executes during object creation, after setting all properties.
function y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
