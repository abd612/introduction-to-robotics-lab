%% Complex Engineering Problem

%%

function varargout = ComplexEngineeringProblem(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ComplexEngineeringProblem_OpeningFcn, ...
                   'gui_OutputFcn',  @ComplexEngineeringProblem_OutputFcn, ...
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

function ComplexEngineeringProblem_OpeningFcn(hObject, eventdata, handles, varargin)

handles.check = 0;
handles.x = 0;
handles.y = 0;
handles.th = 0;
axis([0 10 0 10]);
hold on;
grid on;
xlabel('x-axis');
ylabel('y-axis');
handles.output = hObject;
guidata(hObject, handles);

function varargout = ComplexEngineeringProblem_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function start_button_Callback(hObject, eventdata, handles)

x0 = [handles.x,handles.y,handles.th];
assignin('base','x0',x0);
plot_vehicle(x0);
handles.check = 1;
guidata(hObject,handles);

function exit_button_Callback(hObject, eventdata, handles)

close(ComplexEngineeringProblem);

function x_input_Callback(hObject, eventdata, handles)

handles.x = str2double(get(hObject,'String'));
guidata(hObject, handles);
assignin('base','x',handles.x);

function x_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function y_input_Callback(hObject, eventdata, handles)

handles.y = str2double(get(hObject,'String'));
guidata(hObject, handles);
assignin('base','y',handles.y);

function y_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function th_input_Callback(hObject, eventdata, handles)

handles.th = str2double(get(hObject,'String'));
guidata(hObject, handles);
assignin('base','th',handles.th);

function th_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function graph_ButtonDownFcn(hObject, eventdata, handles)

if (handles.check ~= 0)
[x,y] = ginput(1);
xg = [x,y];
assignin('base','xg',xg);
op = sim('DriveToPoint');
yout = op.find('yout');
plot(yout(:,1),yout(:,2));
assignin('base','x0',[yout(end,1) yout(end,2) yout(end,3)]);
plot_vehicle([yout(end,1) yout(end,2) yout(end,3)]);
end

%% Note

% Some part of the code is taken from different files of
% Peter Corke's Robotics Toolbox.

%% Credits

% Muhammad Abdullah
% (2015-EE-166)
