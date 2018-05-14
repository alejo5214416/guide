function varargout = cortes(varargin)
% CORTES MATLAB code for cortes.fig
%      CORTES, by itself, creates a new CORTES or raises the existing
%      singleton*.
%
%      H = CORTES returns the handle to a new CORTES or the handle to
%      the existing singleton*.
%
%      CORTES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CORTES.M with the given input arguments.
%
%      CORTES('Property','Value',...) creates a new CORTES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cortes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cortes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cortes

% Last Modified by GUIDE v2.5 14-May-2018 09:12:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cortes_OpeningFcn, ...
                   'gui_OutputFcn',  @cortes_OutputFcn, ...
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


% --- Executes just before cortes is made visible.
function cortes_OpeningFcn(hObject, eventdata, handles, varargin)
clc
open 'manual.txt'
global  valorz valory valorx
 valorz = get(handles.slider3,'Value');
set(handles.text11,'String',num2str(round(valorz)));

valory = get(handles.slider2,'Value');
set(handles.text10,'String',num2str(round(valory)));

valorx = get(handles.slider1,'Value');
set(handles.text9,'String',num2str(round(valorx)));

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cortes (see VARARGIN)

% Choose default command line output for cortes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cortes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cortes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global valorx 
 valorx = get(handles.slider1,'Value');
 set(handles.text9,'String',num2str(round(valorx)));

 
 global valory axial 

valory = round(get(handles.slider1,'Value'));
set(handles.text9,'String',num2str(round(valorx)));
ax=handles.filename;
axial=ax.img(128,:,:);

% Selecciono la primera imagen que voy a actualizar
axes(handles.axes1);
imshow(axial);
 

% imshow(handles.axes1,imagen(:,:,round(valorx)));
 
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
global valory sagital 

valory = round(get(handles.slider2,'Value'));
set(handles.text10,'String',num2str(valory));
sag=handles.filename;
sagital=sag.img(:,128,:);

% Selecciono la primera imagen que voy a actualizar
axes(handles.axes2);
imshow(sagital);
 
 
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
global valorz imagen v z coronal
valorz = round(get(handles.slider3,'Value'));
set(handles.text11,'String',num2str(valorz));
cor=handles.filename;
coronal=cor.img(:,:,valorz);
% Selecciono la primera imagen que voy a actualizar
axes(handles.axes3);
imshow(coronal);

% 
% v = load_nii('archivo.nii');
% imagen= v.img(:,:,valorz);
% 
% axes(handles.axes3);
% imshow(imagen);
 
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
filename = uigetfile('*.nii')
file=load_nii(filename)
handles.filename=file
guidata(hObject,handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y
[x,y]=ginput
set(handles.text12,'String',num2str([x,y]))
