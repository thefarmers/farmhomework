function varargout = kanban2(varargin)
% KANBAN2 MATLAB code for kanban2.fig
%      KANBAN2, by itself, creates a new KANBAN2 or raises the existing
%      singleton*.
%
%      H = KANBAN2 returns the handle to a new KANBAN2 or the handle to
%      the existing singleton*.
%
%      KANBAN2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KANBAN2.M with the given input arguments.
%
%      KANBAN2('Property','Value',...) creates a new KANBAN2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kanban2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kanban2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kanban2

% Last Modified by GUIDE v2.5 14-Sep-2014 15:23:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kanban2_OpeningFcn, ...
                   'gui_OutputFcn',  @kanban2_OutputFcn, ...
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


% --- Executes just before kanban2 is made visible.
function kanban2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kanban2 (see VARARGIN)

% Choose default command line output for kanban2
handles.output = hObject;
handles.crmin = 0;
handles.crmax = 0;
handles.cbmin = 0;
handles.cbmax = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kanban2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=imread('/Users/passaporng/Desktop/robin.jpg');
handles.image=f1;
guidata(hObject,handles);
imshow(f1)


% --- Outputs from this function are returned to the command line.
function varargout = kanban2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
crmin = get(hObject,'Value');
crmin = (crmin*100)+100;
handles.crmin = crmin;
guidata(hObject,handles)
g=rgb2ycbcr(handles.image);
cb=g(:,:,2);
cr=g(:,:,3);
face=zeros(size(g,1),size(g,2),size(g,3));
for i=1:size(g,1)
    for j=1:size(g,2)
        if(cr(i,j)>handles.crmin & cr(i,j)<handles.crmax & cb(i,j)>handles.cbmin & cb(i,j)<handles.cbmax )
            face(i,j,1)=handles.image(i,j,1);
            face(i,j,2)=handles.image(i,j,2);
            face(i,j,3)=handles.image(i,j,3);
        end
    end
end
face=mat2gray(face);
imshow(face);





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
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
crmax = get(hObject,'Value');
crmax = (crmax*100)+100;
handles.crmax = crmax;
guidata(hObject,handles)
g=rgb2ycbcr(handles.image);
cb=g(:,:,2);
cr=g(:,:,3);
face=zeros(size(g,1),size(g,2),size(g,3));
for i=1:size(g,1)
    for j=1:size(g,2)
        if(cr(i,j)>handles.crmin & cr(i,j)<handles.crmax & cb(i,j)>handles.cbmin & cb(i,j)<handles.cbmax )
            face(i,j,1)=handles.image(i,j,1);
            face(i,j,2)=handles.image(i,j,2);
            face(i,j,3)=handles.image(i,j,3);
        end
    end
end
face=mat2gray(face);
imshow(face);


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
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
cbmin = get(hObject,'Value');
cbmin = (cbmin*100)+100;
handles.cbmin = cbmin;
guidata(hObject,handles)
g=rgb2ycbcr(handles.image);
cb=g(:,:,2);
cr=g(:,:,3);
face=zeros(size(g,1),size(g,2),size(g,3));
for i=1:size(g,1)
    for j=1:size(g,2)
        if(cr(i,j)>handles.crmin & cr(i,j)<handles.crmax & cb(i,j)>handles.cbmin & cb(i,j)<handles.cbmax )
            face(i,j,1)=handles.image(i,j,1);
            face(i,j,2)=handles.image(i,j,2);
            face(i,j,3)=handles.image(i,j,3);
        end
    end
end
face=mat2gray(face);
imshow(face);


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
cbmax = get(hObject,'Value');
cbmax = (cbmax*100)+100;
handles.cbmax = cbmax;
guidata(hObject,handles)
g=rgb2ycbcr(handles.image);
cb=g(:,:,2);
cr=g(:,:,3);
face=zeros(size(g,1),size(g,2),size(g,3));
for i=1:size(g,1)
    for j=1:size(g,2)
        if(cr(i,j)>handles.crmin & cr(i,j)<handles.crmax & cb(i,j)>handles.cbmin & cb(i,j)<handles.cbmax )
            face(i,j,1)=handles.image(i,j,1);
            face(i,j,2)=handles.image(i,j,2);
            face(i,j,3)=handles.image(i,j,3);
        end
    end
end
face=mat2gray(face);
imshow(face);


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

