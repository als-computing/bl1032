function varargout = XAS_AutoProcess(varargin)
% XAS_AUTOPROCESS M-file for XAS_AutoProcess.fig
%      XAS_AUTOPROCESS, by itself, creates a new XAS_AUTOPROCESS or raises the existing
%      singleton*.
%      H = XAS_AUTOPROCESS returns the handle to a new XAS_AUTOPROCESS or the handle to
%      the existing singleton*.
%
%      XAS_AUTOPROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in XAS_AUTOPROCESS.M with the given input arguments.
%
%      XAS_AUTOPROCESS('Property','Value',...) creates a new XAS_AUTOPROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before XAS_AutoProcess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to XAS_AutoProcess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help XAS_AutoProcess

% Last Modified by GUIDE v2.5 14-Aug-2024 12:47:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @XAS_AutoProcess_OpeningFcn, ...
                   'gui_OutputFcn',  @XAS_AutoProcess_OutputFcn, ...
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% --- Executes just before XAS_AutoProcess is made visible.
function XAS_AutoProcess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to XAS_AutoProcess (see VARARGIN)

Default_directory = 'C:\Users\admin\Documents\MATLAB\mltools4';
set(handles.edit_defaultdirectory, 'string', Default_directory);
handles.standard_pathname = 'C:\Users\admin\Documents\MATLAB\mltools4';

%directory for Valence plot
handles.VPdir = 'C:\Users\admin\Documents\MATLAB\mltools4\';
% ------------------------------------------- 

set(handles.axes_preprocessed, 'visible', 'off')
set(handles.pb_save_rawXAS, 'visible', 'on')
set(handles.text4, 'visible', 'off')

set(handles.axes_postprocessed, 'visible', 'off')
set(handles.text5, 'visible', 'off')

% scaler radiobutton controls
set(handles.text6, 'visible', 'off')
set(handles.text7, 'visible', 'off')
set(handles.rb_scaler0, 'visible', 'off')
set(handles.text8, 'visible', 'off')
set(handles.rb_scaler1, 'visible', 'off')
set(handles.text9, 'visible', 'off')
set(handles.rb_scaler2, 'visible', 'off')
set(handles.text10, 'visible', 'off')
set(handles.rb_scaler3, 'visible', 'off')
set(handles.text11, 'visible', 'off')
set(handles.rb_scaler4, 'visible', 'off')
set(handles.text12, 'visible', 'off')
set(handles.rb_scaler5, 'visible', 'off')
set(handles.text13, 'visible', 'off')
set(handles.rb_scaler6, 'visible', 'off')
set(handles.text14, 'visible', 'off')
set(handles.rb_scaler7, 'visible', 'off')
set(handles.text15, 'visible', 'off')
set(handles.rb_scaler8, 'visible', 'off')
set(handles.text16, 'visible', 'off')
set(handles.rb_scalerall, 'visible', 'off')
set(handles.text16, 'visible', 'off')
set(handles.rb_scaler8, 'visible', 'off')
set(handles.text16, 'visible', 'off')
set(handles.rb_scaler9, 'visible', 'off')
set(handles.text27, 'visible', 'off')
set(handles.rb_scaler10, 'visible', 'off')
set(handles.text28, 'visible', 'off')
set(handles.rb_scaler11, 'visible', 'off')
set(handles.text29, 'visible', 'off')
set(handles.rb_scaler12, 'visible', 'off')
set(handles.text30, 'visible', 'off')

set(handles.rb_scaler13, 'visible', 'off')
set(handles.text41, 'visible', 'off')
set(handles.rb_scaler14, 'visible', 'off')
set(handles.text42, 'visible', 'off')

set(handles.rb_scalerdefault, 'visible', 'off')
set(handles.text35, 'visible', 'off')

set(handles.rb_clearallscaler, 'visible', 'off')
set(handles.text31, 'visible', 'off')

set(handles.ed_cmin, 'visible', 'off')
set(handles.text18, 'visible', 'off')
set(handles.ed_cmax, 'visible', 'off')
set(handles.text19, 'visible', 'off')
set(handles.pb_process_spectra, 'visible', 'on')
set(handles.pb_crosscorrelation, 'visible', 'on')
set(handles.rb_FullScreen,'visible', 'off')
axes(handles.axes4);
ALSlogo = imread('ALS logo.png');
image(ALSlogo)
axis off
axis image

set(handles.rb_newfileformat, 'visible', 'off')
set(handles.rb_oldfileformat, 'visible', 'off')

axes(handles.axes3);
LBNLlogo = imread('LBNL logo.png');
image(LBNLlogo)
axis off
axis image

% Choose default command line output for XAS_AutoProcess
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes XAS_AutoProcess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = XAS_AutoProcess_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
if isempty(handles)
 varargout{1} = [];
else
 varargout{1} =handles.output;
end


% --- Executes on button press in rb_singlefile.
function rb_singlefile_Callback(hObject, eventdata, handles)
% hObject    handle to rb_singlefile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') == 1
    set(handles.rb_multipleload, 'value', 0)
end

if get(hObject,'Value') == 0
    set(handles.rb_multipleload, 'value', 1)
end
guidata(hObject, handles)


% --- Executes on button press in rb_multipleload.
function rb_multipleload_Callback(hObject, eventdata, handles)
% hObject    handle to rb_multipleload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') == 1
    set(handles.rb_singlefile, 'value', 0)
end
if get(hObject,'Value') == 0
    set(handles.rb_singlefile, 'value', 1)
end

guidata(hObject, handles)


function edit_defaultdirectory_Callback(hObject, eventdata, handles)
% hObject    handle to edit_defaultdirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_defaultdirectory as text
%        str2double(get(hObject,'String')) returns contents of edit_defaultdirectory as a double
default_directory = get(hObject, 'string');
guidata(hObject, handles)


% --- Executes during object creation, after setting all properties.
function edit_defaultdirectory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_defaultdirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_currentdirectory_Callback(hObject, eventdata, handles)
% hObject    handle to edit_currentdirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_currentdirectory as text
%        str2double(get(hObject,'String')) returns contents of edit_currentdirectory as a double


% --- Executes during object creation, after setting all properties.
function edit_currentdirectory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_currentdirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%==================== Save Raw XAS spectra ==============================

% --- Executes on button press in pb_save_rawXAS.
function pb_save_rawXAS_Callback(hObject, eventdata, handles)
% hObject    handle to pb_save_rawXAS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = cd;
if get(hObject,'Value') == 1
    index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    axes(handles.axes_preprocessed);
    set(handles.axes_preprocessed, 'visible', 'on');
    set(handles.text4, 'visible', 'on');
    
    if get(handles.rb_multipleload,'value')==0 % single file
        ind = find(handles.XASfile == '.');
        ind2plot = find(index == 1);
        I= [];

        %Make a ghost figure to temp print and save, then delete it
        close(findobj('name', 'temp'))
        htemp=figure;
        set(htemp, 'name', 'temp','color','white','visible','off')
   
    
        for j=1:size(ind2plot,2)
            k = ind2plot(j);
            a = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(a), 'k', 'linewidth', 1)
            hold on
        end  
        ax = gca;
        ax.FontSize = 6;
        xlabel('Energy [keV]', 'fontsize', 7, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 7, 'fontweight', 'bold')
        title(handles.XASfile(1:ind-1),'fontsize', 12, 'fontweight', 'bold', 'interpreter','none')
        % Make a directory to save the raw spectrum and save as bmp and pdf
        
        % Save the figure and files
        current = cd;
        cd(get(handles.edit_currentdirectory,'string'))
        ind = find(handles.XASfile == '.');

        newdir = [handles.XASfile(1:ind-1),'_XAS'];
        [SUCCESS,MESSAGE,MESSAGEID] = mkdir(newdir);

        if SUCCESS == 0
           msgbox('The new directory can not be created')
           return
        end
        cd(newdir) 
        saveas(htemp, [handles.XASfile(1:ind-1),'_Raw.bmp'])  
     end
    
    if get(handles.rb_multipleload,'value')==1
            htemp=figure;
            set(htemp, 'name', 'temp','color','white','visible','off')
            XASfile = handles.XASfileAv{1};
            ind = find(XASfile == '.');
            plot(energy, handles.XASAbsAv, 'k', 'linewidth', 1)
            axis('auto')
            ax = gca;
            ax.FontSize = 6;
            xlabel('Energy [keV]', 'fontsize', 7, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 7, 'fontweight', 'bold')
            name_ext = [];
            for p = 1:size(handles.XASfileAv,2)
                nn=handles.XASfileAv{1,p};
                name_ext = [name_ext, nn(1,ind-4:ind-1)];
            end
            title([XASfile(1:ind-5),'_Raw_avg',name_ext],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none')
            
    
        % Make a directory to save the raw spectrum and save as bmp
          % Save the figure and files
        current = cd;
        cd(get(handles.edit_currentdirectory,'string'))
        ind = find(XASfile == '.');

        newdir = [XASfile(1:ind-5),name_ext,'_XAS_average'];
        [SUCCESS,MESSAGE,MESSAGEID] = mkdir(newdir);

        if SUCCESS == 0
           msgbox('The new directory can not be created')
           return
        end
        cd(newdir) 
        saveas(htemp, [XASfile(1:ind-5),name_ext,'_Raw_avg.bmp'])
    end
    
end
delete(htemp)
cd(current)
hmes = msgbox(['Raw spectrum saved in ',[get(handles.edit_currentdirectory,'string'),newdir]]);
pause
close(hmes)
guidata(hObject, handles)


% --- Executes on button press in pb_upload.
function pb_upload_Callback(hObject, eventdata, handles)
% hObject    handle to pb_upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear data

set(handles.pb_process_spectra, 'visible', 'on')
cla(handles.axes_postprocessed);
axes(handles.axes_postprocessed);
set(handles.axes_postprocessed, 'visible', 'off');

set(handles.text5, 'visible', 'off')
current = cd;

% First identify a directory where to look for the data files
default_directory = get(handles.edit_defaultdirectory, 'string');
current_directory = get(handles.edit_currentdirectory, 'string');

if ~isempty(current_directory)
    cd(current_directory)
else
    cd(default_directory)
end

%clear all old radiobuttons
 set(handles.rb_scaler0, 'value', 0);
 set(handles.rb_scaler1, 'value', 0);
 set(handles.rb_scaler2, 'value', 0);
 set(handles.rb_scaler3, 'value', 0);
 set(handles.rb_scaler4, 'value', 0);
 set(handles.rb_scaler5, 'value', 0);
 set(handles.rb_scaler6, 'value', 0);
 set(handles.rb_scaler7, 'value', 0);
 set(handles.rb_scaler8, 'value', 0);
 set(handles.rb_scaler9, 'value', 0);
 set(handles.rb_scaler10, 'value', 0);
 set(handles.rb_scaler11, 'value', 0);
 set(handles.rb_scaler12, 'value', 0);
 set(handles.rb_scaler13, 'value', 0);
 set(handles.rb_scaler14, 'value', 0);
 set(handles.rb_clearallscaler, 'value', 0)
 set(handles.rb_scalerdefault, 'value', 0);

% upload data files depending on the multiple choices
if get(handles.rb_singlefile, 'value') == 1
    %single file selection
    [file, pathname] = uigetfile( ...
       {'*.qx;*.dat', 'All Files (*.qx, *.dat)'}, ...
        'Select a SINGLE file');
    
    if isequal(file,0) || isequal(pathname,0)
       msgbox('Upload cancelled')
       return
    end
    
    set(handles.edit_currentdirectory, 'string', pathname);

    % Detects automatically if the file is a .qx or a .dat extension file
    extension = file(find(file == '.',1, 'last')+1:length(file));
    if strcmp(extension, 'qx')
        data = opentheselectedfile([pathname, file]);
    elseif strcmp(extension, 'dat')
        data = opentheselectedfiledotdat([pathname, file]);
    else
        hmes = msgbox('Upload a file with a different format');
        return
    end
    
    cla(handles.axes_preprocessed);
    axes(handles.axes_preprocessed);
    % dcm = datacursormode(gcf);
    %     dcm.Enable='on';
    %     dcm.DisplayStyle = 'window';
   
    set(handles.axes_preprocessed, 'visible', 'on');
    set(handles.text4, 'visible', 'on');
    
    energy = data.energy/1000;
    Intensity = data.I;
    scaler2plot = data.NumeratorPlot;
    if size(scaler2plot,2)<18 % this is used for the old .dat files
        scaler2plot=[scaler2plot, zeros(1,18-size(scaler2plot,2))];
    end
    ind2plot = find(scaler2plot == 1);
    
    % Detect that scaler 0 is "on"; check the denominator
    if ind2plot(1) == 1 && data.DenominatorPlot(1,15) == 1
         a = Intensity{1,1}./Intensity{1,15};
         if strcmp(extension, 'qx')
            plot(energy, log(mean(a)), 'k', 'linewidth', 1)
         else
            plot(energy, log(a), 'k', 'linewidth', 1)
         end
         axis('auto')
         ax = gca;
         ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Transmission (a.u)', 'fontsize', 9, 'fontweight', 'bold')
        title(file(1:find(file == '.')-1),'fontsize', 9, 'interpreter','none')
        zoom on
        grid on
    else
        I= [];
        for j=1:size(ind2plot,2)
            k = ind2plot(j);
            a = Intensity{1,k}./Intensity{1,1};
            if strcmp(extension, 'qx')
            plot(energy, mean(a), 'k', 'linewidth', 1)
            else
            plot(energy, a, 'k', 'linewidth', 1)
            end           
            hold on
        end 
        axis('auto')
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u)', 'fontsize', 9, 'fontweight', 'bold')
        title(file(1:find(file == '.')-1),'fontsize', 9, 'interpreter','none')
        zoom on
        grid on
    end
    
    handles.XASfile = file(1:find(file == '.')-1);
      
else % multiple file selection
     [files, pathname] = uigetfile( ...
       {'*.qx;*.dat', 'All Files (*.qx, *.dat)'}, ...
        'Select MULTIPLE files','multiselect','on');
    
    if isequal(files,0) || isequal(pathname,0)
       h=msgbox('Upload cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end
    
    if~iscell(files)
        h= msgbox('Please select multiple files');
        pause(5)
        cd(current)
        delete(h)
        return
    end
    
    handles.XASfile = files;
    set(handles.edit_currentdirectory, 'string', pathname);
    
    cla(handles.axes_preprocessed);
    axes(handles.axes_preprocessed);
     dcm = datacursormode(gcf);
        dcm.Enable='on';
        dcm.DisplayStyle = 'window';
    set(handles.axes_preprocessed, 'visible', 'on');
    set(handles.text4, 'visible', 'on');
    
    for p = 1: size(files,2)
        file=files{1,p};
        %data = opentheselectedfile([pathname, file]);
        % Detects automatically if the file is a .qx or a .dat extension file
        extension = file(find(file == '.',1, 'last')+1:length(file));
        if strcmp(extension, 'qx')
            data = opentheselectedfile([pathname, file]);
        elseif strcmp(extension, 'dat')
            data = opentheselectedfiledotdat([pathname, file]);
        else
            hmes = msgbox('Upload a file with a different format');
            return
        end

        energy = data.energy/1000;
        Intensity = data.I;
        scaler2plot = data.NumeratorPlot;
        ind2plot = find(scaler2plot == 1); 
        
        if p==1 % used later
            data1=data;
            scaler2plot1= scaler2plot;
        end
        
        % Detect that scaler 0 is "on"; check the denominator
        if ind2plot(1) == 1 && data.DenominatorPlot(1,15) == 1
             eval(['a_',num2str(p),' = Intensity{1,1}./Intensity{1,15};'])
        else
            I= [];
            for j=1:size(ind2plot,2)
                w = ind2plot(j);
                eval(['a_',num2str(p),' = Intensity{1,w}./Intensity{1,1};'])
            end 
        end   
    end
    
    % make the sum of all average spectra
    a =[];
    for p = 1:size(files,2)
        if strcmp(extension, 'qx')
            a=[a; mean(eval(['a_',num2str(p)]))];
        else
            a=[a; eval(['a_',num2str(p)])];
        end
    end
    
        plot(energy, mean(a), 'k', 'linewidth', 1)
        axis('auto')
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u)', 'fontsize', 9, 'fontweight', 'bold')

        name_ext = [];
        ind = find(handles.XASfile{1,1} =='.');
            for p = 1:size(handles.XASfile,2)
                nn=handles.XASfile{1,p};
                name_ext = [name_ext, nn(1,ind-4:ind-1)];
            end
            title([nn(1:ind-5),'_avg',name_ext],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none')

data=data1;
scaler2plot = scaler2plot1;
if size(scaler2plot,2)<18
    scaler2plot=[scaler2plot, zeros(1,18-size(scaler2plot,2))];
end
end

%data.plot = mean(I);
if iscell(handles.XASfile)
 handles.XASfileAv = handles.XASfile;
 handles.XASAbsAv = mean(a);
end
handles.data = data;  % contains the values data.energy & data.Intensity

% turn on the scaler radiobuttons and associated text
set(handles.text6, 'visible', 'on') 

set(handles.text7, 'visible', 'on')
set(handles.rb_scaler0, 'visible', 'on')

set(handles.text8, 'visible', 'on')
set(handles.rb_scaler1, 'visible', 'on')
if scaler2plot(2) == 1
    set(handles.rb_scaler1, 'value', 1) 
end

set(handles.text9, 'visible', 'on')
set(handles.rb_scaler2, 'visible', 'on')
if scaler2plot(3) == 1
    set(handles.rb_scaler2, 'value', 1) 
end

set(handles.text10, 'visible', 'on')
set(handles.rb_scaler3, 'visible', 'on')
if scaler2plot(4) == 1
    set(handles.rb_scaler3, 'value', 1) 
end
set(handles.text11, 'visible', 'on')
set(handles.rb_scaler4, 'visible', 'on')
if scaler2plot(5) == 1
    set(handles.rb_scaler4, 'value', 1) 
end

set(handles.text12, 'visible', 'on')
set(handles.rb_scaler5, 'visible', 'on')
if scaler2plot(6) == 1
    set(handles.rb_scaler5, 'value', 1) 
end

set(handles.text13, 'visible', 'on')
set(handles.rb_scaler6, 'visible', 'on')
if scaler2plot(7) == 1
    set(handles.rb_scaler6, 'value', 1) 
end

set(handles.text14, 'visible', 'on')
set(handles.rb_scaler7, 'visible', 'on')
if scaler2plot(8) == 1
    set(handles.rb_scaler7, 'value', 1) 
end

set(handles.text16, 'visible', 'on')
set(handles.rb_scaler8, 'visible', 'on')
if scaler2plot(9) == 1
    set(handles.rb_scaler8, 'value', 1) 
end

set(handles.text27, 'visible', 'on')
set(handles.rb_scaler9, 'visible', 'on')
if scaler2plot(10) == 1
    set(handles.rb_scaler9, 'value', 1) 
end

set(handles.text28, 'visible', 'on')
set(handles.rb_scaler10, 'visible', 'on')
if scaler2plot(11) == 1
    set(handles.rb_scaler10, 'value', 1) 
end

set(handles.text29, 'visible', 'on')
set(handles.rb_scaler11, 'visible', 'on')
if scaler2plot(12) == 1
    set(handles.rb_scaler11, 'value', 1)   
end

set(handles.text30, 'visible', 'on')
set(handles.rb_scaler12, 'visible', 'on')
if scaler2plot(12) == 1
    set(handles.rb_scaler12, 'value', 1)   
end

set(handles.text41, 'visible', 'on')
set(handles.rb_scaler13, 'visible', 'on')
if scaler2plot(13) == 1
    set(handles.rb_scaler13, 'value', 1)   
end

set(handles.text42, 'visible', 'on')
set(handles.rb_scaler14, 'visible', 'on')
if size(data.DenominatorPlot,2)>14.9 % Condition added for old .dat files
    if data.DenominatorPlot(1,15) == 1
        set(handles.rb_scaler14, 'value', 1)   
    end
end

set(handles.text15, 'visible', 'on')
set(handles.rb_scalerall, 'visible', 'on')

set(handles.rb_clearallscaler, 'visible', 'on')
set(handles.text31, 'visible', 'on')

set(handles.rb_scalerdefault, 'visible', 'on')
set(handles.text35, 'visible', 'on')

%turn on the save button & post process button
set(handles.pb_save_rawXAS, 'visible', 'on')
set(handles.pb_process_spectra, 'visible', 'on')
cla(handles.axes_postprocessed);

handles.XASfile = file;
handles.scalerdefault = scaler2plot;
cd(current)
guidata(hObject,handles)


%%%=================== Check Raw XAS spectrum =============================

% --- Executes on button press in pb_XAS_check.
function pb_XAS_check_Callback(hObject, eventdata, handles)
% hObject    handle to pb_XAS_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isfield(handles, 'data')
    h = msgbox('Upload a XAS file first');
    pause(5)
    delete(h)
    return
end

data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler2plot = data.NumeratorPlot;
    ind2plot = find(scaler2plot == 1);
    
file = handles.XASfile;
    
    hfig = figure;
    set(hfig, 'color','white')
    
    % Detect that scaler 0 is "on"; check the denominator
    if ind2plot(1) == 1 && data.DenominatorPlot(1,15) == 1
         a = Intensity{1,1}./Intensity{1,15};
         
         if size(a,1)>=3
           plot(energy, log(mean(a(1:3,:))), 'k', 'linewidth', 1)  
           hold on
           plot(energy, log(mean(a(size(a,1)-2:size(a,1),:))), 'r', 'linewidth', 1) 
         else
         plot(energy, log(mean(a)), 'k', 'linewidth', 1)
         end
         axis('auto')
         ax = gca;
         ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Transmission (a.u)', 'fontsize', 9, 'fontweight', 'bold')
        title(file(1:find(file == '.')-1),'fontsize', 9, 'interpreter','none')
        zoom on
        grid on
    else
        I= [];
        for j=1:size(ind2plot,2)
            k = ind2plot(j);
            a = Intensity{1,k}./Intensity{1,1};
            % Initial = average the 3 first lines of the qxas scan
            % End = average the 3 last lines of the qxas scan
            if size(a,1)>=3
                plot(energy, mean(a(1:3,:)), 'k', 'linewidth', 1)
                hold on
                plot(energy, mean(a(size(a,1)-2:size(a,1),:)), 'r', 'linewidth', 1)
            else
                plot(energy, mean(a(1:3,:)), 'k', 'linewidth', 1)
                hold on
            end
        end 
        axis('auto')
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u)', 'fontsize', 9, 'fontweight', 'bold')
        title(file(1:find(file == '.')-1),'fontsize', 9, 'interpreter','none')
        zoom on
        grid on     
    end
    
  leg={'First 3 lines', 'Last 3 lines'};
  legend(leg)

% Save the figure in the appropriate folder
current = cd;
cd(get(handles.edit_currentdirectory,'string'))
if exist([file(1:find(file == '.')-1),'_XAS'],'dir')
    cd([file(1:find(file == '.')-1),'_XAS'])
    saveas(hfig, [file(1:find(file == '.')-1),'_check.bmp'])
    cd(current)
else
    [SUCCESS,MESSAGE,MESSAGEID] = mkdir([file(1:find(file == '.')-1),'_XAS']);
    if SUCCESS == 1
        cd([file(1:find(file == '.')-1),'_XAS'])
        saveas(hfig, [file(1:find(file == '.')-1),'_check.bmp'])
        cd(current)
    else
        msgbox('Error in creating the directory')
        cd(current)
        return
    end
end

guidata(hObject,handles)


% function to open the XAS data file in .qx format;
% The output data is a cell with 2 elements:
% data.energy = energy range of the scans
% data.I = NbreOfScalers matrices.
% Each matrix has dimensions of NbreOfLines x Energy
function [data] = opentheselectedfile(file)

scaler ={};
I={};
    
fid = fopen(file);
if fid == -1
    msgbox('The file cannot be opened')
    return
else

    line = fgetl(fid); % title line
    line = fgetl(fid); % Date and time
    line = fgetl(fid); % stage position
       a = str2num(line(find(line=='=')+1:length(line)));
       Xposxas = a(1,1);
       Yposxas = a(1,2);
    line = fgetl(fid); % H, V slits
    line = fgetl(fid); % Regions
    line = fgetl(fid); % scan in set

    line = fgetl(fid); % points
    point = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid);
    NbreOfScalers = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid);
    line = fgetl(fid);
    NumeratorPlot = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid);
    DenominatorPlot = str2num(line(find(line=='=')+1:length(line)));
    for k=1:5
        line = fgetl(fid);
    end
    energy = str2num(line(find(line=='=')+1:length(line)));
    
    line = fgetl(fid);line = fgetl(fid);line = fgetl(fid);line = fgetl(fid);
    NbreOfLine = str2num(line(find(line=='=')+1:length(line)));
    
    for k=1:9
        line = fgetl(fid);
    end
    
    for i=1:NbreOfScalers
        i;
        line = fgetl(fid);
        scaler{i} = str2num(line(find(line=='[')+1));
        M=[];
        for k = 1: NbreOfLine
            line = fgetl(fid); 
            if ~isempty(line) && size(line,2)>20
            M = [M; str2num(line)];
            end
        end
        I{i} = M;
        line = fgetl(fid);
    end
    
    data.energy = energy;
    data.I = I;
    data.NumeratorPlot = NumeratorPlot;
    data.DenominatorPlot = DenominatorPlot;
    data.XasPos = [Xposxas, Yposxas];
end

% function to open the XAS data file in .dat format;
% The output data is a cell with 2 elements:
% data.energy = energy range of the scans
% data.I = NbreOfScalers matrices.
% Each matrix has dimensions of NbreOfLines x Energy
function [data] = opentheselectedfiledotdat(file)

scaler ={};
I={};
    
fid = fopen(file);
if fid == -1
    msgbox('The file cannot be opened')
    return
else

    line = fgetl(fid); % title line
    % line = fgetl(fid); % Date and time
    % line = fgetl(fid); % stage position
    %    a = str2num(line(find(line=='=')+1:length(line)));
    %    Xposxas = a(1,1);
    %    Yposxas = a(1,2);
    % line = fgetl(fid); % H, V slits
    line = fgetl(fid); % Regions
    line = fgetl(fid); % Scan in set
    line = fgetl(fid); % Points
        point = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid); % Scalers
        NbreOfScalers = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid); % Settling time
        Settlingtime = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid); % logplot
    line = fgetl(fid);
        NumeratorPlot = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid);
        DenominatorPlot = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid); % energy
        energy = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid); % Per region points
    line = fgetl(fid); % Times
    line = fgetl(fid); % Date and time
    line = fgetl(fid); % stage position
       a = str2num(line(find(line=='=')+1:length(line)));
        Xposxas = a(1,1);
        Yposxas = a(1,2);

    line = fgetl(fid); % H, V slits
    line = fgetl(fid); % Offsets
    %line = fgetl(fid); % Log (I0 gain)
    %NbreOfLine = str2num(line(find(line=='=')+1:length(line)));
    line = fgetl(fid); % Start of data block: Energy, time, counts 
    NbreOfLine = 2;
    M=[];
    i=1;
    while ~isequal(line,-1)
        i;
        line = fgetl(fid);
        if ~isempty(line) && size(line,2)>20
            M = [M; str2num(line)];
        end 
        i=i+1;
    end
    % M is a N x 30 matrix
    % the first column is the energy
    data.energy = M(:,1)';
    %the second column is the time
    data.time = M(:,2)';
    %column 3 to Nbre of scaler are the intensities.
    % to make them compatible to other data format, form a cell array I
    for k=1:size(M,2)-2
        I{k}=M(:,k+2)';
    end
    data.I = I;
    data.NumeratorPlot = NumeratorPlot;
    data.DenominatorPlot = DenominatorPlot;
    data.XasPos = [Xposxas, Yposxas];
end
% ---------------------------------------

%%%================== Scalers for XAS =====================================

% --- Executes on button press in rb_scaler0.
function rb_scaler0_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all the scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1 % plot the I0, not the other scaler
        hold off
            I0 = Intensity{1,1};
            plot(energy, mean(I0), 'k', 'linewidth', 1)
            hold on
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Io signal (a.u)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scaler are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
       
        % if some scalers are selected
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler1.
function rb_scaler1_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% find all scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
      
        % if some scalers are selected
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler2.
function rb_scaler2_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
     
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler3.
function rb_scaler3_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all the scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
       
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler4.
function rb_scaler4_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all the scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
    
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler5.
function rb_scaler5_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all the scalers already selected
  index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
    
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 10;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler6.
function rb_scaler6_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all the scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 10;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
   
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler7.
function rb_scaler7_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all scalers already selected
  index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
  
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler8.
function rb_scaler8_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all scalers already selected
  index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
  
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler9.
function rb_scaler9_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all the scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];
    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 10;
            xlabel('Energy (keV)', 'fontsize', 10, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 10, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
  
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler10.
function rb_scaler10_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all the scalers already selected
  index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
 
        % if some scalers are selected
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler11.
function rb_scaler11_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
  
        % if some scalers are selected
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scaler12.
function rb_scaler12_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% find all the scalers already selected
   index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
  
        % if some scalers are selected
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)


% --- Executes on button press in rb_scaler13.
function rb_scaler13_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
   
        % if some scalers are selected
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)


% --- Executes on button press in rb_scaler14.
function rb_scaler14_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scaler14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'),get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    
    if get(hObject,'Value') == 1
        hold off

        I = Intensity{1,1}./Intensity{1,15};
        plot(energy, log(mean(I)), 'k', 'linewidth', 1)
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
    end
    if get(hObject,'Value') == 0
        % clear the figure if all scalers are not selected
        if isequal(index, zeros(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
    
        % if some scalers are selected
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        zoom on
        grid on
        hold off
    end
guidata(hObject, handles)

% --- Executes on button press in rb_scalerall.
function rb_scalerall_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scalerall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value')];
    
index = ones(size(index)); % make all of them ones

axes(handles.axes_preprocessed);
data=handles.data;
energy = data.energy/1000;
Intensity = data.I;
scaler_select = find(index == 1);
if get(hObject,'Value') == 1
    hold off
    for j=1:size(scaler_select,2)
        k=scaler_select(j);
        I = Intensity{1,k}./Intensity{1,1};
        plot(energy, mean(I), 'k', 'linewidth', 1)
        hold on
    end
    ax = gca;
    ax.FontSize = 9;
    xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
    ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
    zoom on
    grid on
    hold off
    set(handles.rb_scaler0, 'value', 0)
   set(handles.rb_scaler1, 'value', 1)
   set(handles.rb_scaler2, 'value', 1)
   set(handles.rb_scaler3, 'value', 1)
   set(handles.rb_scaler4, 'value', 1)
   set(handles.rb_scaler5, 'value', 1)
   set(handles.rb_scaler6, 'value', 1)
   set(handles.rb_scaler7, 'value', 1)
   set(handles.rb_scaler8, 'value', 1)
   set(handles.rb_scaler9, 'value', 1)
   set(handles.rb_scaler10, 'value', 1)
   set(handles.rb_scaler11, 'value', 1)
   set(handles.rb_scaler12, 'value', 1)
end

if get(hObject,'Value') == 0
    if isequal(index, ones(size(index)))
            caxis=axis;
            hold off
            plot(0,1)
            ax = gca;
            ax.FontSize = 9;
            xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
            axis([caxis(1), caxis(2), caxis(3), caxis(4)])
            return
        end
end

guidata(hObject, handles)

% --- Executes on button press in rb_clearallscaler.
function rb_clearallscaler_Callback(hObject, eventdata, handles)
% hObject    handle to rb_clearallscaler (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes_preprocessed);
caxis = axis;
hold off
plot(0,0) % dummy plot
ax = gca;
ax.FontSize = 9;
xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
axis([caxis(1), caxis(2), caxis(3), caxis(4)])
           
   set(handles.rb_scaler0, 'value', 0)
   set(handles.rb_scaler1, 'value', 0)
   set(handles.rb_scaler2, 'value', 0)
   set(handles.rb_scaler3, 'value', 0)
   set(handles.rb_scaler4, 'value', 0)
   set(handles.rb_scaler5, 'value', 0)
   set(handles.rb_scaler6, 'value', 0)
   set(handles.rb_scaler7, 'value', 0)
   set(handles.rb_scaler8, 'value', 0)
   set(handles.rb_scaler9, 'value', 0)
   set(handles.rb_scaler10, 'value', 0)
   set(handles.rb_scaler11, 'value', 0)
   set(handles.rb_scaler12, 'value', 0)
   set(handles.rb_scalerall, 'value', 0)
   
   set(hObject, 'value', 0) % reset the value of the button to 0
guidata(hObject, handles)


% --- Executes on button press in rb_scalerdefault.
function rb_scalerdefault_Callback(hObject, eventdata, handles)
% hObject    handle to rb_scalerdefault (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
set(handles.rb_scaler0, 'value', 0)
set(handles.rb_scaler1, 'value', 0)
set(handles.rb_scaler2, 'value', 0)
set(handles.rb_scaler3, 'value', 0)
set(handles.rb_scaler4, 'value', 0)
set(handles.rb_scaler5, 'value', 0)
set(handles.rb_scaler6, 'value', 0)
set(handles.rb_scaler7, 'value', 0)
set(handles.rb_scaler8, 'value', 0)
set(handles.rb_scaler9, 'value', 0)
set(handles.rb_scaler10, 'value', 0)
set(handles.rb_scaler11, 'value', 0)
set(handles.rb_scaler12, 'value', 0)
set(handles.rb_scalerall, 'value', 0)

scaler2plot = handles.scalerdefault;
ind2plot = find(scaler2plot == 1);
index = scaler2plot(1:13);

    axes(handles.axes_preprocessed);
    data=handles.data;
    energy = data.energy/1000;
    Intensity = data.I;
    scaler_select = find(index == 1);
    if iscell(handles.XASfile)
        handles.XASfile = handles.XASfile{1};
    end
    
    if get(hObject,'Value') == 1
        hold off
        for j=1:size(scaler_select,2)
            k=scaler_select(j);
            I = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(I), 'k', 'linewidth', 1)
            hold on
            set(eval(['handles.rb_scaler',num2str(k-1)]), 'value', 1); % because scaler k is the k+1 component since starts at scaler0=1st
        end
        ax = gca;
        ax.FontSize = 9;
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 9, 'fontweight', 'bold')
        title(handles.XASfile(1:find(handles.XASfile == '.')-1),'fontsize', 9, 'interpreter','none')
        zoom on
        grid on
        hold off
        set(handles.rb_scalerall, 'value', 0)
        set(handles.rb_clearallscaler, 'value', 0)
        set(hObject, 'value', 0)
    end
    
guidata(hObject, handles)

%%%====================== StackPlot Raw XAS ===============================

% --- Executes on button press in pb_stackplotraw.
function pb_stackplotraw_Callback(hObject, eventdata, handles)
% hObject    handle to pb_stackplotraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = cd;
offset = str2double(get(handles.edit_stackplotraw,'string'));

if isfield(handles, 'stackplotlastdir')
    cd(handles.stackplotlastdir)
end

[files, pathname] = uigetfile('*.qx; *.dat', 'Select MULTIPLE qx or dat  files','multiselect','on');
    
    if isequal(files,0) || isequal(pathname,0)
       h=msgbox('Upload cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end
    
    if~iscell(files)
        h= msgbox('Please select multiple files');
        pause(5)
        cd(current)
        delete(h)
        return
    end
    
    handles.XASfiles = files;
    set(handles.edit_currentdirectory, 'string', pathname);
    
    for p = 1: size(files,2)
        file=files{1,p};
        % if the file is .qx
       ex = file(1,find(file == '.',1)+1:find(file == '.',1)+2);
       if ex == 'qx'
            data = opentheselectedfile([pathname, file]);
       else
            data = opentheselectedfiledotdat([pathname, file]);
       end

        energy = data.energy/1000;
        Intensity = data.I;
        scaler2plot = data.NumeratorPlot;
        ind2plot = find(scaler2plot == 1); 
        
        if p==1 % used later on lines below
            data1=data;
            scaler2plot1= scaler2plot;
        end
        
        % Detect that scaler 0 is "on"; check the denominator
        if ind2plot(1) == 1 && data.DenominatorPlot(1,15) == 1
             eval(['a_',num2str(p),' = Intensity{1,1}./Intensity{1,15};'])
        else
            I= [];
            for j=1:size(ind2plot,2)
                w = ind2plot(j);
                eval(['a_',num2str(p),' = Intensity{1,w}./Intensity{1,1};'])
            end 
        end   
    end

    % plot the raw xas files with offset
    hfigstackraw = figure;
    set(hfigstackraw,'color','white')
    leg={}; % this is the legend
    for k = 1: size(files,2)
        if ex == 'qx'
           plot(energy, mean(eval(['a_',num2str(k)]))+(k-1)*offset)
           hold on
           leg{k} = handles.XASfiles{k};
        else
           plot(energy, eval(['a_',num2str(k)])+(k-1)*offset)
           hold on
           leg{k} = handles.XASfiles{1,k};
        end
    end
    ax = gca;
    ax.FontSize = 10;
    ax = axis;
    xlabel('Energy (keV)', 'fontsize', 10, 'fontweight', 'bold')
    ylabel('Absorption (a.u.)', 'fontsize', 10, 'fontweight', 'bold')
    legend(leg,'interpreter', 'none', 'Location', 'SouthEast')


% Save the stack raw plot figure as bmp
cd(pathname)
S=dir;
name = 'Stack_plot_Raw_';
N = size(dir(['*',name,'*']),1);
saveas(hfigstackraw, [name, num2str(N+1),'.bmp'])
cd(current)
handles.stackplotlastdir = pathname;
guidata(hObject, handles)

%%%=========== Process XAS spectra and LSQ fitting ========================

% --- Executes on button press in pb_process_spectra.
function pb_process_spectra_Callback(hObject, eventdata, handles)
% hObject    handle to pb_process_spectra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(findobj('name','option fit selection'));
cla(handles.axes_postprocessed);
axes(handles.axes_postprocessed);
set(handles.axes_postprocessed, 'visible', 'on');
set(handles.text5, 'visible', 'on')

data=handles.data;

if iscell(handles.XASfile)
 handles.XASfile = handles.XASfile{1};
end
    
energy = data.energy/1000;
Intensity = data.I;
scaler2plot = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value'), get(handles.rb_scaler13, 'value'),...
        get(handles.rb_scaler14, 'value')];
ind2plot = find(scaler2plot == 1);

if isempty(ind2plot)
    msgbox('NO SCALER SELECTED')
    return
end

% Glitch input and XAS spectra energy calibration
if get(handles.rb_singlefile, 'value')==1 % single file uplod
    if size(Intensity{1},1)>1 % condition added to deal with old .dat files
        Io = mean(Intensity{1}); % scaler 0
    else
        Io = Intensity{1}; % scaler 0
    end
else  % multifile upload, needs to deal with average
    Io = Intensity;
end

    Ioglitch = str2num(get(handles.edit10,'string')); % Glitch energy in eV
    
    if Ioglitch < min(data.energy) || Ioglitch > max(data.energy)
        h= msgbox('Change the Io glitch value');
        pause(5)
        delete(h)
        return
    end
    glitchsearchrange=6;
    Iomins = Ioglitch-glitchsearchrange;
    Iomaxs = min(Ioglitch+glitchsearchrange,max(data.energy));
    Iomin_index = find(data.energy > Iomins, 1);
    Iomax_index = find(data.energy >= Iomaxs, 1);
    Iotemp = Io(1,Iomin_index:Iomax_index);
    etemp = 1000*energy(1,Iomin_index:Iomax_index);
   
    %find the Io dip in the spectrum
    % fit the Iotemp with a polynome of degree p
    a1 = min(etemp);
    a2 = max(etemp);
    estar = a1:(a2-a1)/100 : a2;
    etempval = interp1(etemp,Iotemp, estar, 'pchip');
    eglitch = estar(find(etempval == min(etempval)));
    
    % Set the correction in energy
    Eshift = (eglitch - Ioglitch);
    
    % Plot the graphs that show the glitch before and after correction
        close(findobj('name','glitch'))
     hglitch = figure('name', 'glitch');
        set(hglitch,'color', 'white')
        movegui(hglitch, 'south')
        plot(energy, Io,'k'); hold on
        plot(estar/1000,etempval,'b')
        plot(energy - Eshift/1000, Io,'r')
        legend({'raw Io', 'local min search', 'Io shifted'})
        xlabel('Energy (keV)')
        ylabel('Io (a.u.)')
        title('Energy calibration')
a=1;

% Shift the energy by the value determined just above Eshift
energypreshift = energy;
energy = energy - Eshift/1000;

axes(handles.axes_postprocessed);
if get(handles.rb_multipleload,'value')==0 % single file - no average
    I= [];
    if size(ind2plot,2)>1.5 && size(ind2plot,2) < 14.9
        for j=1:size(ind2plot,2)
          k = ind2plot(j);
          a = Intensity{1,k}./Intensity{1,1};
          I = [I; mean(a)];
        end 
        spec = mean(I);
        plot(energy, spec, 'k', 'linewidth', 1)
    elseif size(ind2plot,2)==1 && ind2plot < 14.5
        for j=1:size(ind2plot,2)
          k = ind2plot(j);
          a = Intensity{1,k}./Intensity{1,1};
          if size(a,1)>1
            I = mean(a);
          else
            I=a;
          end
        end 
        spec = I;
        plot(energy, spec, 'k', 'linewidth', 1)
    else
        I = log(Intensity{1,1}./Intensity{1,ind2plot});
        spec = mean(I);
        plot(energy, spec, 'k', 'linewidth', 1)
    end
else  % Multifiles selected - plot the average and do analysis on the average
     spec = handles.XASAbsAv;
     plot(energy, spec, 'k', 'linewidth', 1)
end

axis('auto');
ax = axis;
axis([ax(1), ax(2), min(spec)-0.05, ax(4)])
ax = gca;
ax.FontSize = 9;
xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
ylabel('Normalized Absorption', 'fontsize', 9, 'fontweight', 'bold')
zoom on
hold on

  % Plot the graphs that show the raw spectrum before and after energy correction
        close(findobj('name','Raw spectrum after energy calibration'))
        hspeccalib = figure('name', 'Raw spectrum after energy calibration');
        set(hspeccalib,'color', 'white')
        movegui(hspeccalib, 'southwest')
        plot(energypreshift, spec,'k'); hold on
        plot(energy, spec,'r')
        legend({'raw spectrum', 'raw spectrum after energy calibration'})
        title('Energy calibration')
        xlabel('Energy (keV)')
        ylabel('Absorption (a.u.)')
    
  %Make again the following axes current      
  axes(handles.axes_postprocessed);

% Button menu to select pre-edge fit
ButtonName = questdlg('What pre-edge fit to use', ...
                         'Fit selection', ...
                         'Elastic', 'Polynomial degree 12', 'Transmission', 'Elastic');
                     
   if isempty(ButtonName)
       return
   end
   
   switch ButtonName
     case 'Polynomial degree 12'
       ch=1;
     case 'Elastic'
       ch=2;
     case 'Transmission'
       ch=3;
   end 


% Pre-edge background substraction in case of single file selected
if get(handles.rb_multipleload,'value')==0 % single file - no average
    if size(I,1)>1
        spec = mean(I);
    else
        spec = I;
    end
else  % multiple file selected
        spec = spec;
end

if size(spec,2)>200
    ind_edgetop = find(spec == max(spec(1:200)));
else
    ind_edgetop = find(spec == max(spec(1:100)));
end

if ch==3
    transdiff = diff(spec(:,1:150));
    ind_edgetop = find(transdiff == max(transdiff));
end

% Pre-edge up to a cutoff value in eV before the white line peak (default = 25 eV)
% value for preedge cutoff is tabulted in element_absorption
cutoff = str2double(get(handles.ed_predgecutoff, 'string'));
Eabs = element_absorption;
El = get(handles.ed_element,'string');
 if isempty(El)
        msgbox('Enter an element')
        return
 end
indel = strfind(Eabs(:,1),El);
indel = find(not(cellfun('isempty',indel)));
energy_edgetop = Eabs{indel,2};
ind_preedge = find(data.energy > energy_edgetop - cutoff,1);
preedge_max = energy(ind_preedge);
%------------------------------------

xval = energy(1:ind_preedge-1);
 
 if ch == 1 % polynome degree 12
    [yfit, S, mu] = polyfit(energy(1:ind_preedge-1), spec(1:ind_preedge-1), 12);
    yval = polyval(yfit, xval, [], mu);
 end 

 if ch == 2 % elastic
    %for pre-edge with a + b/(Eo-E) + c/(E-EF)^2
    enval = energy(1:ind_preedge-1);
    Eabs = element_absorption;
    Efluo = element_fluorescence;
    
    % Determine the values of E0 & EF by selecting the element from a list
    [Ele,OK] = listdlg('PromptString','Select the element:',...
                          'SelectionMode','single',...
                          'ListString',Eabs(:,1));
    if ~OK == 1
       msgbox('Invalid selection')
        return
    end
    E0 = Eabs{Ele,2};
    Element = Eabs{Ele,1};
    trouve = 0; % find if the element is in the list
    for q = 1:size(Efluo,1)
         if Efluo{q,1} == Eabs{Ele, 1}
             Ef = Efluo{q,2};
             trouve =1;
         end
    end
    if trouve == 0
        h = msgbox('Element not found in the Fluorescence emission table');
        pause(5)
        delete(h)
        return
    end

    %finding the optimal cutoff to minimize the fit error
    %from the input cutoff value, look at an energy range +/- 15 ev to find
    %the optimum cutoff
    cutoff = str2double(get(handles.ed_predgecutoff, 'string'));
    rangetest = -15:20;
    %ensure, dont encroach in E0 which will make the fit infinite
    usethisrange = find((energy_edgetop/1000 + cutoff +rangetest)>0,1);
    rangetest =  rangetest(1,usethisrange:size(rangetest,2));
    
    Delta =[];
    for q=1:size(rangetest,2)
        c = cutoff + rangetest(q);
        ind_preedge = find(data.energy > energy_edgetop - c,1);
        preedge_max = energy(ind_preedge);
        xvalt = energy(1:ind_preedge-1);
        envalt = energy(1:ind_preedge-1);
        MatT = [ones(1,size(envalt,2));1./(E0/1000-envalt); 1./(Ef/1000-envalt).^2];
        F = lsqnonneg(MatT', spec(1:ind_preedge-1)');
        yvalt = F(1,1)*MatT(1,:)+F(2,1)*MatT(2,:)+F(3,1)*MatT(3,:);

        %here xvalt and yvalt are the result of the fit over the data for
        %the pre-edge at cutoff+c. Get the NNS2 value
        u=spec(1:ind_preedge-1);
        NSS2 = sum((u - yvalt).^2)/sum(u.^2);
        Delta=[Delta, NSS2];
    end
    mm=find(Delta==min(Delta)); 
    mm=min(mm); % in case two indexes have the same minimization value
    cutoff = cutoff + rangetest(mm); % this is the value of the cutoff shift that minimizes the pre-edge fit
    % use the optimal cutoff to refit the pre-edge
    set(handles.ed_predgecutoff, 'string',num2str(cutoff));
    ind_preedge = find(data.energy > energy_edgetop - cutoff,1);
    preedge_max = energy(ind_preedge);
    xval = energy(1:ind_preedge-1);
    enval = energy(1:ind_preedge-1);
   
    % proceed with the fit
    MatT = [ones(1,size(enval,2));1./(E0/1000-enval); 1./(Ef/1000-enval).^2];
    F = lsqnonneg(MatT', spec(1:ind_preedge-1)');
    yval = F(1,1)*MatT(1,:)+F(2,1)*MatT(2,:)+F(3,1)*MatT(3,:);
    plot(enval, yval, 'r', 'linewidth', 1)

    %for display only - extend fit to larger energy range
    envalex = energy(1:ind_preedge+100);
    MatTex = [ones(1,size(envalex,2));1./(E0/1000-envalex); 1./(Ef/1000-envalex).^2];
    yvalex = F(1,1)*MatTex(1,:)+F(2,1)*MatTex(2,:)+F(3,1)*MatTex(3,:);
 end
 
 if ch == 3 % Transmission fit: linear fit to pre-edge aE^-2.7+b
 %finding the optimal cutoff to minimize the fit error
    %from the input cutoff value, look at an energy range +/- 15 ev to find
    %the optimum cutoff
    cutoff = str2double(get(handles.ed_predgecutoff, 'string'));
    rangetest = -15:15;
    %ensure, dont encroach in E0 which will make the fit infinite
    usethisrange = find((energy_edgetop/1000 + cutoff +rangetest)>0,1);
    
    Delta =[];
    for q=1:size(rangetest,2)
        c = cutoff + rangetest(q);
        ind_preedge = find(data.energy > energy_edgetop - c,1);
        preedge_max = energy(ind_preedge);
        rescale_energy = energy(1:ind_preedge-1).^-2.7;
        [yfit, S, mu] = polyfit(rescale_energy, spec(1:ind_preedge-1), 1);
        xvalt = energy(1:ind_preedge-1);
        yvalt = polyval(yfit, xvalt.^-2.7, [], mu);

        %here xvalt and yvalt are the result of the fit over the data for
        %the pre-edge at cutoff+c. Get the NNS2 value
        u=spec(1:ind_preedge-1);
        NSS2 = sum((u - yvalt).^2)/sum(u.^2);
        Delta=[Delta, NSS2];
    end
    mm=find(Delta==min(Delta)); 
    cutoff = cutoff + rangetest(mm); % this is the value of the cutoff shift that minimizes the pre-edge fit
    % use the optimal cutoff to refit the pre-edge
    set(handles.ed_predgecutoff, 'string',num2str(cutoff));
    ind_preedge = find(data.energy > energy_edgetop - cutoff,1);
    preedge_max = energy(ind_preedge);
    xval = energy(1:ind_preedge-1);
   
    % proceed with the fit

    rescale_energy = energy(1:ind_preedge-1).^-2.7;
    [yfit, S, mu] = polyfit(rescale_energy, spec(1:ind_preedge-1), 1);
    yval = polyval(yfit, xval.^-2.7, [], mu);
    %for display only
    specdisplay = polyval(yfit, energy.^-2.7, [], mu);
 end 

%----
% open the pre-edge fit in a new window
close(findobj('name','PreFit'));
hprefit = figure('name', 'PreFit');
set(hprefit,'color', 'white')
movegui(hprefit, 'west')
%set(gcf,'color', 'white')
plot(energy, spec,'k','linewidth',2)
hold on
if ch == 1
    plot(xval, yval,'r')
    hold on
    title('Pre-edge fit - Polynomial 12', 'fontsize', 9, 'fontweight', 'bold')
elseif ch==2
    plot(enval, yval, 'r', 'linewidth', 1)
    hold on
   % plot(envalex, yvalex, '--r', 'linewidth', 1)
    title('Pre-edge fit - Elastic', 'fontsize', 9, 'fontweight', 'bold')
else
    plot(xval, yval,'r')
    hold on
    plot(energy,specdisplay,'--r' )
    title('Pre-edge fit - Transmission', 'fontsize', 9, 'fontweight', 'bold')
end
ax = gca;
ax.FontSize = 9;
xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
ylabel('Absorption', 'fontsize', 9, 'fontweight', 'bold')
zoom on
grid on
figure(hprefit)
pause(3)

axes(handles.axes_postprocessed);
% Replot spectra pre-edge background substracted
hold off
spec(1:ind_preedge-1) = spec(1:ind_preedge-1)-yval;
spec(ind_preedge: size(spec,2)) = spec(ind_preedge:size(spec,2))-yval(1,size(yval,2)); % offset by last value of pre-edge fit
plot(energy, spec, 'k', 'linewidth', 2)
ax = gca;
ax.FontSize = 9;
xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
ylabel('Absorption', 'fontsize', 9, 'fontweight', 'bold')
zoom on
hold on

%----End of pre-edge background substraction

% post-edge normalization, starting past the white line peak
% energy_crop = str2double(get(handles.ed_postedge,'string'));
% ind_crop = find(data.energy > energy_crop,1);

% In case energy is out of whack
%if isequal(ind_crop, 1) || isempty(ind_crop)
    %[energy, spec]; vector energy is in keV
    Cutoff = str2double(get(handles.ed_postedge,'string')); 
    if ch==3 % for the transmission spectrum only
        % Eabs = element_absorption; % used for postedge fit below
        % Edgetest = cell2mat(Eabs(:,2));
        % esearchwindow=100; %energy window around the band edge in eV
        % peakchmin=find(diff(spec)>0.4*max(diff(spec)),1);
        % energysearchpeakmin = energy(peakchmin);
        % peakchmax = find(energy>energy(peakchmin)+esearchwindow/1000,1);
        % esearch = energy(peakchmin:peakchmax);
        % ind_edgetop = find(spec(peakchmin:peakchmax) == max(spec(peakchmin:peakchmax)));
        % energy_edgetop = esearch(ind_edgetop)*1000; 
        % %Select among entries of absorption table, the value that is the closest to energy_edgetop
        % sq = (Edgetest-energy_edgetop).^2;
        % %rename energy_edgetop to the energy of the absorption value from
        % %the abs table
        % energy_edgetop = Eabs{find(sq==min(sq)),2};
        % ind_crop = find(data.energy > energy_edgetop + Cutoff,1);
        Eabs = element_absorption; % used for post-edge fit below
        El = get(handles.ed_element,'string');
        indel = strfind(Eabs(:,1),El);
        indel = find(not(cellfun('isempty',indel)));
        energy_edgetop = Eabs{indel,2};
        ind_crop = find(data.energy > energy_edgetop + Cutoff,1);
      
 
    else % for non-transmission data
        % ind_edgetop = find(spec == max(spec));
        % energy_edgetop = data.energy(ind_edgetop); 
        % ind_crop = find(data.energy > energy_edgetop + Cutoff,1); 
        % Eabs = element_absorption; % used for postedge fit below
        % Edgetest = cell2mat(Eabs(:,2));
        % esearchwindow=30; %energy window around the band edge in eV
        % peakchmin=find(diff(spec)>0.4*max(diff(spec)),1);
        % energysearchpeakmin = energy(peakchmin);
        % peakchmax = find(energy>energy(peakchmin)+esearchwindow/1000,1);
        % esearch = energy(peakchmin:peakchmax);
        % ind_edgetop = find(spec(peakchmin:peakchmax) == max(spec(peakchmin:peakchmax)));
        % energy_edgetop = esearch(ind_edgetop)*1000; 
        % %Select among entries of absorption table, the value that is the closest to energy_edgetop
        % sq = (Edgetest-energy_edgetop).^2;
        % %rename energy_edgetop to the energy of the absorption value from
        % %the abs table
        % energy_edgetop = Eabs{find(sq==min(sq)),2};
        Eabs = element_absorption; % used for postedge fit below
        El = get(handles.ed_element,'string');
        indel = strfind(Eabs(:,1),El);
        indel = find(not(cellfun('isempty',indel)));
        energy_edgetop = Eabs{indel,2};
        ind_crop = find(data.energy > energy_edgetop + Cutoff,1);
    end
%end

postenergy = energy(ind_crop:size(energy,2));
postspec = spec(ind_crop:size(energy,2));
plot(postenergy, postspec,'k'); hold on

% isolate the oscillations and polynomial fit of degree N through
% postspec_crop = postspec(1,1:round(size(postspec,2)/3));
% indps = find(diff(postspec_crop) == max(diff(postspec_crop)));
% indps = indps+3;
indps=1;
plot(postenergy(indps:size(postspec,2)), postspec(indps:size(postspec,2)),'y'); hold on
N = 2;
xval = postenergy(indps:size(postspec,2));
[yfit, S, mu] = polyfit(postenergy(indps:size(postspec,2)), postspec(indps:size(postspec,2)), N);
yval = polyval(yfit, xval, [], mu);
plot(xval, yval,'r')

% Extend the polyfit coefficient to the entire range - for display only
wrenergy = energy;
wryval = polyval(yfit, wrenergy, [], mu);
plot(wrenergy, wryval,'--r')
grid on

% open the post-edge fit in a different window
close(findobj('name','PostFit'));
hpostfit = figure('name', 'PostFit');
set(gcf,'color', 'white')
movegui(hpostfit, 'northwest')
plot(energy, spec,'k','linewidth',2)
hold on
plot(postenergy(indps:size(postspec,2)), postspec(indps:size(postspec,2)),'y'); hold on
plot(xval, yval,'r')
plot(wrenergy, wryval,'--r')
ax = gca;
ax.FontSize = 9;
xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
ylabel('Absorption', 'fontsize', 9, 'fontweight', 'bold')
zoom on
grid on
figure(hpostfit)
pause(3)

%assemble both parts
% b is the vector with flat slope
b = (postspec(indps:size(postspec,2))- yval)+yval(1,1);
spec(size(spec,2)-size(b,2)+1:size(spec,2)) = b;
% set post-edge to 1
rescale = mean(b);
spec = spec/mean(b);

% Over-absorption correction of spectrum
if get(handles.rb_oa, 'value') == 1
    a = str2double(get(handles.ed_oa,'string')); %a = overabs factor
    if a >=0 && a <=1
    spec = spec./(a+1-spec*a);
    else
        msgbox('a must be between 0 and 1')
        return
    end
end

cla(handles.axes_postprocessed);
axes(handles.axes_postprocessed);
hp = plot(energy, spec,'color', 'k', 'linewidth', 1);
xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
ylabel('Normalized Absorption', 'fontsize', 9, 'fontweight', 'bold')
if get(handles.rb_multipleload,'value')==0 % save single file corrected
    if get(handles.rb_oa, 'value') == 1
    title([handles.XASfile(1:find(handles.XASfile == '.')-1), '_oa=',num2str(a)],'fontsize', 9, 'interpreter','none')
    else
    title(handles.XASfile(1:find(handles.XASfile == '.')-1),'fontsize', 9, 'interpreter','none')
    end
else
    name_ext = [];
    ind = find(handles.XASfileAv{1,1} == '.');
    for p = 1:size(handles.XASfileAv,2)
        nn=handles.XASfileAv{1,p};
        name_ext = [name_ext, nn(1,ind-4:ind-1)];
    end
 
    if get(handles.rb_oa, 'value') == 1
    title([nn(1:ind-5),'_av',name_ext, '_oa=',num2str(a)],'fontsize', 8, 'interpreter','none')
    else
    title([nn(1:ind-5),'_av',name_ext],'fontsize', 8, 'interpreter','none')
    end
end

zoom on
hold on
grid on
ax = axis;
axis([ax(1), ax(2), min(spec)-0.05, ax(4)])

handles.data.processedspec = [energy; spec]';
handles.data.Eshift = Eshift;

% call the XAS standards
SM = StandardMatrix(handles.standard_pathname,preedge_max);

if isempty(SM.data)
    % Button menu to select pre-edge fit
    res = questdlg('Do you want to save the processed spectrum', ...
                         'Save selection', ...
                         'Yes', 'No', 'Yes');                  
   if isempty(res)
       handles.data.processedspec = [energy; spec]';
       handles.data.Eshift = Eshift;
       guidata(hObject, handles)
       return
   end
   
   switch res
       case 'Yes'
       savech=1;
     case 'No'
       savech=2;
   end 
  current = cd;
    if savech == 1
        guidata(hObject, handles)
        % plot and save figure by creating a temporary ghost copy of hp
        hptemp=figure;
        set(hptemp, 'name', 'temp','color','white','visible','off')
        plot(energy, spec,'color', 'k', 'linewidth', 1);
        xlabel('Energy (keV)', 'fontsize', 9, 'fontweight', 'bold')
        ylabel('Normalized Absorption', 'fontsize', 9, 'fontweight', 'bold')
        if get(handles.rb_multipleload,'value')==0 
            title(handles.XASfile(1:find(handles.XASfile == '.')-1),'fontsize', 9, 'interpreter','none')
        else
            name_ext = [];
            ind = find(handles.XASfileAv{1,1} == '.');
            for p = 1:size(handles.XASfileAv,2)
                nn=handles.XASfileAv{1,p};
                name_ext = [name_ext, nn(1,ind-4:ind-1)];
            end
            if get(handles.rb_oa,'value')==0
               title([nn(1:ind-5),'_avg',name_ext],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none')
            else
                title([nn(1:ind-5),'_avg',name_ext,'_a=',num2str(get(handles.ed_oa,'string'))],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none')
            end

        end
        zoom on
        hold on
        grid on
        ax = axis;
        axis([ax(1), ax(2), min(spec)-0.05, ax(4)])

        %check if the directory to save the figure and excel file exist, if not create it.
        current = cd;
        cd(get(handles.edit_currentdirectory,'string'))
       if get(handles.rb_multipleload,'value')==0 % save single file corrected
            if exist([handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS'],'dir')
                cd([handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS'])
            else
                [SUCCESS,MESSAGE,MESSAGEID] = mkdir([handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS']);
                if SUCCESS == 1
                    cd([handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS'])
                else
                    msgbox('Error in creating the directory')
                    cd(current)
                    return
                end
            end

            % Save experimental processed XANES spectrum then delete the figure
            if get(handles.rb_oa, 'value') == 1
            saveas(hptemp, [handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed_oa=',num2str(get(handles.ed_oa, 'string')),'.bmp'])
            else
            saveas(hptemp, [handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed.bmp'])
            end
           delete(hptemp)
            % Save experimental XANES spectrum
            S = array2table([1000*energy; spec]');
            S.Properties.VariableNames(1:2) ={'Energy (eV)','Normalized Absorption'};
            if get(handles.rb_oa, 'value') == 1
             writetable(S,[handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed_oa=',num2str(get(handles.ed_oa, 'string')),'.xls']) 
             writetable(S,[handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed_oa=',num2str(get(handles.ed_oa, 'string')),'.txt'])
            else
             writetable(S,[handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed.xls'])
             writetable(S,[handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed.txt'])
            end
            cd(current)
       else  % save multispectra average - process spectrum            
            name_ext = [];
            for p = 1:size(handles.XASfileAv,2)
                nn=handles.XASfileAv{1,p};
                name_ext = [name_ext, nn(1,ind-4:ind-1)];
            end

        if exist([nn(1:ind-5),name_ext,'_XAS_average'],'dir')
                cd([nn(1:ind-5),name_ext,'_XAS_average'])
            else
                [SUCCESS,MESSAGE,MESSAGEID] = mkdir([nn(1:ind-5),name_ext,'_XAS_average']);
                if SUCCESS == 1
                    cd([nn(1:ind-5),name_ext,'_XAS_average'])
                else
                    msgbox('Error in creating the directory')
                    cd(current)
                    return
                end
            end

            % Save experimental processed XANES spectrum then delete the figure
            if get(handles.rb_oa, 'value') == 1
            saveas(hptemp, [nn(1:ind-5),name_ext,'_processed_avg_oa=',num2str(get(handles.ed_oa,'string')),'.bmp'])
            else
            saveas(hptemp, [nn(1:ind-5),name_ext,'_processed_avg.bmp'])
            end
           delete(hptemp)
            % Save experimental XANES spectrum
            S = array2table([1000*energy; spec]');
            S.Properties.VariableNames(1:2) ={'Energy (eV)','Normalized Absorption'};
            if get(handles.rb_oa, 'value') == 1
             writetable(S,[nn(1:ind-5),name_ext,'_processed_avg_oa=',num2str(get(handles.ed_oa, 'string')),'.xls'])   
             writetable(S,[nn(1:ind-5),name_ext,'_processed_avg_oa=',num2str(get(handles.ed_oa, 'string')),'.txt']) 
            else
             writetable(S,[nn(1:ind-5),name_ext,'_processed_avg.xls'])
             writetable(S,[nn(1:ind-5),name_ext,'_processed_avg.txt'])
            end
            cd(current)
       end
    else
        handles.data.processedspec = [energy; spec]';
        handles.data.Eshift = Eshift;
        guidata(hObject, handles)
    end
   cd(current)
    return
end

%Start LSQ fittings
Component_Name = SM.component;
SM = SM.data;
Energyscale = SM(:,1)/1000; 
SM = SM(:,2:size(SM,2));

% set the energy values of the experimental to the ones of the standards
Unknown = spline(energy, spec,Energyscale);

% LSQ fitting, Out of the N spectra in the standard folder, make any combination of Q standards and check the
% lsqnonneg fitvalue, best combo is the one that minimizes the square 2-norm of the residuals;

% Create all permutations possible of Q elements from a list of all standards;
Q=inputdlg('HOW MANY STANDARDS TO USE: 1,2, 3 OR 4 ?');
    if isempty(Q)
        msgbox('Canceled by user')
        return
    end
Q=str2num(cell2mat(Q));
    if Q<1 || Q>4
        msgbox('The number of standards must be 1, 2, 3 or 4 maximum')
        return
    end
P=nchoosek([1:size(SM,2)], Q);
P=reshape(P(:,perms(1:Q)),[], Q);
P=P(1:size(P,1)/factorial(Q),:); % these are the unique combinations

FitVect =[];
Resnorm = [];
Residual = [];
for w = 1: size(P,1)
    if size (P,2)== 4
        SMselect = [SM(:, P(w,1)),SM(:, P(w,2)),SM(:, P(w,3)),SM(:, P(w,4))];
    elseif size(P,2) == 3
        SMselect = [SM(:, P(w,1)),SM(:, P(w,2)),SM(:, P(w,3))];
    elseif size(P,2) == 2
        SMselect = [SM(:, P(w,1)),SM(:, P(w,2))];
    else
        SMselect = [SM(:, P(w,1))];
    end
    [F,R,Res] = lsqnonneg(SMselect,Unknown);
    FitVect=[FitVect, F];
    Resnorm =[Resnorm; w, R];
    Residual =[Residual, Res];
end

% find the 5 top combo with the lowest Resnorm value
Resnorm = sortrows(Resnorm, 2,'ascend');
Combo = Resnorm(1:5, 1);
combo = Combo(1);


if Q == 4
    for choice = 1:5
        eval(['BfOptimized',num2str(choice), '= FitVect(:,Combo(choice))''','*[SM(:, P(Combo(choice),1)),SM(:, P(Combo(choice),2)),SM(:, P(Combo(choice),3)),SM(:, P(Combo(choice),4)) ]'';']);   
        ind = P(Combo(choice),:); 
        Component_Name(ind); 
        Percent = round(1000*FitVect(:,Combo(choice))./(sum(FitVect(:,Combo(choice)))))/10; % Percentage of the components
        NSS = sum((Unknown'-eval(['BfOptimized',num2str(choice)])).^2)/sum(Unknown.*Unknown);
        screen_size = get(0,'screensize');
        if choice == 1
            hfigchoice = figure; 
        else
            figure(hfigchoice)
        end
        set(gcf,'name','option fit selection', 'color', 'white', 'position', [screen_size(1,1), 0.1*screen_size(1,4), 0.35*screen_size(1,3), 0.81*screen_size(1,4)])  
        subplot(3,2,choice); plot(energy, spec,'color', 'k', 'linewidth', 1); 
        title(['Best LSQ fit ', num2str(choice), ' - NSS= ', num2str(NSS)], 'fontsize', 10, 'fontweight', 'bold')
        xlabel('Energy (keV)', 'fontsize', 10, 'fontweight', 'bold')
        ylabel('Normalized Absorption', 'fontsize', 10, 'fontweight', 'bold')
        zoom on
        hold on
        grid on
        ax = axis;
        plot(Energyscale, eval(['BfOptimized',num2str(choice)]),'r', 'linewidth', 1);
        plot(Energyscale, Unknown-eval(['BfOptimized',num2str(choice)])','b', 'linewidth', 1);
        axis([ax(1), ax(2), min(spec)-0.05, inf])
        text(ax(1)+(ax(2)-ax(1))/3,0.5,Component_Name(ind),'fontsize',8)
        text(ax(1)+0.9*(ax(2)-ax(1)), 0.5, num2cell(Percent'), 'fontsize',8)

    end
elseif Q == 3
    for choice = 1:5
        eval(['BfOptimized',num2str(choice), '= FitVect(:,Combo(choice))''','*[SM(:, P(Combo(choice),1)),SM(:, P(Combo(choice),2)),SM(:, P(Combo(choice),3))]'';']);   
        ind = P(Combo(choice),:);
        Component_Name(ind); 
        Percent = round(1000*FitVect(:,Combo(choice))./(sum(FitVect(:,Combo(choice)))))/10; 
        NSS = sum((Unknown'-eval(['BfOptimized',num2str(choice)])).^2)/sum(Unknown.*Unknown);
        screen_size = get(0,'screensize');
        if choice == 1
            hfigchoice = figure; 
        else
            figure(hfigchoice)
        end
        set(gcf,'name','option fit selection', 'color', 'white', 'position', [screen_size(1,1), 0.1*screen_size(1,4), 0.35*screen_size(1,3), 0.81*screen_size(1,4)])
        subplot(3,2,choice); plot(energy, spec,'color', 'k', 'linewidth', 1); 
        title(['Best LSQ fit ', num2str(choice), ' - NSS= ', num2str(NSS)], 'fontsize', 10, 'fontweight', 'bold')
        xlabel('Energy (keV)', 'fontsize', 10, 'fontweight', 'bold')
        ylabel('Normalized Absorption', 'fontsize', 10, 'fontweight', 'bold')
        zoom on
        hold on
        grid on
        ax = axis;
        plot(Energyscale, eval(['BfOptimized',num2str(choice)]),'r', 'linewidth', 1);
        plot(Energyscale, Unknown-eval(['BfOptimized',num2str(choice)])','b', 'linewidth', 1);
        axis([ax(1), ax(2), min(spec)-0.05, inf])
        text(ax(1)+(ax(2)-ax(1))/3,0.5,Component_Name(ind),'fontsize',8)
        text(ax(1)+0.9*(ax(2)-ax(1)), 0.5, num2cell(Percent'), 'fontsize',8)

    end
elseif Q==2
    for choice = 1:5
        eval( ['BfOptimized',num2str(choice), '= FitVect(:,Combo(choice))''','*[SM(:, P(Combo(choice),1)),SM(:, P(Combo(choice),2))]'';'])
        ind = P(Combo(choice),:); 
        Component_Name(ind); 
        Percent = round(1000*FitVect(:,Combo(choice))./(sum(FitVect(:,Combo(choice)))))/10; 
        NSS = sum((Unknown'-eval(['BfOptimized',num2str(choice)])).^2)/sum(Unknown.*Unknown);
        screen_size = get(0,'screensize');
        if choice == 1
            hfigchoice = figure; 
        else
            figure(hfigchoice)
        end
        set(gcf,'name','option fit selection', 'color', 'white', 'position', [screen_size(1,1), 0.1*screen_size(1,4), 0.35*screen_size(1,3), 0.81*screen_size(1,4)]) 
        subplot(3,2,choice); plot(energy, spec,'color', 'k', 'linewidth', 1);   
        title(['Best LSQ fit ', num2str(choice), ' - NSS= ', num2str(NSS)], 'fontsize', 10, 'fontweight', 'bold')
        xlabel('Energy (keV)', 'fontsize', 10, 'fontweight', 'bold')
        ylabel('Normalized Absorption', 'fontsize', 10, 'fontweight', 'bold')
        zoom on
        hold on
        grid on
        ax = axis;
        plot(Energyscale, eval(['BfOptimized',num2str(choice)]),'r', 'linewidth', 1);
        plot(Energyscale, Unknown-eval(['BfOptimized',num2str(choice)])','b', 'linewidth', 1);
        axis([ax(1), ax(2), min(spec)-0.05, inf])
        text(ax(1)+(ax(2)-ax(1))/3,0.5,Component_Name(ind),'fontsize',8)
        text(ax(1)+0.9*(ax(2)-ax(1)), 0.5, num2cell(Percent'), 'fontsize',8)
    end
else
    for choice = 1:5
        eval( ['BfOptimized',num2str(choice), '= FitVect(:,Combo(choice))''','*SM(:, P(Combo(choice),1))'';'])
        ind = P(Combo(choice),:); 
        Component_Name(ind); 
        Percent = round(1000*FitVect(:,Combo(choice))./(sum(FitVect(:,Combo(choice)))))/10; 
        NSS = sum((Unknown'-eval(['BfOptimized',num2str(choice)])).^2)/sum(Unknown.*Unknown);
        screen_size = get(0,'screensize');
        if choice == 1
            hfigchoice = figure; 
        else
            figure(hfigchoice)
        end
        set(gcf,'name','option fit selection', 'color', 'white', 'position', [screen_size(1,1), 0.1*screen_size(1,4), 0.35*screen_size(1,3), 0.81*screen_size(1,4)])
        subplot(3,2,choice); plot(energy, spec,'color', 'k', 'linewidth', 1); 
        title(['Best LSQ fit ', num2str(choice), ' - NSS= ', num2str(NSS)], 'fontsize', 10, 'fontweight', 'bold')
        xlabel('Energy (keV)', 'fontsize', 10, 'fontweight', 'bold')
        ylabel('Normalized Absorption', 'fontsize', 10, 'fontweight', 'bold')
        zoom on
        hold on
        grid on
        ax = axis;
        plot(Energyscale, eval(['BfOptimized',num2str(choice)]),'r', 'linewidth', 1);
        plot(Energyscale, Unknown-eval(['BfOptimized',num2str(choice)])','b', 'linewidth', 1);
        axis([ax(1), ax(2), min(spec)-0.05, inf])
        text(ax(1)+(ax(2)-ax(1))/3,0.5,Component_Name(ind),'fontsize',8)
        text(ax(1)+0.9*(ax(2)-ax(1)), 0.5, num2cell(Percent'), 'fontsize',8)
    end
end

hmsg = msgbox('Top 5 best LSQ fits (NSS ranking), The best LSQ fit is #1; inspect them and press RETURN to select the fit');
pause
delete(hmsg)
BestFitUserSelect = inputdlg('Which LSQ fits selected: 1, 2, 3, 4 or 5 ?');
if isempty(BestFitUserSelect)
        msgbox('Canceled by user')
        return
end

BestFitUserSelect=str2num(cell2mat(BestFitUserSelect));
   if isempty(BestFitUserSelect)
        msgbox('The selected fit must be # 1, 2, 3, 4 or 5, try again')
        return
   end
       
   if BestFitUserSelect<1 || BestFitUserSelect>5
        msgbox('The selected fit must be # 1, 2, 3, 4 or 5, try again')
        return
    end   
    
    
BestFitUserSelect;
BfOptimized =eval(['BfOptimized',num2str(BestFitUserSelect)]);

% Names of the components that go in the best fit
BF_standardname_ind = P(Combo(BestFitUserSelect,1),:); 
BF_standard_name = Component_Name(BF_standardname_ind); 
Percent = FitVect(:,Combo(BestFitUserSelect))./sum(FitVect(:,Combo(BestFitUserSelect)));
Percent = round(1000*Percent)/10';

% close all windows to make the choice
for choice = 1:5
    close(findobj('name',['option_',num2str(choice)]));
end
close(findobj('name','option fit selection'));

% Sum square error between Bf (bestfit) and experimental spectrum
NSS1 = sum((Unknown' - BfOptimized).^2);
NSS2 = sum((Unknown' - BfOptimized).^2)/sum(Unknown.^2);

% Plot the best fit in the main matlab panel
plot(Energyscale, BfOptimized,'r', 'linewidth', 1);
plot(Energyscale, Residual(:,Combo(BestFitUserSelect)),'b', 'linewidth', 1);

% Run the name_ext only if there are multiple spectra load selected
if get(handles.rb_multipleload, 'value')==1
    name_ext = [];
    for p = 1:size(handles.XASfileAv,2)
        nn=handles.XASfileAv{1,p};
        ind = find(nn == '.');
        name_ext = [name_ext, nn(1,ind-4:ind-1)];
    end

    if get(handles.rb_oa,'value')==0
        title([nn(1:ind-5),name_ext,'_avg'],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none' )
    else
        title([nn(1:ind-5),name_ext,'_avg_a=', num2str(get(handles.ed_oa,'string'))],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none' )
    end
else
    ind = find(handles.XASfile =='.');
    if get(handles.rb_oa,'value')==0
        title(handles.XASfile(1:ind-1),'fontsize', 8, 'fontweight', 'bold', 'interpreter','none' )
    else
        title([handles.XASfile(1:ind-1),'_avg_a=', num2str(get(handles.ed_oa,'string'))],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none' )
    end
end

text(ax(1)+(ax(2)-ax(1))/3,0.5,BF_standard_name,'fontsize',8)
text(ax(1)+0.85*(ax(2)-ax(1)), 0.5, num2cell(Percent), 'fontsize',8)
text(ax(1)+(ax(2)-ax(1))/3, 0.3, ['NSS2= ',num2str(NSS2)], 'fontsize',8, 'fontweight','bold')

% Table of results
Buildtable(BF_standard_name,FitVect(:,Combo(BestFitUserSelect)), NSS1, NSS2);

% Save the figure and files
current = cd;
cd(get(handles.edit_currentdirectory,'string'))
ind = find(handles.XASfile == '.');

 if get(handles.rb_multipleload,'value')==0 % save single file corrected % Single file processed and fitted
    newdir = [handles.XASfile(1:ind-1),'_XAS'];
    [SUCCESS,MESSAGE,MESSAGEID] = mkdir(newdir);
    
    if SUCCESS == 0
       msgbox('The new directory can not be created')
       return
    end
    cd(newdir) 
    
    % save the table as pdf
    saveas(gca, [handles.XASfile(1:ind-1),'_XAS_Tablefit.pdf'])
    
    % Save best fit & residuals to the experimental spectrum
        BFR = array2table([1000*Energyscale, BfOptimized',Residual(:,combo)]);
        BFR.Properties.VariableNames(1:3) ={'Energy (eV)','Best Fit Normalized Absorption','Residuals'};
        writetable(BFR,[handles.XASfile(1:ind-1),'_XAS_fit_BestFit.xls'])
        writetable(BFR,[handles.XASfile(1:ind-1),'_XAS_fit_BestFit.txt'])
        
     % Save experimental XANES spectrum
            S = array2table([1000*energy; spec]');
            S.Properties.VariableNames(1:2) ={'Energy (eV)','Normalized Absorption'};
            if get(handles.rb_oa, 'value') == 1
             writetable(S,[handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed_oa=',num2str(get(handles.ed_oa,'string')),'.xls']) 
             writetable(S,[handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed_oa=',num2str(get(handles.ed_oa,'string')),'.txt']) 
            else
             writetable(S,[handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed.xls'])
             writetable(S,[handles.XASfile(1:find(handles.XASfile == '.')-1),'_XAS_processed.txt'])
            end   
        
    % make a ghost figure to save it in bmp
        close(findobj('name', 'temp'))
        htemp=figure;
        set(htemp, 'name', 'temp','color','white','visible','off')
        plot(energy, spec,'color', 'k', 'linewidth', 1);
        ax = gca;
        ax.FontSize = 10;
        xlabel('Energy (keV)', 'fontsize', 10, 'fontweight', 'bold')
        ylabel('Normalized Absorption', 'fontsize', 10, 'fontweight', 'bold')
        title(handles.XASfile(1:ind-1),'fontsize', 12, 'fontweight', 'bold', 'interpreter','none' )
        zoom on
        hold on
        grid on
        ax = axis;
        plot(Energyscale, BfOptimized,'r', 'linewidth', 1);
        plot(Energyscale, Residual(:,combo),'b', 'linewidth', 1);
        axis([ax(1), ax(2), min(spec)-0.05, inf])
        text(ax(1)+(ax(2)-ax(1))/3,0.5,BF_standard_name,'fontsize',8)
        text(ax(1)+0.85*(ax(2)-ax(1)), 0.5, num2cell(Percent), 'fontsize',8)
        text(ax(1)+(ax(2)-ax(1))/3, 0.3, ['NSS2= ',num2str(NSS2)], 'fontsize',8, 'fontweight','bold')
        ind = find(handles.XASfile == '.');
        saveas(htemp, [handles.XASfile(1:ind-1),'_XAS_fit.bmp'])
        delete(htemp)
 else % save the data for multiple files averaged, processed and saved
     name_ext = [];
            for p = 1:size(handles.XASfileAv,2)
                nn=handles.XASfileAv{1,p};
                name_ext = [name_ext, nn(1,ind-4:ind-1)];
            end
    newdir = [nn(1:ind-5),name_ext,'_XAS_average'];
    [SUCCESS,MESSAGE,MESSAGEID] = mkdir(newdir);
    
    if SUCCESS == 0
       msgbox('The new directory can not be created')
       return
    end
    cd(newdir) 
    
    %save the table as pdf
    saveas(gca, [nn(1:ind-5),name_ext,'_Tablefit_avg.pdf'])
    
    % Save experimental XANES spectrum
        S = array2table([1000*energy; spec]');
        S.Properties.VariableNames(1:2) ={'Energy (eV)','Normalized Absorption'};
        writetable(S,[nn(1:ind-5),name_ext,'_processed_avg.xls'])
        writetable(S,[nn(1:ind-5),name_ext,'_processed_avg.txt'])
    % Save best fit & residuals to the experimental spectrum
        BFR = array2table([1000*Energyscale, BfOptimized',Residual(:,combo)]);
        BFR.Properties.VariableNames(1:3) ={'Energy (eV)','Best Fit Normalized Absorption','Residuals'};
        writetable(BFR,[nn(1:ind-5),name_ext,'_fit_BestFit_avg.xls'])
        writetable(BFR,[nn(1:ind-5),name_ext,'_fit_BestFit_avg.txt'])
        
     % Save experimental XANES spectrum
            S = array2table([1000*energy; spec]');
            S.Properties.VariableNames(1:2) ={'Energy (eV)','Normalized Absorption'};
            if get(handles.rb_oa, 'value') == 1
             writetable(S,[nn(1:ind-5),name_ext,'_processed_avg_oa=',num2str(get(handles.ed_oa,'string')),'.xls'])   
             writetable(S,[nn(1:ind-5),name_ext,'_processed_avg_oa=',num2str(get(handles.ed_oa,'string')),'.txt']) 
            else
             writetable(S,[nn(1:ind-5),name_ext,'_processed_avg.xls'])
             writetable(S,[nn(1:ind-5),name_ext,'_processed_avg.txt'])
            end   
        
    % make a ghost figure to save it in bmp
        close(findobj('name', 'temp'))
        htemp=figure;
        set(htemp, 'name', 'temp','color','white','visible','off')
        plot(energy, spec,'color', 'k', 'linewidth', 1);
        ax = gca;
        ax.FontSize = 10;
        xlabel('Energy (keV)', 'fontsize', 10, 'fontweight', 'bold')
        ylabel('Normalized Absorption', 'fontsize', 10, 'fontweight', 'bold')
        if get(handles.rb_oa,'value')==0
        title([nn(1:ind-5),name_ext,'_avg'],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none' )
        else
        title([nn(1:ind-5),name_ext,'_avg_a=', num2str(get(handles.ed_oa,'string'))],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none' )
        end
        zoom on
        hold on
        grid on
        ax = axis;
        plot(Energyscale, BfOptimized,'r', 'linewidth', 1);
        plot(Energyscale, Residual(:,combo),'b', 'linewidth', 1);
        axis([ax(1), ax(2), min(spec)-0.05, inf])
        text(ax(1)+(ax(2)-ax(1))/3,0.5,BF_standard_name,'fontsize',8)
        text(ax(1)+0.85*(ax(2)-ax(1)), 0.5, num2cell(Percent), 'fontsize',8)
        text(ax(1)+(ax(2)-ax(1))/3, 0.3, ['NSS2= ',num2str(NSS2)], 'fontsize',8, 'fontweight','bold')
        ind = find(handles.XASfile == '.');
        if get(handles.rb_oa,'value')==0
          saveas(htemp, [nn(1:ind-5),name_ext,'_fit_avg.bmp'])
        else
         saveas(htemp, [nn(1:ind-5),name_ext,'_fit_avg_a=',num2str(get(handles.ed_oa,'string')),'.bmp']) 
        end
        delete(htemp)
 end

 %Put the default cutoff edge back
  set(handles.ed_predgecutoff,'string', num2str(25));
  set(handles.ed_postedge,'string', num2str(25));

cd(current)
handles.data.processedspec = [energy; spec]';
handles.data.Eshift = Eshift;
guidata(hObject, handles)

% --- Executes on button press in pb_stackplot.
function pb_stackplot_Callback(hObject, eventdata, handles)
% hObject    handle to pb_stackplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

offset = str2double(get(handles.edit_stackPlot,'string'));
current = cd;
if ~isempty(get(handles.edit_currentdirectory,'string'))
    cd(get(handles.edit_currentdirectory,'string'))
else
    cd(handles.standard_pathname)
end
files = {};
k=1;
while 1
    [names,pathname] = uigetfile('*.xls; *.txt','Choose all xls or txt files to stack', 'MultiSelect', 'on');
    if isequal(names,0) || isequal(pathname,0)
       break
    %if isempty(file)
    h = msgbox('no file was selected');
    pause(5)
    delete(h)
    cd(current)
    return

    else
        files{k}=[pathname,names];
        cd(pathname)
        k=k+1;
        set(handles.edit_currentdirectory,'string', pathname)
    end
end

%plot figure
hfigstack = figure;
set(hfigstack,'color','white')
ymin=1;
ymax = 0;
leg={}; % this is the legend
S={}; 
Stack ={};
if iscell(files)

    for k=1:size(files,2)
        opts = detectImportOptions(files{k});
        w=warning('off','MATLAB:table:ModifiedAndSavedVarnames');
        S = readtable(files{k},opts);
        warning(w);
        % S is a 2 x N matrix, with col 1 is the energy and column 2 is the
        % normalized absorption
        S=S{:,:};
        plot(S(:,1), S(:,2)+(k-1)*offset)
        hold on
        Stack{k}= S;
        ymin = min(ymin,min(S(:,2)+(k-1)*offset));
        ymax = max(ymax,max(S(:,2)+(k-1)*offset));
        name = files{k};
        indmin = find(name== '\',1,'last');
        indmax = find(name== '.',1,'last');
        leg{k} = name(indmin+1:indmax-1);
    end
    ax = gca;
    ax.FontSize = 10;
    ax = axis;
    axis([ax(1), ax(2), ymin-0.1, ymax+0.1])
    xlabel('Energy (eV)', 'fontsize', 10, 'fontweight', 'bold')
    ylabel('Normalized Absorption', 'fontsize', 10, 'fontweight', 'bold')
    legend(leg,'interpreter', 'none', 'Location', 'SouthEast')
else
   h = msgbox('only one excel file was selected');
   pause(5)
   delete(h)
   return
end
movegui(hfigstack,'west')

% Save figure as bmp
cd ..
saveas(hfigstack, 'Stack plot processed', 'bmp')
cd(current)
guidata(hObject, handles)

function [SM] = StandardMatrix(varargin)
    % the columns are the vector of the standards
    % col 1 = standard 1
    % col 2 = standard 2
    % etc ...
    % all standards have the same energy X vector
    % The energy scale is not passed along

standard_pathname = varargin{1};
preedge_energy = varargin{2};
    
%pathdir = uigetdir('*.e', 'Pick the standard folder');
pathdir = uigetdir('*.txt', 'Pick the standard folder');
if isequal(pathdir,0) 
    % msgbox('Cancelled')
    SM.data=[];
    SM.component=[];
    return
end

%files =readfile(eval(['''',pathdir,'\*.e','''']));
files =readfile(eval(['''',pathdir,'\*.txt','''']));

% Name of standards, calibrated energy defined as max of 1st derivative
p=find(pathdir == '\');
standard = pathdir(max(p)+1: max(p)+2);
if standard == 'Fe'
    Edge = 7110.75; % Fe foil
elseif standard == 'Se' 
    Edge = 12658; % Red amorphous Se
elseif standard == 'As'
    Edge = 11873.3; % NaHAsO4 powder
else
    Edge = inputdlg('Edge energy (eV) for this element?');
    Edge = str2num(Edge);
end

xmin = 0;
xmax = 10^9;
Erange=[];
for k = 1:size(files,2)
    Erange = [Erange; min(files(k).lambda), max(files(k).lambda)];
end

% Pre-edge cut requisite: standards with data at least 50 eV below the edge
Edge = 7110.75;
preedgecut=50;
nbre = find(Erange(:,1)<Edge-preedgecut & Erange(:,2)>min(Erange(:,2))); 
E = Erange(nbre, :);
xmin = max(E(:,1));
xmax = min(E(:,2));

% figure('color', 'white')
    xint = xmin:(xmax-xmin)/1500:xmax;
    yint=[];
    component_name = {};
    for k = 1:size(E,1)
      nb = nbre(k);
      yint(k,:) = spline(files(nb).lambda, files(nb).adu, xint);
      ind_preedge = find(xint > preedge_energy*1000,1);
      xval = xint(1:ind_preedge-1);
      [yfit, S, mu] = polyfit(xint(1:ind_preedge-1), yint(k,1:ind_preedge-1), 12);
      yval = polyval(yfit, xval, [], mu);
      
      % Replot the spectra with the pre-edge background substracted
        yint(k,1:ind_preedge-1) = yint(k,1:ind_preedge-1)-yval;
        yint(k,ind_preedge: size(yint,2)) = yint(k,ind_preedge:size(yint,2))-yval(1,size(yval,2));
     
      % isolate component name
       a = find(files(nb).source == '\', 1, 'last');
       b = find(files(nb).source == '.');
       component_name{end+1} = files(nb).source(a+1:b-1);
       
       temp = component_name{end};
       indreplace = find(temp == '_');
       if ~isempty(indreplace)
           temp(indreplace) = ' ';
       end
       component_name{end} = temp;
       
    end

SM.data = [xint; yint]';
SM.component = component_name;
    

function [b] = Buildtable(varargin)
name = varargin{1};
FitVector = varargin{2};
NSS1 = varargin{3};
NSS2 = varargin{4};

% report only the p highest contributions (p to be decided)
%Erase the existing "Major components" Table if it exists, then create new table
%for current analysis
close(findobj('name', 'Major Component'))
fig_table2 = figure('name', 'Major Component', 'position', [5, 318, 700, 400],'color','white');
axis off
textpos = -0.10;
text(textpos,1.+0.05,'Component Name', 'fontweight', 'bold')
text(textpos+0.6,1.0+0.05,'% in fit', 'fontweight', 'bold')
text(textpos+0.8,1.0+0.05,'SSN1', 'fontweight', 'bold')
text(textpos+0.95,1.0+0.05,'SSN2', 'fontweight', 'bold')
text(textpos,.97+0.05,'----------------------------------------------------------------------------------------------------------------------------------------------')
topline = 0.92+0.1;
step = 0.04;

% sort the p major components in descending order
% the largest value is on top, the 2nd larger is 2nd and the 3rd is #3.
% y is the vector of sorted values
% ind_k is the index of the presorted elements
[y,ind_k]=sortrows(FitVector,1, 'descend');
for p=1:min(10, size(y,1)) % limit to max 10 elements
   if ~isequal(y(p), 0)
      text(textpos,topline-p*step,name(ind_k(p)), 'fontweight', 'bold') 
      text(textpos+0.6,topline-p*step,num2str(100*y(p)/sum(y)), 'fontweight', 'bold')
   end
   text(textpos+0.8,topline-step,num2str(NSS1), 'fontweight', 'bold')
   text(textpos+0.95,topline-step,num2str(NSS2), 'fontweight', 'bold')
end


%%% ======================= QXAS Valence Plot==============================
% --- Executes on button press in pb_valenceplot.
function pb_valenceplot_Callback(hObject, eventdata, handles)
% hObject    handle to pb_valenceplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = cd;
cd(handles.VPdir)
ValencePlot;
cd(current)
guidata(hObject, handles)

%%% ==================== XRF maps scale bar ===============================

function edit_scalebarsize_Callback(hObject, eventdata, handles)
% hObject    handle to edit_scalebarsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_scalebarsize as text
%        str2double(get(hObject,'String')) returns contents of
%        edit_scalebarsize as a double
val = str2double(get(hObject,'String'));
set(hObject, 'value', val)
guidata(hObject, handles)


% --- Executes during object creation, after setting all properties.
function edit_scalebarsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_scalebarsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%% ==================== XRF bicolor maps =================================

% --- Executes on button press in pb_bicolormap.
function pb_bicolormap_Callback(hObject, eventdata, handles)
% hObject    handle to pb_bicolormap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(findobj('name', 'bicolor map'));
current = cd;

if ~isfield(handles, 'data') 
    msgbox('Run XRF Map auto first')
    return
end
data=handles.data;
% first check which figure is still on & only consider these two elements
active = zeros(1,size(data.name,2));

indx2use = handles.indx2use; % this is the index of the elements to use
i=1; % running index

for k=1:size(data.name,2)
   if ismember(k, indx2use)
    if isa(eval(['handles.Figmap_',num2str(k)]),'handle') && isvalid(eval(['handles.Figmap_',num2str(k)]))
       active(1,k)=1;     
         eval(['F',num2str(i),'=data.SCA_',num2str(k),';']);
       i=i+1;
    end
   end
end

% Pick two elements to produce a bicolor map
indactive = find(active == 1);
if isempty(indactive)
    msgbox('Run XRF Map auto first')
    return
end
Element1 = data.name{indactive(1,1)};
Element2 = data.name{indactive(1,2)};

if ~isequal(i,3)
    hmes = msgbox('You must have 2 XRF maps active - click on XRF maps auto-process');
    pause
    delete(hmes)
    return
end

% Make the 2 maps the same size when they don't have the same dimension
sx= min(size(F1,1),size(F2,1));
sy= min(size(F1,2),size(F2,2));
F1 = F1(1:sx, 1:sy);
F2 = F2(1:sx, 1:sy);

if sx > sy % images are x elongated
    A = zeros(sx, sx-sy);
    F1s = [F1, A];
    F2s = [F2, A];
elseif sx < sy
    A = zeros(sy-sx, sy);
    F1s = [F1; A];
    F2s = [F2; A];
else
    F1s = F1;
    F2s = F2;
end

F1=F1s;
F2=F2s;
newIm = zeros(size(F1,1), size(F1,2),3);
newIm(:,:,1) = F1./max(F1(:));
newIm(:,:,2) = F2./max(F2(:));
hbicolor = figure; set(hbicolor,'name', 'bicolor map', 'color', 'white');
imagesc(newIm);
scale = 1.0;
hbicolor.Position = [hbicolor.Position(1), hbicolor.Position(2), ...
    scale*hbicolor.Position(3), scale*hbicolor.Position(4)];
set(hbicolor, 'Position', hbicolor.Position);
imagesc(newIm)
axis off
axis('square')
title([handles.XRFfilename,'_bicolor_',Element1,'_' Element2],'interpreter', 'none')
hold on
% add a white rectangle to mask the added A matrix to render the matrix
% square
if sx < sy
     rectangle('position',[0, sx, sy+1,sy-sx+1], 'facecolor', 'w', 'edgecolor', 'w') 
elseif sx >sy
    rectangle('position',[sy+1, 0, sx-sy, sx+1], 'facecolor', 'w', 'edgecolor', 'w')    
end

% save the bicolor map as a bmp
current = cd;
cd(handles.dirname)
saveas(gcf, [handles.XRFfilename,'_bicolor_map_',Element1,'_' Element2], 'bmp')
cd(current)

guidata(hObject, handles)

%%% ==================== XRF tricolor maps ================================

% --- Executes on button press in pb_tricolormap.
function pb_tricolormap_Callback(hObject, eventdata, handles)
% hObject    handle to pb_tricolormap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(findobj('name', 'tricolor map'));
current = cd;
if ~isfield(handles,'data')
    msgbox('Run XRF map auto first')
    return
end
data=handles.data;
indx2use = handles.indx2use;
% first check which figure is still on & only consider these three elements
active = zeros(1,size(data.name,3));
i=1;
for k=1:size(data.name,2)
   if ismember(k, indx2use) 
    if isa(eval(['handles.Figmap_',num2str(k)]),'handle') && isvalid(eval(['handles.Figmap_',num2str(k)]))
       active(1,k)=1;   
         eval(['F',num2str(i),'=data.SCA_',num2str(k),';']);
       i=i+1;
    end
   end
end

% Pick three elements to obtain a tricolor map
indactive = find(active == 1);
if isempty(indactive)
    msgbox('Run XRF Map auto first')
    return
end

if ~isequal(i,4)
    hmes = msgbox('You must have 3 XRF maps active - click on XRF maps auto-process');
    pause
    delete(hmes)
    return
end

Element1 = data.name{indactive(1,1)};
Element2 = data.name{indactive(1,2)};
Element3 = data.name{indactive(1,3)};


% Make the 3 maps the same size when they don't have the same dimensions
sx= min(size(F1,1),size(F2,1));
sy= min(size(F1,2),size(F2,2));
sz= min(size(F1,3),size(F2,3));

F1 = F1(1:sx, 1:sy);
F2 = F2(1:sx, 1:sy);
F3 = F3(1:sx, 1:sy);

if sx > sy % images are x elongated
    A = zeros(sx, sx-sy);
    F1s = [F1, A];
    F2s = [F2, A];
    F3s = [F3, A];
elseif sx < sy
    A = zeros(sy-sx, sy);
    F1s = [F1; A];
    F2s = [F2; A];
    F3s = [F3; A];
else
    F1s = F1;
    F2s = F2;
    F3s = F3;
end

F1=F1s;
F2=F2s;
F3=F3s;
newIm = zeros(size(F1,1), size(F1,2), size (F1,3));
newIm(:,:,1) = F1./max(F1(:));
newIm(:,:,2) = F2./max(F2(:));
newIm(:,:,3) = F3./max(F3(:));
htricolor = figure; set(htricolor,'name', 'tricolor map', 'color', 'white');
imagesc(newIm);
scale = 1.0;
htricolor.Position = [htricolor.Position(1), htricolor.Position(2), ...
    scale*htricolor.Position(3), scale*htricolor.Position(4)];
set(htricolor, 'Position', htricolor.Position);
imagesc(newIm)
axis off
axis('square')
title([handles.XRFfilename,'_tricolor_map_',Element1,'_' Element2, '_',Element3],'interpreter', 'none')
hold on
% add a white rectangle to mask the added A matrix to render the matrix
% square
if sx < sy
     rectangle('position',[0, sx, sy+1,sy-sx+1], 'facecolor', 'w', 'edgecolor', 'w') 
elseif sx >sy
    rectangle('position',[sy+1, 0, sx-sy, sx+1], 'facecolor', 'w', 'edgecolor', 'w')    
end

% save the tricolor map as bmp
current = cd;
cd(handles.dirname)
saveas(gcf, [handles.XRFfilename,'_tricolor_',Element1,'_' Element2, '_',Element3], 'bmp')
cd(current)


% --- Executes on button press in rb_autoIntensity.
function rb_autoIntensity_Callback(hObject, eventdata, handles)
% hObject    handle to rb_autoIntensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_autoIntensity
if get(hObject,'Value') == 0
    set(handles.ed_cmin, 'visible', 'on')
    set(handles.text18, 'visible', 'on')
    set(handles.ed_cmax, 'visible', 'on')
    set(handles.text19, 'visible', 'on')
else
   set(handles.ed_cmin, 'visible', 'off')
   set(handles.text18, 'visible', 'off')
    set(handles.ed_cmax, 'visible', 'off')
    set(handles.text19, 'visible', 'off')
end
guidata(hObject, handles)


function ed_cmin_Callback(hObject, eventdata, handles)
% hObject    handle to ed_cmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
status = str2double(get(hObject,'String'));
set(hObject, 'value', status);
set(hObject, 'string', num2str(status));
guidata(hObject, handles)


% --- Executes during object creation, after setting all properties.
function ed_cmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_cmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ed_cmax_Callback(hObject, eventdata, handles)
% hObject    handle to ed_cmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
status = str2double(get(hObject,'String'));
set(hObject, 'value', status);
set(hObject, 'string', num2str(status));
guidata(hObject, handles)


% --- Executes during object creation, after setting all properties.
function ed_cmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_cmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rb_closemaps.
function rb_closemaps_Callback(hObject, eventdata, handles)
% hObject    handle to rb_closemaps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject, 'value') == 1
  
  % close all unamed & named windows  
      close(findobj('name', ''))
      close(findobj('name', 'XRF maps'))
      close(findobj('name','transect'))

  % close all offset & difference maps if they are opened
      for k = 1: 20 
          k;
          if isfield(handles,['FigAlign_', num2str(k)])
             if ~isempty (findobj(eval(['handles.FigAlign_',num2str(k)])))
               close(eval(['handles.FigAlign_', num2str(k)]))
             end
          end

          if isfield(handles,['FigDiff_', num2str(k)])
              if ~isempty (findobj(eval(['handles.FigDiff_',num2str(k)])))
               close(eval(['handles.FigDiff_', num2str(k)]))
              end
          end
      end
  
 set(hObject, 'value', 0);
end
guidata(hObject, handles)


% --- Executes on button press in rb_FullScreen.
function rb_FullScreen_Callback(hObject, eventdata, handles)
% hObject    handle to rb_FullScreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of rb_FullScreen


% --- Executes on button press in rb_newfileformat.
function rb_newfileformat_Callback(hObject, eventdata, handles)
% hObject    handle to rb_newfileformat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') == 0
    set(handles.rb_oldfileformat,'Value',1)
elseif get(hObject,'Value') == 1
    set(handles.rb_oldfileformat,'Value',0)
end
guidata(hObject, handles)

% --- Executes on button press in rb_oldfileformat.
function rb_oldfileformat_Callback(hObject, eventdata, handles)
% hObject    handle to rb_oldfileformat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(hObject,'Value') == 0
    set(handles.rb_newfileformat,'Value',1)
elseif get(hObject,'Value') == 1
    set(handles.rb_newfileformat,'Value',0)
end
guidata(hObject, handles)

%%%===================== XFS spectra processing  ==========================

% --- Executes on button press in rb_spc_single.
function rb_spc_single_Callback(hObject, eventdata, handles)
% hObject    handle to rb_spc_single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') == 1
    set(handles.rb_spc_all, 'value', 0)
    set(handles.rb_mca_single, 'value', 0)
    set(handles.rb_mca_all, 'value', 0)
end
guidata(hObject, handles)


% --- Executes on button press in rb_spc_all.
function rb_spc_all_Callback(hObject, eventdata, handles)
% hObject    handle to rb_spc_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') == 1
       set(handles.rb_spc_single, 'value', 0)
       set(handles.rb_mca_single, 'value', 0)
       set(handles.rb_mca_all, 'value', 0)
end
guidata(hObject, handles)

% Upload fluorescence emission energies and elemental absorption energies

function T = element_fluorescence
% Element with tabulated fluorescence emission energies, in eV, from orange
% booklet or experimentally at 10.3.2. T is a cell of N row and 2 columns for N elements, each row as
% the element name in 1. K-L3 and L3-M5 transitions.
% T{element, energy}
T={
'U',    3339.80    
'Ar',   2957.70
'Na',   1040.98
'Mg',	1253.60
'Al',	1486.70
'Si',	1739.98
'P',	2013.70
'Zr',   2042.36
'Nb',   2169.00
'Mo',   2293.16
'S',	2307.84
'Tc',   2424.00
'Ru',   2558.55
'Cl',	2622.39
'Rh',   2696.74
'Pd',   2838.61
'Ag',   2984.31
'Cd',   3133.73
'In',   3286.94
'K',	3313.80
'Sn',   3443.98
'Sb',   3604.72
'Ca',	3691.68
'Te',   3769.33
'I',    3937.65
'Sc',   4090.60
'Cs',   4286.50
'Ba',	4466.26
'Ti',   4510.84
'La',   4650.97
'Ce',   4840.20
'V',	4952.20
'Pr',   5033.70
'Nd',   5230.40
'Cr',	5414.72
'Mn',	5898.75
'Fe',	6403.84
'Co',   6930.32
'Ni',	7478.15
'Hf',   7899.00
'Cu',   8047.78
'Ta',   8146.10
'W',    8397.60
'Zn',	8638.86
'Re',   8652.50
'Os',   8911.70
'Ir',   9175.10
'Ga',   9251.74
'Pt',   9442.30
'Au',   9713.30
'Ge',   9886.42
'Hg',   9988.80
'Tl',   10268.50
'As',   10543.72
'Pb',   10551.50
'Bi',   10838.80
'Po',   11130.80
'Se',	11222.40
'Br',   11924.20
};

function A = element_absorption
% Element with absorption energies in eV, from orange booklet, K, L3, M4 edges which are the ones accessible at BL10.3.2. Values for
% V,Cr,Mn,Fe,Co,Ni,Cu,Zn,Hf,Pt,Au,Pb were taken from Kraft 1996. 
% this is also the table for pre-edge elastic fitting, Eo tabulated factor
% A{element, energy}
A={
'UM5',  3552.0   
'UM4',  3728.0
'Ar',   3205.9
'Ir',   2116.0
'P',	2145.5
'Pt',   2202.0
'Zr',   2223.0
'Au',   2291.0
'Nb',   2370.5
'Hg',   2385.0
'S',	2472.0
'Tl',   2485.0
'Mo',   2520.0
'Pb',   2586.0
'Tc',   2677.0
'Bi',   2688.0
'Po',   2798.0
'Cl',	2822.4
'Ru',   2838.0
'At',   2909.0
'Rh',   3004.0
'Fr',   3136.0
'Pd',   3173.0
'Ra',   3248.0
'Ag',   3351.0
'Ac',   3370.0
'Th',   3491.0
'Cd',   3538.0
'K',	3608.4
'Pa',   3611.0
'U',    3728.0
'In',   3730.0
'Np',   3849.0
'Sn',   3929.0
'Pu',   3970.0
'Ca',	4038.5
'Am',   4096.0
'Sb',   4132.0
'Cm',   4224.0
'Te',   4341.0
'Bk',   4353.0
'Cf',   4484.0
'Sc',   4492.0
'I',    4557.0
'Ti',   4966.0
'Cs',   5012.0
'Ba',	5247.0
'V',	5463.76
'La',   5483.0
'Ce',   5723.0
'Pr',   5964.0
'Cr',	5989.02
'Nd',   6208.0
'Mn',	6537.67
'Fe',	7110.75
'Co',   7708.78
'Ni',	8331.49
'Cu',   8980.48
'Hf',   9558.29
'Zn',	9660.76
'Ta',   9881.0
'W',    10207.0
'Ga',   10367.0
'Re',   10535.0
'Os',   10871.0
'Ge',   11103.0
'Ir',   11215.0
'Pt',   11562.76
'As',   11867.0
'Au',   11919.70
'Hg',   12284.0
'Tl',   12658.0
'Se',	12658.0
'Pb',   13035.07
'Bi',   13419.0
'Br',   13474.0
'Po',   13814.0
};

% --- Executes on button press in pb_MCA.
function pb_MCA_Callback(hObject, eventdata, handles)
% hObject    handle to pb_MCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = cd;
% First identify a directory where to look for the data files
default_directory = get(handles.edit_defaultdirectory, 'string');
current_directory = get(handles.edit_currentdirectory, 'string');

    if ~isempty(current_directory)
        cd(current_directory)
    else
        cd(default_directory)
    end
  
% Upload fluorescence emission energies of Elements
% T is a cell of N rows (for N elements) and 2 columns, with element name in 1 and
% energy in 2
T = element_fluorescence;    
    
% upload the data files depending on the multiple choices
if get(handles.rb_spc_single, 'value') == 1 || get(handles.rb_mca_single, 'value') == 1
    data = [];
% upload spc files - assume spectra are energy calibrated
  if get(handles.rb_spc_single, 'value') == 1 
    [file, pathname] = uigetfile('*.spc', 'Select a SINGLE file');
    if isequal(file,0) || isequal(pathname,0)
       msgbox('Cancelled')
       cd(current)
       return
    end
    fid = fopen([pathname,file]);
    if fid == -1
            msgbox('This file cannot be opened')
            return
    else  
           while 1
            line = fgetl(fid);
            if ~ischar(line), break, end
            ind = find(line == ' ');
            d = [str2num(line(1:ind-1)), str2num(line(ind+1:size(line,2)))];
            data = [data; d];
           end
     end
    fclose(fid);
    D = data(:,2);
    D(D<1)=1; % replace the 0 with 1
  end
    
  % for the .mca files - perform energy calibration
  if get(handles.rb_mca_single, 'value') == 1
    [file, pathname] = uigetfile('*.mca', 'Select a SINGLE file');
    if isequal(file,0) || isequal(pathname,0)
       msgbox('Cancelled')
       cd(current)
       return
    end
      cd(current)
  % For raw MCA files, y = 0.044 for the amptek C2, y = 5.5 x 10-4; for the canberra
        data = openfiledotmca([pathname,file]);
        Energy_incident = data.Energy;
        I0= data.I0;
        deadtimes = str2double(get(handles.edit_deadtime, 'string'));
        detector = data.detector;    
        if deadtimes == 1.25 %amptek C2
            x=0.044;
        else
            x = 0.00055; % canberra
        end
        u=1+x*(1+x*(1.5+2.5*x))+(x/0.4040353)*6.933673;
        D = data.spectrum(:,2)/(I0*deadtimes)*u;
        data=data.spectrum;
        
        %Calibration of the MCA using Ar Ka emission line
        % Ar peak must be at energy = 2957.7, 
        % coarse search between 2849 and 3051 eV
        Eminsearch = 2849;
        Emaxsearch = 3051;
        Ear = data(find(data(:,1)> Eminsearch,1): find(data(:,1)>Emaxsearch,1),1);
        Iar = D(find(data(:,1)> Eminsearch,1): find(data(:,1)>Emaxsearch,1));
        close(findobj('name', 'Energy calibration window Ar'))
        hFigAr = figure; set(gcf,'name', 'Energy calibration window Ar','color', 'white')
        plot(Ear, Iar,'b')
        hold on
        grid
            % Fit the Ar peak and find max, then calibrate energy by centering it; 
            es = min((Ear-mean(Ear))/std(Ear)):(max((Ear-mean(Ear))/std(Ear))-min((Ear-mean(Ear))/std(Ear)))/100: max((Ear-mean(Ear))/std(Ear));
            p2 = polyfit((Ear-mean(Ear))/std(Ear),Iar, 6);
            y=polyval(p2,es);
            e = es*std(Ear)+mean(Ear);
            plot(e,y,'--k')
            ear = e((y==max(y)));
            title(['Ar peak at E= ', num2str(ear)])         
            axAr = axis;      
        
        % Calibration of the MCA using Fe Ka emission line
        % Fe peak must be at 6403.84 eV, 
        % coarse search between 6300 and 6450 eV
        Eminsearch = 6300;
        Emaxsearch = 6450;
        Efe = data(find(data(:,1)> Eminsearch,1): find(data(:,1)>Emaxsearch,1),1);
        Ife = D(find(data(:,1)> Eminsearch,1): find(data(:,1)>Emaxsearch,1));
        close(findobj('name', 'Energy calibration window for Fe'))
        hFigFe = figure; set(gcf,'name', 'Energy calibration window for Fe','color', 'white')
        plot(Efe, Ife,'b')
        axFe = axis;
        hold on
        grid
            % Fit the Fe peak and find max, then calibrate energy by centering it;
            es = min((Efe-mean(Efe))/std(Efe)):(max((Efe-mean(Efe))/std(Efe))-min((Efe-mean(Efe))/std(Efe)))/100: max((Efe-mean(Efe))/std(Efe));
            p2 = polyfit((Efe-mean(Efe))/std(Efe),Ife, 6);
            y=polyval(p2,es);
            e = es*std(Efe)+mean(Efe);
            plot(e,y,'--k')
            efe = e((y==max(y)));
            title(['Fe peak at E= ', num2str(efe)])
         
         % Assume linear scaling in energy: Ecalib = a + b * Emeasured
         % with calib points: Ecalib(Ar) = 2957.7 eV, Ecalib(Fe) = 6403.84 eV
         EcalibAr = 2957.7;
         EcalibFe = 6403.84;
         b = (EcalibFe-EcalibAr)/(efe-ear);
         a = EcalibAr - b* ear;
         
         % rescaling of data(:,1); energy X vector
         data(:,1) = a+b*data(:,1);
         
         figure(hFigAr); 
         plot(data(:,1), D,'r')
         axis(axAr);
         leg={'raw','fit','calibrated'};
         legend(leg)
         
         figure(hFigFe); 
         plot(data(:,1), D,'r')
         axis(axFe);
         leg={'raw','fit','calibrated'};
         legend(leg)
       
  end
  
    figure;set(gcf,'color', 'white')
    area(data(:,1), log10(D),'FaceColor', 'b', 'EdgeColor', 'b')
    ax= axis;
    axis([str2num(get(handles.ed_mca_Emin,'string')),str2num(get(handles.ed_mca_Emax,'string')),ax(3), ax(4)])
    xlabel('Energy (eV)', 'fontsize', 14, 'fontweight', 'bold')
    ylabel('Log10 Counts', 'fontsize', 14, 'fontweight', 'bold')
    title(file(1:size(file,2)-4), 'fontsize', 12, 'fontweight', 'bold', 'Interpreter', 'none')
    hold on
    grid on
    
   % Plot label of fluorescence emmission peaks, in eV
   V =[T{:,2}]; 
   labels = {T{:,1}};
   
   
   if get(handles.rb_mca_single, 'value') == 1 
    % restrict labeling of elements according to incident energy
    Elabel = labels(1, 1:find(V> Energy_incident,1)-1); % list of elements to label
    Elabelx = V(1,1:find(V> Energy_incident,1)-1); % corresponding energy of the element to label
    % Plot label of fluo emission peaks
     ax=axis;
     ax(1) = str2double(get(handles.ed_mca_Emin, 'string'));
     ax(2) = str2double(get(handles.ed_mca_Emax, 'string'));
     text((ax(1)+ax(2))/4, 0.05*(ax(4)-ax(3)),['Incident energy = ', num2str(Energy_incident),' eV'],'color', 'w','fontweight', 'bold');
       
    % Find the counts numbers
      indV=[];
      Elabely=[];
       for p=1:size(Elabelx,2)
           indV=[indV, find(data(:,1)>Elabelx(1,p),1)-1];
           Elabely=[Elabely,D(find(data(:,1)>Elabelx(1,p),1)-1)];
       end
       Elabely = log10(Elabely)+min(ax(4)-0.1-max(log10(Elabely)),0.2);
       
     plot(Elabelx,Elabely,'.','color','w')
     axis([ax(1) ax(2) ax(3), 1.1*ax(4)])
     for i = 1: size(Elabel,2)
         text(Elabelx(1,i),1.1*Elabely(1,i),Elabel{1,i},'VerticalAlignment','middle','HorizontalAlignment','center',...
         'fontsize', 10, 'fontweight', 'bold')
     end
   end
   
   if get(handles.rb_spc_single, 'value') == 1
        % Plot label of peaks
         ax=axis;
         V =[T{:,2}]; % Energy values in eV
        % Find the count numbers for the energy values
          indV=[];
          Vx=[]; Vy=[];
           for p=1:size(V,2)
               if V(p)< ax(2)
               indV=[indV, find(data(:,1)>V(p),1)-1];
               Vx = [Vx, V(p)];
               Vy=[Vy,D(find(data(:,1)>V(p),1)-1)];
               end
           end
           Vy = log10(Vy)+min(ax(4)-0.1-max(log10(Vy)),0.2);
           labels = char(T{1:size(Vy,2),1});
         plot(Vx,Vy,'.','color','w')
         text(Vx,Vy,labels,'VerticalAlignment','middle','HorizontalAlignment','center',...
             'fontsize', 8, 'fontweight', 'bold')
   end
  
    cd(pathname)
    saveas(gcf,[file(1:size(file,2)-4),'.bmp']);
    Ds=log10(D);
    Ds(Ds<0)=0;
    S = array2table([data(:,1), Ds]);
    S.Properties.VariableNames(1:2) ={'Energy (keV)','Normalized Absorption'};
    writetable(S,[file(1:find(file == '.')-1),'_MCA_proc.xls'])         
    cd(current)
    set(handles.edit_currentdirectory, 'string', pathname);
end

if get(handles.rb_spc_all, 'value') == 1
    data = [];
    [file, pathname] = uigetfile('*.spc', 'Select a SINGLE file');
    if isequal(file,0) || isequal(pathname,0)
       msgbox('Cancelled')
       cd(current)
       return
    end
    
    cd(pathname)
    
 % Determine the number of files to plot
    original_files=dir([pathname '/*.SPC']); 
    for k = 1: size(original_files,1)
      data = [];
      file = original_files(k).name;
      fid = fopen([pathname,file]);
        if fid == -1
            msgbox('This file cannot be opened')
            return
        else  
           while 1
            line = fgetl(fid);
            if ~ischar(line), break, end
            ind = find(line == ' ');
            d = [str2num(line(1:ind-1)), str2num(line(ind+1:size(line,2)))];
            data = [data; d];
           end
        end
        fclose(fid);
        D = data(:,2);
        D(D<1)=1; % replace the 0 with 1
        figure;set(gcf,'color', 'white')
        area(data(:,1), log10(D),'FaceColor', 'b', 'EdgeColor', 'b')
        ax= axis;
        axis([str2num(get(handles.ed_mca_Emin,'string')),str2num(get(handles.ed_mca_Emax,'string')),ax(3), ax(4)])
        xlabel('Energy (eV)', 'fontsize', 12, 'fontweight', 'bold')
        ylabel('Log10 Counts', 'fontsize', 12, 'fontweight', 'bold')
        title(file(1:size(file,2)-4), 'fontsize', 12, 'fontweight', 'bold', 'Interpreter', 'none')
         hold on
    
         % Plot peak labels
         ax=axis;
         V =[T{:,2}]; % Energy values in eV
          % Find the counts numbers for each energy value
          indV=[];
          Vx=[]; Vy=[];
           for p=1:size(V,2)
               if V(p)< ax(2)
               indV=[indV, find(data(:,1)>V(p),1)-1];
               Vx = [Vx, V(p)];
               Vy=[Vy,D(find(data(:,1)>V(p),1)-1)];
               end
           end
           Vy = log10(Vy)+min(ax(4)-0.1-max(log10(Vy)),0.2);
           labels = char(T{1:size(Vy,2),1});
         plot(Vx,Vy,'.','color','w')
         text(Vx,Vy,labels,'VerticalAlignment','middle','HorizontalAlignment','center',...
             'fontsize', 8, 'fontweight', 'bold')
        
        cd(pathname)
        saveas(gcf,[file(1:size(file,2)-4),'.bmp']);
        cd(current)
        set(handles.edit_currentdirectory, 'string', pathname);
    end     
end

% plot mutliple mca files
 if get(handles.rb_mca_all, 'value') == 1
     
     if ~isempty(current_directory)
        cd(current_directory)
    else
        cd(default_directory)
    end
    
     [file, pathname] = uigetfile('*.mca', 'Select one files - all .mca files will be processed');
        if isequal(file,0) || isequal(pathname,0)
           msgbox('Cancelled')
           cd(current)
           return
        end
        
    % Determine the number of files to plot
    original_files=dir([pathname '/*.mca']); 
    cd(current)
    
  for k = 1: size(original_files,1)
      k;
      data = [];
      file = original_files(k).name; 
      % For raw MCA files, y = 0.044 for the amptek C2, y = 5.5 x 10-4; for the canberra SDD
        data = openfiledotmca([pathname,file]);
        Energy_incident = data.Energy;
        I0= data.I0;
        deadtimes = str2double(get(handles.edit_deadtime, 'string'));
        detector = data.detector;    
        if deadtimes == 1.25 %amptek C2
            x=0.044;
        else
            x = 0.00055; % canberra detector
        end
        u=1+x*(1+x*(1.5+2.5*x))+(x/0.4040353)*6.933673;
        D = data.spectrum(:,2)/(I0*deadtimes)*u;
        data=data.spectrum;
        
        % Calibration of the MCA using Ar Ka emission line
        % Ar peak must be centered at 2957.7 eV, coarse search between 2849 and 3051 eV
        Eminsearch = 2849;
        Emaxsearch = 3051;
        Ear = data(find(data(:,1)> Eminsearch,1): find(data(:,1)>Emaxsearch,1),1);
        Iar = D(find(data(:,1)> Eminsearch,1): find(data(:,1)>Emaxsearch,1));

            % Fit Ar peak and find max, then calibrate energy by centering; 
            es = min((Ear-mean(Ear))/std(Ear)):(max((Ear-mean(Ear))/std(Ear))-min((Ear-mean(Ear))/std(Ear)))/100: max((Ear-mean(Ear))/std(Ear));
            p2 = polyfit((Ear-mean(Ear))/std(Ear),Iar, 6);
            y=polyval(p2,es);
            e = es*std(Ear)+mean(Ear);
            ear = e((y==max(y)));   
        
        %Calibration of the MCA using Fe Ka emission line
        % Fe peak must be centered at 6403.84 eV, coarse search between 6300 and 6450 eV
        Eminsearch = 6300;
        Emaxsearch = 6450;
        Efe = data(find(data(:,1)> Eminsearch,1): find(data(:,1)>Emaxsearch,1),1);
        Ife = D(find(data(:,1)> Eminsearch,1): find(data(:,1)>Emaxsearch,1));

            % Fit Fe peak and find max, then calibrate energy by centering; 
            es = min((Efe-mean(Efe))/std(Efe)):(max((Efe-mean(Efe))/std(Efe))-min((Efe-mean(Efe))/std(Efe)))/100: max((Efe-mean(Efe))/std(Efe));
            p2 = polyfit((Efe-mean(Efe))/std(Efe),Ife, 6);
            y=polyval(p2,es);
            e = es*std(Efe)+mean(Efe);
            efe = e((y==max(y)));
      
         % Assume linear scaling in energy: Ecalib = a + b * Emeasured
         % with calib points: Ecalib(Ar) = 2957.7 eV, Ecalib(Fe) = 6403.84 eV
         EcalibAr = 2957.7;
         EcalibFe = 6403.84;
         b = (EcalibFe-EcalibAr)/(efe-ear);
         a = EcalibAr - b* ear;
         
         % rescaling of data(:,1), energy X vector
         data(:,1) = a+b*data(:,1);
         
   % Plot XFS spectra
    figure;set(gcf,'color', 'white')
    area(data(:,1), log10(D),'FaceColor', 'b', 'EdgeColor', 'b')
    ax= axis;
    axis([str2num(get(handles.ed_mca_Emin,'string')),str2num(get(handles.ed_mca_Emax,'string')),ax(3), ax(4)])
    xlabel('Energy (eV)', 'fontsize', 14, 'fontweight', 'bold')
    ylabel('Log10 Counts', 'fontsize', 14, 'fontweight', 'bold')
    title(file(1:size(file,2)-4), 'fontsize', 12, 'fontweight', 'bold', 'Interpreter', 'none')
    hold on
    grid on
    
   % Add peak labels 
   V =[T{:,2}]; % Energy values in eV
   labels = {T{:,1}};
   
    % restrict labeling of elements according to incident energy
    Elabel = labels(1, 1:find(V> Energy_incident,1)-1); % list of elements to label
    Elabelx = V(1,1:find(V> Energy_incident,1)-1); % corresponding energy of the element to label
    % Plot peak labels
     ax=axis;
     ax(1) = str2double(get(handles.ed_mca_Emin, 'string'));
     ax(2) = str2double(get(handles.ed_mca_Emax, 'string'));
     text((ax(1)+ax(2))/4, 0.05*(ax(4)-ax(3)),['Incident energy = ', num2str(Energy_incident),' eV'],'color', 'w','fontweight', 'bold');
       
    % Find the counts numbers for the energy values
      indV=[];
      Elabely=[];
       for p=1:size(Elabelx,2)
           indV=[indV, find(data(:,1)>Elabelx(1,p),1)-1];
           Elabely=[Elabely,D(find(data(:,1)>Elabelx(1,p),1)-1)];
       end
       Elabely = log10(Elabely)+min(ax(4)-0.1-max(log10(Elabely)),0.2);
       
     plot(Elabelx,Elabely,'.','color','w')
     axis([ax(1) ax(2) ax(3), 1.1*ax(4)])
     for i = 1: size(Elabel,2)
         text(Elabelx(1,i),1.1*Elabely(1,i),Elabel{1,i},'VerticalAlignment','middle','HorizontalAlignment','center',...
         'fontsize', 10, 'fontweight', 'bold')
     end

      cd(pathname)
      saveas(gcf,[file(1:size(file,2)-4),'.bmp']);
      Ds=log10(D);
      Ds(Ds<0)=0;
      S = array2table([data(:,1), Ds]);
      S.Properties.VariableNames(1:2) ={'Energy (keV)','Normalized Absorption'};
      writetable(S,[file(1:find(file == '.')-1),'_MCA_proc.xls']) 
      cd(current)
      set(handles.edit_currentdirectory, 'string', pathname);
  end   
end
guidata(hObject, handles)

%%% ================ XRF align and difference maps ========================

% --- Executes on button press in pb_align_images.
function pb_align_images_Callback(hObject, eventdata, handles)
% hObject    handle to pb_align_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clear data
set(handles.pb_process_spectra, 'visible', 'on')
cla(handles.axes_postprocessed);
axes(handles.axes_postprocessed);
set(handles.axes_postprocessed, 'visible', 'off');
set(handles.text5, 'visible', 'off')
current = cd;

FullScreen = get(handles.rb_FullScreen, 'value');

% close all previously opened figures for the various elements
close(findobj('name', ' '));
% directory where to look for the data files
default_directory = get(handles.edit_defaultdirectory, 'string');
current_directory = get(handles.edit_currentdirectory, 'string');

if ~isempty(current_directory)
    cd(current_directory)
else
    cd(default_directory)
end

[filename, pathname] = uigetfile('*.xrf');

if isequal(pathname, 0)
    msgbox('Cancelled')
    cd(current)
    return
end

files = dir(fullfile(pathname, [filename(1:5),'*.XRF']));

current_directory = pathname;
set(handles.edit_currentdirectory, 'string',pathname);

% Check the reference index is within the range of available data
num_ref = str2num(get(handles.edit_refmap, 'string'));
if size(files,1)< num_ref
    msgbox('REFERENCE MAP # IS OUT OF BOUNDS')
    cd(current)
    return
end

% open the first file and select element for the chemical maps
cd(current)
file = files(1).name;
if get(handles.rb_newfileformat, 'value') == 1
    data = openmapfile(fullfile(pathname,file));
else
    data = openmapfile_original(fullfile(pathname,file));
end

    % %Deadtime correction of the data.SCA_k elements
    % % the output data.SCA_k is deadtime corrected
    % deadtimes = str2double(get(handles.edit_deadtimeXRF, 'string')); 
    % if deadtimes == 1.25 %amptek C2
    %     x=0.044;
    % else
    %     x = 0.00055; % canberra
    % end      
    % u=1+x*(1+x*(1.5+2.5*x))+(x/0.4040353)*6.933673;
    % 
    % for k=1:data.Nre_of_SCA
    %     if abs(size(eval(['data.SCA_',num2str(k)]),1)-size(data.I0,1))<=2
    %         spectemp = eval(['data.SCA_',num2str(k)]);
    %         I0 = data.I0;
    %         indcut = min(size(spectemp,1), size(I0,1));
    %         spectemp = spectemp(1:indcut, :);
    %         I0 = I0(1:indcut,:);
    %         if ~strcmp(data.name{k}, 'Total') %deadtime correction not applied to the Total channel
    %             %M = spectemp./(I0*deadtimes)*u;
    %             M = spectemp./(1/deadtimes)*u;
    %         else
    %             M = spectemp;
    %         end
    %         eval(['data.SCA_',num2str(k),'=M;'])
    %     else
    %         h=msgbox(['Element ',data.name{k},' not deadtime corrected']);
    %     end
    % 
    % end
    % % End of deadtime correction
    
% Give option to select the element among a list of all elements
[ref_element,OK] = listdlg('PromptString','Pick Elemental map for offset:',...
                      'SelectionMode','single',...
                      'ListString',data.name);
if ~OK == 1
   msgbox('Invalid selection')
    return
end

% Upload the map for the selected element; determine the offset in X & Y 
% for each map and determine max offset in X and Y so that maps can be 
% cropped by that amount

Offset=[];
Imsizes = []; 
ImInt = [];

% Select the reference map from which to determine the ROI from which we
% determine the offset of other maps
num_ref = str2num(get(handles.edit_refmap, 'string'));
file = files(num_ref).name;
data = openmapfile(fullfile(pathname,file));
    % will plot the maps with scale (in um) as determined from the first
    % file
        NbrePixel_X = data.PTXY(1);
        NbrePixel_Y = data.PTXY(2);
        XRange = data.Xrange(1)-data.Xrange(2);
        YRange = data.Yrange(1)-data.Yrange(2);
        PixelSize_X = XRange / NbrePixel_X;
        PixelSize_Y = YRange / NbrePixel_Y;
        SizeRefImage = data.PTXY; 

    % make a square matrix whose size is M x M where M = max(X, Y);
    % X and Y steps are nearly identical, so assume matrix size corresponds to
    % aspect ratio
        M = max(NbrePixel_X, NbrePixel_Y);
        m = NbrePixel_Y;
    % Ad is the nbre of line or columns to add to the matrix to make it
    % square
             if NbrePixel_X > NbrePixel_Y  % image streched in X
                Ad = M-NbrePixel_Y;
                A = 0 * ones(Ad,NbrePixel_X);
             else                          % image streched in Y
                Ad = M-NbrePixel_X;
                A = 0 * ones(NbrePixel_Y,Ad);
            end

   % Plot on a single figure, the size of the computer screen and
   % the single channels as subplots
   % The error bars are normalized to a fixed value of Z microns
        Z=str2num(get(handles.edit_scalebarsize, 'string'));
        fs = 14; % font size for the elements
        Cax = [str2double(get(handles.ed_cmin,'string')), str2double(get(handles.ed_cmax,'string'))];
        I0=data.I0;
        Norm = 1./I0;
        dwell = data.dwell_time;
        energy= data.energy;
        EnergyRef = energy;
        set(handles.edit_RefEnergy,'string', num2str(round(100*energy)/100));
    
        k = ref_element;
        Normx = Norm(1:size(eval(['data.SCA_', num2str(k)])-1),1);
        C = bsxfun(@times,eval(['data.SCA_', num2str(k)]), Normx(:))/dwell*1000; % SCA_k normalized by I0 / dwell_time * 1000 (counts per seconds
      
    % Set zoom on reference map
        if NbrePixel_X < NbrePixel_Y
                    hFig = figure('name', file,'units','normalized','NumberTitle', 'off', 'color', 'white');
                if get(handles.rb_autoIntensity, 'value')==1
                    C(C<0)=0;
                    imagesc([C, A(1:size(C,1), 1:min(size(C,2),size(A,2)))]);colormap 'turbo'; colorbar('northoutside','fontsize', 12)
                    title (['Energy =', num2str(round(100*energy)/100), ' eV'])
                else    
                    C(C<0)=0;
                    imagesc([C, A(1:size(C,1), 1:min(size(C,2),size(A,2)))]);colormap 'turbo'; clim(Cax); colorbar('northoutside','fontsize', 12)
                    title (['Energy =', num2str(round(100*energy)/100), ' eV'])
                end
     % Rectangle to mask additional points to make the matrix square
     % 
                rectangle('position',[NbrePixel_X+1, 0, NbrePixel_Y-NbrePixel_X+1,NbrePixel_Y+1], 'facecolor', 'w', 'edgecolor', 'w') 
       elseif NbrePixel_X > NbrePixel_Y
                    hFig = figure('name', file,'units','normalized','NumberTitle', 'off', 'color', 'white');
                if get(handles.rb_autoIntensity, 'value')==1  
                    C(C<0)=0;
                    imagesc([C;A]);colormap 'turbo'; colorbar('northoutside','fontsize', 12)
                    title (['Energy =', num2str(round(100*energy)/100), ' eV'])
                else
                    C(C<0)=0;
                    imagesc([C;A]); colormap 'turbo'; clim(Cax); colorbar('northoutside', 'fontsize', 12)
                    title (['Energy =', num2str(round(100*energy)/100), ' eV'])
                end
      % Rectangle to mask the additional point to make the matrix square
                rectangle('position',[0, NbrePixel_Y+1, M+1,M-NbrePixel_Y], 'facecolor', 'w', 'edgecolor', 'w') 
      
        else % matrix is square, so no need to add white rectangle
               hFig = figure('name', file,'units','normalized','NumberTitle', 'off', 'color', 'white');
                if get(handles.rb_autoIntensity, 'value')==1
                    C(C<0)=0;
                    imagesc(C);colormap 'turbo'; colorbar('northoutside')
                    title (['Energy =', num2str(round(100*energy)/100), ' eV'])
                else
                    C(C<0)=0;
                    imagesc(C); colormap 'turbo'; clim(Cax); colorbar('northoutside')
                    title (['Energy =', num2str(round(100*energy)/100), ' eV'])
                end
          end        
            txtpos = [NbrePixel_X+5,5];
            text(txtpos(1), txtpos(2), data.name{k},'FontName','Arial','Fontsize',12, 'fontweight', 'bold', 'BackgroundColor', 'none')
            zoom on
            axis off
            axis square    

       % Horizontal scale bar
            posx= 0.8;
            line([posx*(NbrePixel_X)-(Z/PixelSize_X) posx*NbrePixel_X], 0.95*[m, m], 'linewidth', 2, 'color', 'w')  
            text((posx-0.2)*NbrePixel_X, 0.88*m, [num2str(Z),' um'],'FontName','Arial','Fontsize',10, 'fontweight', 'bold', 'color', 'w')
            sbpos= [posx*(NbrePixel_X-(Z/PixelSize_X)), posx*NbrePixel_X, 0.95*m, 0.95*m];
           
% Set the zoommed region on the reference map
uiwait(msgbox('First ZOOM ON A ROI, then press OK to continue'));
v = round(axis);
Cz=C(v(3):v(4), v(1):v(2)); 
[mx, my] = find(Cz == max(max(Cz)));
Offset = [Offset; mx, my]; 
Imsizes = [Imsizes; NbrePixel_X, NbrePixel_Y];
% Count signal (I) used for later scaling
    Czav = mean(Cz); 
    Czavsorted = sort(Czav); 
    Czbck = mean(Czavsorted(1:5)); 
    CzI = max(Czavsorted); 
    CzScale = 1e4/(CzI-Czbck); 
    ImInt = [ImInt; Czbck, CzI, CzScale]; 
 close(hFig)
               
% Determine offset for the same channel of the other files. Go through all .xrf files in the directory including Ref maps.
Offset = []; % Reinitizalize the offset
for numb = 1:size(files,1)
  numb; 
  
  file = files(numb).name;
  data = openmapfile(fullfile(pathname,file));
       
  if isequal(data.PTXY, SizeRefImage) 
    I0=data.I0;
    Norm = 1./I0;
    dwell = data.dwell_time;
    energy= data.energy;
    NbrePixel_X = data.PTXY(1);
    NbrePixel_Y = data.PTXY(2);
    XRange = data.Xrange(1)-data.Xrange(2);
    YRange = data.Yrange(1)-data.Yrange(2);
    PixelSize_X = XRange / NbrePixel_X;
    PixelSize_Y = YRange / NbrePixel_Y;

% make a square matrix whose size is M x M where M = max(X, Y);
% X and Y steps are nearly identical, so assume matrix size corresponds to
% aspect ratio
    M = max(NbrePixel_X, NbrePixel_Y);
    m = NbrePixel_Y;
    % Ad is the nbre of line or columns to add to the matrix to make it
    % square
        if NbrePixel_X > NbrePixel_Y
            Ad = M-NbrePixel_Y;
            A = 0 * ones(Ad,NbrePixel_X);
        else
            Ad = M-NbrePixel_X;
            A = 0 * ones(NbrePixel_Y,Ad);
        end

    k = ref_element;
    Normx = Norm(1:size(eval(['data.SCA_', num2str(k)])-1),1);
    C = bsxfun(@times,eval(['data.SCA_', num2str(k)]), Normx(:))/dwell*1000; 

    Cz=C(v(3):v(4), v(1):v(2)); 
    [mx, my] = find(Cz == max(max(Cz)));
    Offset = [Offset; mx, my]; 
    Imsizes = [Imsizes; NbrePixel_X, NbrePixel_Y];
  else
       msgbox('LAST ENERGY MAP HAS A DIFFERENT SIZE THAN THE REFERENCE MAP ')
       skiplast=1; 
  end
end
           
Offset(:, 1) = Offset(:, 1) - min(Offset(:, 1));
Offset(:, 2) = Offset(:, 2) - min(Offset(:, 2));

% Criteria of acceptance for the offset 
      % Set maximum Offset to q pixels in any direction - outside this value the
      % offset is too large to be precise and the cropping of the maps for
      % alignment will be too drastic
      qqq=10;
      Offset(Offset>qqq) = qqq;
  
      % don't use the offset if the contrast of the reference map is too
      % low; essentially, the determined offset is somewhat noisy and
      % random.
      if  max(Cz(:)) < 2*mean(Cz(:))
       Offset = zeros(size(Offset));
       msgbox('TOO LOW CONTRAST IN REF MAP FOR ACCURATE ALIGNMENT')
      end
  
      % don't use offset if map size is less than 60 x 60 pixels otherwise too much
      % cropping. Need to crop at least 2 x qqq pixel on each side. 
      % If qqq = 10 and the map is 60 x 60 pixels, the processed map will
      % be 40 x 40 pixels.
      if  NbrePixel_X < 60 && NbrePixel_Y < 60
       Offset = zeros(size(Offset)); 
       msgbox('MAP SIZE TOO SMALL FOR PROPER ALIGNMENT')
      end

x_offsetrange = max(Offset(:, 1))-min(Offset(:, 1)); % this is the max offset among images in X
y_offsetrange = max(Offset(:, 2))-min(Offset(:, 2)); % this is the max offset among images in Y
mm = min(Imsizes);
min_ImsizeX = mm(1);
min_ImsizeY = mm(2);

% Select the element to use among a list of all elements
[diff_element,OK] = listdlg('PromptString','Element for difference map:',...
                      'SelectionMode','single',...
                      'ListString',data.name);
if ~OK == 1
   msgbox('Invalid selection')
    return
end

% Difference maps for elements selected above
% Identify the Reference file and its data; reference file is the
% num_ref file
file = files(num_ref).name;
data = openmapfile(fullfile(pathname,file));
    NbrePixel_X = data.PTXY(1);
    NbrePixel_Y = data.PTXY(2);
    XRange = data.Xrange(1)-data.Xrange(2);
    YRange = data.Yrange(1)-data.Yrange(2);
    PixelSize_X = XRange / NbrePixel_X;
    PixelSize_Y = YRange / NbrePixel_Y;

    I0=data.I0;
    Norm = 1./I0;
    dwell = data.dwell_time;
    energy = data.energy;

    k = diff_element;
    Normx = Norm(1:size(eval(['data.SCA_', num2str(k)])-1),1);
    C = bsxfun(@times,eval(['data.SCA_', num2str(k)]), Normx(:))/dwell*1000;    
    CRef = C;
    % maps are cropped by 10 pixels in each size to accomodate the offset
    % + / - 10 pixels
  
    if ~isequal(Offset, zeros(size(Offset)))
     C_cropRef = C(10-Offset(num_ref,2)+1:min_ImsizeY-Offset(num_ref,2)-10,10-Offset(num_ref,1)+1:min_ImsizeX-10-Offset(num_ref,1)); 
    else
     C_cropRef = C;
    end
  
% Plot map files at different energies.
% Energies smaller than num_ref are not shifted since no signal;
% Files at energies higher than num_ref file are shifted by Offset

if exist('skiplast', 'var') && size(files,1)>2.5
   NbreE = size(files,1)-1;
else
   NbreE = size(files,1);
end

% hFig1: offset figures
% hFig2: difference map figures
% ------------------------------
for numb = 1:NbreE
    
    numb;  
    file = files(numb).name;
    data = openmapfile(fullfile(pathname,file));
 % Plot maps with proper scale (in um) as determined from the first file
    NbrePixel_X = data.PTXY(1);
    NbrePixel_Y = data.PTXY(2);
    XRange = data.Xrange(1)-data.Xrange(2);
    YRange = data.Yrange(1)-data.Yrange(2);
    PixelSize_X = XRange / NbrePixel_X;
    PixelSize_Y = YRange / NbrePixel_Y;

    I0=data.I0;
    Norm = 1./I0;
    dwell = data.dwell_time;
    energy = data.energy;

    k = diff_element;
    Normx = Norm(1:size(eval(['data.SCA_', num2str(k)])-1),1);
    C = bsxfun(@times,eval(['data.SCA_', num2str(k)]), Normx(:))/dwell*1000;
  
 % Crop by 10 pixel only if there is a non-zero offset
    if ~isequal(Offset, zeros(size(Offset)))
      C_offset = C(10-Offset(numb,2)+1:min_ImsizeY-Offset(numb,2)-10,10-Offset(numb,1)+1:min_ImsizeX-10-Offset(numb,1)); 
    else
      C_offset = C;
    end
        
    if ~isequal(size(C_offset), size(C_cropRef))
        Ymin = min(size(C_offset,1), size(C_cropRef,1));
        Xmin = min(size(C_offset,2), size(C_cropRef,2));
        C_offset = C_offset(1:Ymin, 1:Xmin);
        C_cropRef = C_cropRef(1:Ymin, 1:Xmin);
    end

 % Make C matrix square
        C= C_offset;
        M = max (size(C,1), size(C,2)); % 1: number of row (Y-axis)
                                        % 2: number of column (X-axis)
        m= min(size(C,1), size(C,2));
        % Ad is the nbre of line or columns to add to the matrix to make it
        % square
        if size(C,1) > size(C,2) % More row than columns: stretched in Y
            Ad = M-size(C,2);
            A = 0 * ones(size(C,1), Ad);
        else                     % More colums than rows: stretched in X
            Ad = M-size(C,1);
            A = 0 * ones(Ad, M);
        end

       % hFig_offset = figure('name', [file,'_offset'],'units','normalized','NumberTitle', 'off', 'color', 'white');
      
        % use to normalize the map by removing bkg and scaling to
        % peak intensity - see line 1734
        C_offset(C_offset<0)=0;

        if ~isequal(numb, 100)
            hFig_differencemap = figure('name', [file,'_differencemap'],'units','normalized','NumberTitle', 'off', 'color', 'white');
            
         DiffC = -C_cropRef + C_offset;
         DiffC(DiffC<0)=0;

         if size(C,1) < size(C,2) 
            imagesc([DiffC;A]);colormap 'turbo'; colorbar('northoutside') 
            hold on
            rectangle('position',[0, size([C_offset;A],1)-Ad, size([C_offset;A],1)+1,Ad+1], 'facecolor', 'w', 'edgecolor', 'w')
            % stretched in X, add a rectangle to the bottom
         else
            imagesc([DiffC,A]);colormap 'turbo'; colorbar('northoutside') 
            hold on
            rectangle('position',[size([DiffC,A],1)-Ad,0, Ad+1, size(DiffC,1)+1], 'facecolor', 'w', 'edgecolor', 'w')
            % stretched in Y, add a rectangle to the right
        end                 
            txtpos2 = [size(C_offset,2)+2,5];
            text(txtpos2(1), txtpos2(2), data.name{k},'FontName','Arial','Fontsize',fs, 'fontweight', 'bold', 'BackgroundColor', 'none')
            zoom on
            axis off
            axis square
            title (['Map=', num2str(round(100*energy)/100), ' - Map=', num2str(round(100*EnergyRef)/100)],...
                'fontsize', 10, 'fontweight', 'bold')

            % Horizontal scale bar
            sbpos; % this was the coordinates of the scale bar position in the zoom image (see line 2438)
            posx; % this is the factor to move the scale bar to the right or left   
            textheight = 0.9;
            lineheight = 0.95;
            lineposx = 0.9;
            line([lineposx*(size(DiffC,2))-Z/PixelSize_X,lineposx*size(DiffC,2)], lineheight*[size(DiffC,1), size(DiffC,1)], 'linewidth', 2, 'color', 'w')
            text((lineposx-0.12)*size(DiffC,2), textheight*size(DiffC,1), [num2str(Z),' um'],'FontName','Arial','Fontsize',9, 'fontweight', 'bold', 'color', 'w')
       
            % save the handles of the offset map and difference map
            % to be used in other routines
            % eval(['handles.FigAlign_',num2str(numb), '= hFig_offset;'])
            eval(['handles.FigDiff_',num2str(numb), '= hFig_differencemap;'])

            %save the difference map
            j = strfind(file, '.');
              % if the file has multiple '.' in the name, 
              % replace the '.' by '_' otherwise file extension is screwed
              % 
                if size(j,2)>1   
                    pp=j(1:size(j,2)-1);
                    for q=1:size(pp,2)
                        file(pp(q))='_';
                    end
                    j=max(j); 
                end
                % ----------------------------
            cd(pathname)
            
            if ~isempty(find(data.name{k} == '/'))
                n= data.name{k};
                indc = find(n == '/');
                data.name{k}=[n(1:indc-1), n(indc+1:size(n,2))];
            end
            
            if ~isempty(find(data.name{k} == '\'))
                n= data.name{k};
                indc = find(n == '\');
                data.name{k}=[n(1:indc-1), n(indc+1:size(n,2))];
            end
            filename = [file(1:j-1),'_', data.name{k},'_difference_map'];
            [k, filename];
            saveas(gcf, filename,'bmp') 
            cd(current)
         end
           
end
guidata(hObject, handles)

%%%======================= XFS ranges =====================================

function ed_mca_Emin_Callback(hObject, eventdata, handles)
% hObject    handle to ed_mca_Emin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
status = str2double(get(hObject,'String'));
set(hObject, 'value', status);
set(hObject, 'string', num2str(status));
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function ed_mca_Emin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_mca_Emin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_mca_Emax_Callback(hObject, eventdata, handles)
% hObject    handle to ed_mca_Emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
status = str2double(get(hObject,'String'));
set(hObject, 'value', status);
set(hObject, 'string', num2str(status));
guidata(hObject, handles)


% --- Executes during object creation, after setting all properties.
function ed_mca_Emax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_mca_Emax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%======================= XRF cross correlation ==========================

% --- Executes on button press in rb_crosscorrelation.
function rb_crosscorrelation_Callback(hObject, eventdata, handles)
% hObject    handle to rb_crosscorrelation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pb_crosscorrelation.
function pb_crosscorrelation_Callback(hObject, eventdata, handles)
% hObject    handle to pb_crosscorrelation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% check if the cross-correlation will be performed across two
% maps at different energies.
  
% Button menu to select if cross-correlation is done across multi-energies
ButtonName = questdlg('Cross-correlation from 2 different map files?', ...
                         'Energies of cross-correlation', ...
                         'Yes', 'No', 'Yes');
switch ButtonName
 case 'Yes'
   ch=2;
 case 'No'
   ch=1;
end 

if ch == 1 % Cross-correlate elements at the same energy
    data = handles.data;
    Norm = handles.Norm;
    dwell = handles.dwell;
    dirname = handles.dirname;

    current = cd;
    % Plot Cross-correlation between 2 selected elements
    % Give option to select two elements to use among a list of all elements
    [Element1,OK] = listdlg('PromptString','First Element:',...
                          'SelectionMode','single',...
                          'ListString',data.name);
    if ~OK == 1
       msgbox('Invalid selection')
        return
    end

    [Element2,OK] = listdlg('PromptString','Second Element:',...
                          'SelectionMode','single',...
                          'ListString',data.name);
    if ~OK == 1
       msgbox('Invalid selection')
        return
    end

    % Retrieve the SCA of Element1 & Element2 and plot cross correlation
    % intensity; Normalize the SCA with the intensity
    El = [Element1, Element2];

    NormEl1 = Norm(1:size(eval(['data.SCA_', num2str(El(1))])-1),1);
    El1_X = bsxfun(@times,eval(['data.SCA_', num2str(El(1))]), NormEl1(:))/dwell*1000; % SCA_k normalized by I0 / dwell_time * 1000 (counts per seconds

    NormEl2 = Norm(1:size(eval(['data.SCA_', num2str(El(2))])-1),1);
    El2_Y = bsxfun(@times,eval(['data.SCA_', num2str(El(2))]), NormEl2(:))/dwell*1000;

    %Ensure both EL1_X and EL2_Y have the same size;
    Sx= min(size(El1_X,1),size(El2_Y,1));
    Sy= min(size(El1_X,2),size(El2_Y,2));

    figure; set(gcf, 'color', 'white')
    plot(El1_X(1:Sx,1:Sy), El2_Y(1:Sx,1:Sy),'ok', 'markerSize', 4)
    ax=axis;
    axis([0,ax(2),0, ax(4)]);  % force the origin at (0,0)
    xlabel(data.name(El(1)), 'fontsize', 14, 'fontweight', 'bold')
    ylabel(data.name(El(2)), 'fontsize', 14, 'fontweight', 'bold')
    title('Two-element cross-correlation', 'fontsize', 14, 'fontweight', 'bold')

    cd(dirname)
        if strcmp(data.name(El(1)),{'Ti/Ba'})
            data.name(El(1)) = {'TiBa'};
        end

        if strcmp(data.name(El(2)),{'Ti/Ba'})
            data.name(El(2)) = {'TiBa'};
        end
    saveas(gcf,['CorrelationPlot_',char(data.name(El(1))),'_',char(data.name(El(2))),'.bmp']);
    cd(current)
else % Cross-correlate elements from a single map (same energy)
    data = handles.data;
    Norm = handles.Norm;
    dwell = handles.dwell;
    dirname = handles.dirname;
    
    data0 = handles.data0;
    Norm0 = handles.Norm0;
    dwell0 = handles.dwell0;
    dirname0 = handles.dirname0;

    current = cd;
    % Plot Cross-correlation between 2 selected elements
    % Select two elements to use among a list of all elements
    [Element1,OK] = listdlg('PromptString',['Energy of 1st map: ', num2str(data.energy)],...
                          'SelectionMode','single',...
                          'ListString',data.name);
    if ~OK == 1
       msgbox('Invalid selection')
        return
    end

    [Element2,OK] = listdlg('PromptString',['Energy of 2nd map: ', num2str(data0.energy)],...
                          'SelectionMode','single',...
                          'ListString',data0.name);
    if ~OK == 1
       msgbox('Invalid selection')
        return
    end

    % Retrieve the SCA of Element1 & Element2 and plot cross correlation
    % intensity; Normalize the SCA with the intensity
    El = [Element1, Element2];

    NormEl1 = Norm(1:size(eval(['data.SCA_', num2str(El(1))])-1),1);
    El1_X = bsxfun(@times,eval(['data.SCA_', num2str(El(1))]), NormEl1(:))/dwell*1000; % SCA_k normalized by I0 / dwell_time * 1000 (counts per seconds

    NormEl2 = Norm(1:size(eval(['data0.SCA_', num2str(El(2))])-1),1);
    El2_Y = bsxfun(@times,eval(['data0.SCA_', num2str(El(2))]), NormEl2(:))/dwell0*1000;

    %Ensure both EL1_X and EL2_Y have the same size;
    Sx= min(size(El1_X,1),size(El2_Y,1));
    Sy= min(size(El1_X,2),size(El2_Y,2));

    figure; set(gcf, 'color', 'white')
    plot(El1_X(1:Sx,1:Sy), El2_Y(1:Sx,1:Sy),'ok', 'markerSize', 4)
    ax=axis;
    axis([0,ax(2),0, ax(4)]);  % force the origin at (0,0)
    xlabel(data.name(El(1)), 'fontsize', 14, 'fontweight', 'bold')
    ylabel(data0.name(El(2)), 'fontsize', 14, 'fontweight', 'bold')
    title('Two-element cross-correlation', 'fontsize', 14, 'fontweight', 'bold')

    cd(dirname)
        if size(data.name,2)>1
            if strcmp(data.name(El(1)),{'Ti/Ba'})
                data.name(El(1)) = {'TiBa'};
            end

            if strcmp(data.name(El(2)),{'Ti/Ba'})
                data.name(El(2)) = {'TiBa'};
            end
        else 
            if strcmp(data.name,{'Ti/Ba'})
                data.name = {'TiBa'};
            end
        end
        
        if size(data0.name,2)>1
            if strcmp(data0.name(El(1)),{'Ti/Ba'})
                data0.name(El(1)) = {'TiBa'};
            end

            if strcmp(data0.name(El(2)),{'Ti/Ba'})
                data0.name(El(2)) = {'TiBa'};
            end
        else
            if strcmp(data0.name,{'Ti/Ba'})
                data0.name = {'TiBa'};
            end
        end
        
    saveas(gcf,['CorrelationPlot_',char(data.name(El(1))),'_',char(data0.name(El(2))),'.bmp']);
    cd(current)
end
        
guidata(hObject, handles)


function edit_refmap_Callback(hObject, eventdata, handles)
% hObject    handle to edit_refmap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2double(get(hObject,'String'));
set(hObject, 'value', val)
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function edit_refmap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_refmap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_RefEnergy_Callback(hObject, eventdata, handles)
% hObject    handle to edit_RefEnergy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_RefEnergy as text
%        str2double(get(hObject,'String')) returns contents of edit_RefEnergy as a double


% --- Executes during object creation, after setting all properties.
function edit_RefEnergy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_RefEnergy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%%==================== Transect on XRF maps ==============================

% --- Executes on button press in pb_transect.
function pb_transect_Callback(hObject, eventdata, handles)
% hObject    handle to pb_transect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if ~isfield(handles,'data')
    msgbox('Run the XRF map auto process first')
    return
end

% if no figure is active, pop a warning message
indx2use = handles.indx2use;
 FigAct = zeros(1,size(handles.data.name, 2));
    for k =1:size(handles.data.name, 2) 
      if ismember(k, indx2use)
        if ~isempty(findobj(eval(['handles.Figmap_',num2str(k)])))
          FigAct(k) = 1;
        end
      end
    end

    if isequal(FigAct, zeros(1,size(handles.data.name,2)))
     msgbox('No MAP active - Launch XRF Maps auto-process')
     return
    end

% first make the selected figure from XRF Maps the current fig
% and determine the coordinates of the line transect
X=[];
Y=[];
for k = 1:size(handles.data.name, 2)
  if ismember(k, indx2use)
   if ~isempty (findobj(eval(['handles.Figmap_',num2str(k)]))) 
    if isfield(handles, 'hline')
        figure(eval(['handles.Figmap_',num2str(k)]));
        if isfield(handles, ['hline_',num2str(k)])
          delete(eval(['handles.hline_', num2str(k)])) 
        end
    end
     
    % Determine the line transect only in one map
    if isempty(X)
        % pop-up one of the active window
        ind = min(find(FigAct == 1));
        figure(eval(['handles.Figmap_',num2str(ind)]));
        uiwait(msgbox('press OK to activate the cursor'))       
        [X,Y] = ginput(2);
        ax_zoom = axis; % this is the axis of the zoom figure
        hold on
        hline = 1000; % dummy number to say line transect was on
        handles.hline = hline;
        hold off
    end

    % find all i,j indexes that fall within the line betwwen X(1) and X(2)
    % equation of the line is: y = a + slope*x
    % y = a + s*x hence a = Y(1)-s*X(1)
    % slope= [Y(2)-Y(1)]./[X(2)-X(1)]
   
        s = (Y(2)-Y(1))./(X(2)-X(1));
        %xtest = 1:248;
        a = Y(1)-s*X(1);
        %ytest = s*xtest + a;

    % isolate the i, j of the line transect
    if abs(X(2)-X(1))>=6
        i = round(min(X)): round(max(X));
        j = round(s*i+a);
        %ROI=[i;j];
    else % here the slope may be infinite
        % in this case do not use the slope
        if Y(1) < Y(2)
            j= [round(min(Y)):round(max(Y))];
        else
            j= [round(max(Y)):-1:round(min(Y))];
        end
        i = round(mean(X))*ones(size(j));
        %ROI=[i;j];
    end
    
    % pixel size & distances in microns
    Xp = -diff(handles.data.Xrange)/handles.data.PTXY(1);
    Yp = -diff(handles.data.Yrange)/handles.data.PTXY(2);
    id = i*Xp;
    jd = j*Yp;
    dist1 = sqrt([max(i)-min(i)]^2+[max(j)-min(j)]^2); % in pixels
    dist2 = sqrt([max(id)-min(id)]^2+[max(jd)-min(jd)]^2); % in microns 
    dist=0:(dist2/(size(i,2)-1)):dist2;
  end
 end
end

% Plot the same line transect on all open figures and define the line transect
% then save map figure with transect, in "transect" folder
% start by looking if the transect directory exist
current = cd;
cd(handles.dirname)
d = dir;
dir_list = [d(:).isdir]; % logical vector of the directories in the root directory
ind_dir=find(dir_list == 1);
ind_dir = ind_dir(3: size(ind_dir,2)); % subfolders in the current directory

newdir = ['transect',num2str(size(ind_dir,2)+1)];
[SUCCESS,MESSAGE,MESSAGEID] = mkdir(newdir);
cd([handles.dirname,newdir]) % Will save also the line transect in the same directory then go back to the current

first = 'yes'; % to identfy the index of the first map opened; used to set the zoom coordinate

for k = 1:size(handles.data.name, 2)
    if ismember(k, indx2use)
        if ~isempty (findobj(eval(['handles.Figmap_',num2str(k)])))   
            figure(eval(['handles.Figmap_',num2str(k)]));
            hold on
            eval(['hline_',num2str(k),'= plot(X,Y,''w'', ''linewidth'',2);']);
            axis(ax_zoom)
            hold off
            eval(['handles.hline_', num2str(k),'=hline_',num2str(k),';'])
            filename = [handles.XRFfilename,'_', handles.data.name{k},'_transect'];
            saveas(gcf, filename, 'bmp')           
        end
    end
 end

% Now get the line transect for each element
% for each i, get bw pixels band around j, i.e. if bw=2, get j-2, j-1, j, j+1, j+2
    bw = 2;
    I0 = handles.data.I0;
    dwell = handles.data.dwell_time;
    Norm = 1./I0;
    Linescan = []; 
   Leg={};
   for k = 1:size(handles.data.name, 2)
      if ismember(k, indx2use)
        if ~isempty (findobj(eval(['handles.Figmap_',num2str(k)]))) 
            Normx = Norm(1:size(eval(['handles.data.SCA_', num2str(k)])-1),1);
            C = bsxfun(@times,eval(['handles.data.SCA_', num2str(k)]), Normx(:))/dwell*1000;
            % create the line transect
            Cls=[];
            for p=1:size(i,2)
                Cls =[Cls,C(j(p)-bw:j(p)+bw, i(p))];
            end
            Linescan = [Linescan; mean(Cls)];
            Leg{end+1} = handles.data.name{k};
        end
      end
   end

close(findobj('name','lineplot'))
fig_ls = figure('name', 'lineplot', 'color', 'white');
movegui(fig_ls, 'onscreen')
plot(dist, Linescan')
title([handles.XRFfilename,'_transect'], 'fontsize', 12, 'fontweight', 'bold', 'Interpreter', 'none');
titleHandle= get(gca,'Title');
titleHandle.HorizontalAlignment = 'center';
titlePos = titleHandle.Position;
ax = axis; % ax(1) and ax(2) gives the coordinate of xmin and xmax
titleHandle.Position = [0.6*(ax(2)-ax(1)) titlePos(2) 0];
legend(Leg, 'Location','NorthEastOutside')
ax = gca;
ax.FontSize = 10;
xlabel('Distance (microns)', 'fontsize', 10, 'fontweight', 'bold')
ylabel('Fluorescence counts', 'fontsize', 10, 'fontweight', 'bold')
figure(fig_ls)
movegui(fig_ls, 'onscreen')
% Save the line transect figure
 saveas(fig_ls, [handles.XRFfilename,'_transects_plot'], 'bmp') 

if ismember(k,indx2use) 
 if ~isempty (findobj(eval(['handles.Figmap_',num2str(k)])))
    if isfield(handles, 'hline')
        figure(eval(['handles.Figmap_',num2str(k)]));
    end
 end
end
zoom on
cd(current)
guidata(hObject, handles)

% --- Executes on button press in pb_histogram.
function pb_histogram_Callback(hObject, eventdata, handles)
% hObject    handle to pb_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('Not yet functional')
return

data = handles.data;
name = handles.data.name;
I0=data.I0;
Norm = 1./I0;
dwell = data.dwell_time;
energy= data.energy;

%Select an element and plot the map;
[ref_element,OK] = listdlg('PromptString','Choose an elemental map to determine the Offset:',...
                      'SelectionMode','single',...
                      'ListString',data.name);
if ~OK == 1
   msgbox('Invalid selection')
    return
end

threshold = inputdlg('Enter the threshold value');
t = str2double(threshold);
k = ref_element;
% make Io and data_SCA the same length
le = min(size(I0,1), size(eval(['data.SCA_', num2str(ref_element)])));
Normx = Norm(1:le,1);
C = bsxfun(@times,eval(['data.SCA_', num2str(ref_element)]), Normx(:))/dwell*1000; 
D = C;
D(D<t) = 1;
D(D>t)=0;

% Determine if image is elongated in which direction to have a square plot
% size(C,2): X dimension
% size(C,1): Y dimension
M = max(size(C,1), size(C,2)); % this will be the number of pixel of the square matrix
m = M-min(size(C,1), size(C,2)); % this is the extra datapoint to be added

    % Ad is the nbre of line or columns to add to the matrix to make it
    % square
    if size(C,2) > size(C,1)
        A = 1 * ones(m,size(C,2));
        hfig = figure; set(gcf, 'color', 'white')
        imagesc([C;A]); colormap 'turbo'; colorbar('northoutside','fontsize', 12)
        axis off
        axis square
        hfigt = figure; set(gcf, 'color', 'white')
        imagesc([D;A]);colormap 'gray'; colorbar('northoutside','fontsize', 12)
        axis off
        axis square
    elseif size(C,2) < size(C,1)
        A = 1 * ones(size(C,1),m);
         hfig = figure; set(gcf, 'color', 'white')
        imagesc([C,A]); colormap 'turbo'; colorbar('northoutside','fontsize', 12)
        axis off
        axis square
        hfigt = figure; set(gcf, 'color', 'white')
        imagesc([D,A]);colormap 'gray'; colorbar('northoutside','fontsize', 12)
        axis off
        axis square
    else
        hfig = figure; set(gcf, 'color', 'white')
        imagesc(C); colormap 'turbo'; colorbar('northoutside','fontsize', 12)
        axis off
        axis square
        hfigt = figure; set(gcf, 'color', 'white')
        imagesc(D);colormap 'gray'; colorbar('northoutside','fontsize', 12)
        axis off
        axis square
    end

guidata(hObject, handles)

function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%================== QXAS point locations on XRF maps ====================

% --- Executes on button press in pb_qXASlocation.
function pb_qXASlocation_Callback(hObject, eventdata, handles)
% hObject    handle to pb_qXASlocation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% First check that XRF autoprocess has been run and that a map is indeed already
% opened
if ~isfield(handles, 'data')
    msgbox('Please run XRF Map auto first')
    return
end

if isempty(findobj('name','XRF maps'))
    msgbox('No XRF map available - Please run XRF Map auto')
    return
end

datamap = handles.data; % these are the data after running XRF maps first

% QXAS point locations on the XRF maps
% open the .qx files
% First identify a directory where to look for the data files
default_directory = get(handles.edit_defaultdirectory, 'string');
current_directory = get(handles.edit_currentdirectory, 'string');
current = cd;
cd(handles.dirname);
% upload the .qx as file single file selection
[filexas, pathname] = uigetfile('*.qx', 'Select a SINGLE file');
    
    if isequal(filexas,0) || isequal(pathname,0)
       msgbox('Upload cancelled')
       cd(current)
       return
    end

cd(current)
dataxas = opentheselectedfile([pathname, filexas]);
            
% read X,Y positions in the .qx file
Xposxas = dataxas.XasPos(1,1);
Yposxas = dataxas.XasPos(1,2);

% convert to pixels i,j,
% data.XYstep must have 2 components: X pixel size and Y pixel size
% some files have data.XYstep with 3 components; in which case only comp 1 and comp 3 are the X and Y pixel size.
% In this patch, account for the fact that data.XY step has 2 or 3 elements, and force it to have only 2 elements
if size(datamap.XYstep, 2) == 3
    datamap.XYstep = [datamap.XYstep(1), datamap.XYstep(3)];
end
i= -round((Xposxas-datamap.Xrange(1))/datamap.XYstep(1,1));
j= -round((Yposxas-datamap.Yrange(1))/datamap.XYstep(1,2));

% create folder where to save the XRF maps with annotated QXAS point locations
current = cd;
cd(pathname)
d = dir;
dir_list = [d(:).isdir]; % logical vector of the directories in the root directory
ind_dir=find(dir_list == 1);
ind_dir = ind_dir(3: size(ind_dir,2)); % these are the subfolders in the current directory

newdir = [filexas(1:find(filexas == '.')-1),'_XAS'];

indanno = find(filexas == '_',1,'last');
annotate = filexas(indanno+1: find(filexas == '.')-1); % this is the legend to be put right above QXAS point location

[SUCCESS,MESSAGE,MESSAGEID] = mkdir(newdir);
cd([pathname,newdir]) 

% Call-up the open Figures and plot the i,j point on the map and save in
% the folder created above
nbre_maps = size(datamap.name,2);
for k = 1:nbre_maps
 if ismember(k, handles.indx2use)
    hfig= figure(eval(['handles.Figmap_', num2str(k)]));
    hold on
    plot(i,j,'o','color', 'w', 'markersize', 6, 'MarkerFaceColor', 'none','linewidth',2)
    text(i-10,j-15, annotate, 'color', 'w', 'interpreter', 'none', 'fontsize', 8,'fontweight','bold')
    % save the handle of each figure for other routines
    eval(['handles.Figmap_',num2str(k), '= hfig;'])
    % save the XAS point locations on the XRF map as a bmp file
    saveas(gcf, [filexas(1:find(filexas == '.')-1),'_',datamap.name{k},'_XAS_location'], 'bmp')
 end
end
cd(current)

guidata(hObject, handles)

%%%================= XFS point locations on XRF maps ======================

% --- Executes on button press in pb_XFSpointloc.
function pb_XFSpointloc_Callback(hObject, eventdata, handles)
% hObject    handle to pb_XFSpointloc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% First check that XRF autoprocess has been run and that a map is indeed already
% opened
if ~isfield(handles, 'data')
    msgbox('Please run XRF Map auto first')
    return
end

if isempty(findobj('name','XRF maps'))
    msgbox('No XRF map available - Please run XRF Map auto')
    return
end

datamap = handles.data; % these are the data after running XRF maps first

% open .mca files only
% First identify a directory where to look for the files
default_directory = get(handles.edit_defaultdirectory, 'string');
current_directory = get(handles.edit_currentdirectory, 'string');
current = cd;
cd(handles.dirname);
clc;
set(handles.rb_spc_all, 'value', 0)
set(handles.rb_spc_single, 'value', 0)
set(handles.rb_mca_all, 'value', 0)
set(handles.rb_mca_single, 'value', 1)
% upload the .mca as file single file selection
[filemca, pathname] = uigetfile('*.mca', 'Select a SINGLE file');
    
    if isequal(filemca,0) || isequal(pathname,0)
        cd(current)
       msgbox('Upload cancelled')
       return
    end

cd(current)
datamca = openfiledotmca([pathname, filemca]);
            
% read X,Y positions in the .mca file
Xposmca = datamca.mcaXYpositions(1,1);
Yposmca = datamca.mcaXYpositions(1,2);

% convert to pixels i,j,
% data.XYstep must have 2 components: X pixel size and Y pixel size
% some files have data.XYstep with 3 components; in which case only comp 1 and comp 3 are the X and Y pixel size.
% In this patch, account for the fact that data.XY step has 2 or 3 elements, and force it to have only 2 elements
if size(datamap.XYstep, 2) == 3
    datamap.XYstep = [datamap.XYstep(1), datamap.XYstep(3)];
end
i= -round((Xposmca-datamap.Xrange(1))/datamap.XYstep(1,1));
j= -round((Yposmca-datamap.Yrange(1))/datamap.XYstep(1,2));

% create folder where to save the XRF maps with annotated XFS point locations
current = cd;
cd(pathname)
d = dir;
dir_list = [d(:).isdir]; % logical vector of the directories in the root directory
ind_dir=find(dir_list == 1);
ind_dir = ind_dir(3: size(ind_dir,2)); % these are the subfolders in the current directory

newdir = [filemca(1:find(filemca == '.')-1),'_XFS'];

%indanno = find(filemca == '_');
%annotate = filemca(indanno(size(indanno,2)-1)+1: find(filemca == '.')-1); % this is the legend to be put right above MCA point location
annotate = filemca(find(filemca == '.')-3:find(filemca == '.')-1);


[SUCCESS,MESSAGE,MESSAGEID] = mkdir(newdir);
cd([pathname,newdir]) 

% Call-up the open Figures and plot the i,j point on the map and save in
% the folder created above
nbre_maps = size(datamap.name,2);
for k = 1:nbre_maps
  if ismember(k,handles.indx2use)  
    hfig= figure(eval(['handles.Figmap_', num2str(k)]));
    hold on
    plot(i,j,'o','color', 'w', 'markersize', 6, 'MarkerFaceColor', 'none','linewidth',2)
    text(i-12,j-15, annotate, 'color', 'w', 'interpreter', 'none', 'fontsize', 10,'FontWeight','bold')
    % save the handle of each figure for other routines
    eval(['handles.Figmap_',num2str(k), '= hfig;'])
    % save the XFS point locations on the XRF map as a bmp file
    saveas(gcf, [filemca(1:find(filemca == '.')-1),'_',datamap.name{k},'_MCA_location'], 'bmp')
  end
end
cd(current)

guidata(hObject, handles)

%%%========================================================================

% --- Executes on button press in rb_mca_single.
function rb_mca_single_Callback(hObject, eventdata, handles)
% hObject    handle to rb_mca_single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') == 1
    set(handles.rb_spc_all, 'value', 0)
    set(handles.rb_spc_single, 'value', 0)
    set(handles.rb_mca_all, 'value', 0)
end
guidata(hObject, handles)


% --- Executes on button press in rb_mca_all.
function rb_mca_all_Callback(hObject, eventdata, handles)
% hObject    handle to rb_mca_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value') == 1
       set(handles.rb_spc_single, 'value', 0)
       set(handles.rb_mca_single, 'value', 0)
       set(handles.rb_spc_all, 'value', 0)
end
guidata(hObject, handles)


function edit_deadtime_Callback(hObject, eventdata, handles)
% hObject    handle to edit_deadtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_deadtime as text
%        str2double(get(hObject,'String')) returns contents of edit_deadtime as a double


% --- Executes during object creation, after setting all properties.
function edit_deadtime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_deadtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% for each SCA, view the first 3 lines and last 3 lines of the matrix, overlay and take the difference 
   

% function to open the data file;
% The output data is a cell with 2 elements:
% data.energy = energy range of the scans
% data.I = has NbreOfScalers matrixes.
% Each matrix has dimensions of NbreOfLines x Energy
function [data] = openmapfile(file)
  
fid = fopen(file);
if fid == -1
    msgbox('The file cannot be opened')
    return
else
    line = {};
    for i = 1:50
        line{i} = fgetl(fid);
    end
    
    %X Scan range in um
     idc = strfind(line,'X scan range'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 2, 'last');
     Xscan_min = str2num(rline(index(1)+1:index(2)-1));
     Xscan_max = str2num(rline(index(2)+1:length(rline)));
     Xrange = [Xscan_min, Xscan_max];
     
    %YScan range in um
     idc = strfind(line,'Y scan range'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 2, 'last');
     Yscan_min = str2num(rline(index(1)+1:index(2)-1));
     Yscan_max = str2num(rline(index(2)+1:length(rline)));
     Yrange = [Yscan_min, Yscan_max];
     
     % # points & # of scan lines
     idc = strfind(line,'# points'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word 
     rline = line{ind};
     index = find(isspace(rline) == 1,2,'last');
     Nbre_points = str2num(rline(index(1)+1:index(2)-1));
     Nbre_lines = str2num(rline(index(2)+1:length(rline)));
     [Nbre_points, Nbre_lines];
     
     % Scan steps in X and Y
     idc = strfind(line,'Scan steps'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 1, 'last');
     X_step = abs(str2num(rline(index(1)+1:index(1)+5)));
     Y_step = abs(str2num(rline(index(1)+7:length(rline))));
     [X_step, Y_step];
    
     %Dwell time
     idc = strfind(line,'Dwell time'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 1, 'last');
     dwell_time = str2num(rline(index(1)+1:length(rline)));
    
    %Energy
     idc = strfind(line,'Energy'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 1, 'last');
     energy = str2num(rline(index(1)+1:length(rline)));
     
    % Nbre of SCA
     idc = strfind(line,'# of SCAs'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 1, 'last');
     Nre_of_SCA = str2num(rline(index(1)+1:length(rline)));
     
    % Now read lower, upper & name in a cell array
        lower = [];
        upper = [];
        for k=1:Nre_of_SCA
         rline = line{ind+1+k};
         index = find(isspace(rline) == 1);
            if size(index, 2) < 2
                msgbox('Error in Element format')
                return
            else
                lower = [lower; str2num(rline(1:index(1)-1))];
                upper = [upper; str2num(rline(index(1)+1:index(2)-1))];
                name{k} = rline(index(2)+1:length(rline));
            end
        end
     
     % Data array size: d is the # of SCA, M column x N lines
     idc = strfind(line,'Data array size'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(isspace(rline) == 1,3,'last');
        d = str2num(rline(index(1)+1:index(2)-1));
        M = str2num(rline(index(2)+1:index(3)-1));
        N = str2num(rline(index(3)+1:length(rline)));
        [d, M ,N];
        
     % I0 array: do not look for I0 since it appears in two line; select index line +1 from 'Data array " line  
     rline = line{ind+1};
     index = find(isspace(rline) == 1, 1, 'first');
     I0 = str2num(rline(5:length(rline)));
end
fclose(fid);
Datablock_start = ind + 2;


 %Now read the SCA
 % every SCA has 246 entries per line and M=327 lines here.
 % This has to be repeated d (~15 times)

 %Sequence to get the data: close file - reopen - skip W line until the line of I0
 % the number of lines is d x M
 fid = fopen(file); % reopen the file
 DataBlock = d*M;
 % read all data in a single cell block
 for i = 1:Datablock_start + DataBlock 
        line{i} = fgetl(fid);
 end
 
 i = Datablock_start;
for p = 1:d % one for each element
   X=[];
   
   for k=1:M   % read line by line
     rline = str2num(line{i}); 
     i=i+1;
     if  ~isequal(rline, zeros(size(rline)))
      X=[X;rline];
     end
   end
   eval(['data.SCA_',num2str(p), '=X;'])
end
fclose(fid);

% Some of the lines were 0 and have been skipped in newly added line
% 138-140; I need to redifine the parameters
NbreOfLine_total = M;
NbreOfLine_with_data=size(X,1);
I0 = I0(:,1:NbreOfLine_with_data); % This one has been 

data.Xrange = Xrange; 
data.Yrange = Yrange;
data.XYstep = [X_step, Y_step];
data.PTXY = [Nbre_points, NbreOfLine_with_data];
data.dwell_time = dwell_time;
data.I0 = I0';
data.energy = energy;
data.name = name;
data.Nre_of_SCA= Nre_of_SCA;


% function to open the data file;
% The output data is a cell with 2 elements:
% data.energy = energy range of the scans
% data.I = has NbreOfScalers matrixes.
% Each matrix has dimensions of NbreOfLines x Energy
function [data] = openmapfile_general(file)
  
fid = fopen(file);
if fid == -1
    msgbox('The file cannot be opened')
    return
else
    line = {};
    for i = 1:50
        line{i} = fgetl(fid);
    end
    
    %X Scan range in um
     idc = strfind(line,'X scan range'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 2, 'last');
     Xscan_min = str2num(rline(index(1)+1:index(2)-1));
     Xscan_max = str2num(rline(index(2)+1:length(rline)));
     Xrange = [Xscan_min, Xscan_max];
     
    %YScan range in um
     idc = strfind(line,'Y scan range'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 2, 'last');
     Yscan_min = str2num(rline(index(1)+1:index(2)-1));
     Yscan_max = str2num(rline(index(2)+1:length(rline)));
     Yrange = [Yscan_min, Yscan_max];
     
     % # points & # of scan lines
     idc = strfind(line,'# points'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word 
     rline = line{ind};
     index = find(isspace(rline) == 1,2,'last');
     Nbre_points = str2num(rline(index(1)+1:index(2)-1));
     Nbre_lines = str2num(rline(index(2)+1:length(rline)));
     [Nbre_points, Nbre_lines];
     
     % Scan steps in X and Y
     idc = strfind(line,'Scan steps'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 1, 'last');
     X_step = abs(str2num(rline(index(1)+1:index(1)+5)));
     Y_step = abs(str2num(rline(index(1)+7:length(rline))));
     [X_step, Y_step];
    
     %Dwell time
     idc = strfind(line,'Dwell time'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 1, 'last');
     dwell_time = str2num(rline(index(1)+1:length(rline)));
    
    %Energy
     idc = strfind(line,'Energy'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 1, 'last');
     energy = str2num(rline(index(1)+1:length(rline)));
     
    % Nbre of SCA
     idc = strfind(line,'# of SCAs'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(rline == ' ', 1, 'last');
     Nre_of_SCA = str2num(rline(index(1)+1:length(rline)));
     
    % Now read lower, upper & name in a cell array
        lower = [];
        upper = [];
        for k=1:Nre_of_SCA
         rline = line{ind+1+k};
         index = find(isspace(rline) == 1);
            if size(index, 2) < 2
                msgbox('Error in Element format')
                return
            else
                lower = [lower; str2num(rline(1:index(1)-1))];
                upper = [upper; str2num(rline(index(1)+1:index(2)-1))];
                name{k} = rline(index(2)+1:length(rline));
            end
        end
     
     % Data array size: d is the # of SCA, M column x N lines
     idc = strfind(line,'Data array size'); % this is a cell array
     idx = ~cellfun('isempty',idc); % convert from cell array to matrix
     ind = find(idx==1); % this is the line that contains the word "Data"
     rline = line{ind};
     index = find(isspace(rline) == 1,3,'last');
        d = str2num(rline(index(1)+1:index(2)-1));
        M = str2num(rline(index(2)+1:index(3)-1));
        N = str2num(rline(index(3)+1:length(rline)));
        [d, M ,N];
        
     % I0 array: do not look for I0 since it appears in two lines; select index line +1 from 'Data array " line  
     rline = line{ind+1};
     index = find(isspace(rline) == 1, 1, 'first');
     I0 = str2num(rline(5:length(rline)));
end
fclose(fid);
Datablock_start = ind + 2;


 %Now read the SCA, every SCA has 246 entries per line and M=327 lines here.
 % This has to be repeated d (~15 times). Sequence to get the data
 %: close file - reopen - skip W line until the line of I0, the number of lines is d x M
 fid = fopen(file); % reopen the file
 DataBlock = d*M;
 % read all data in a single cell block
 for i = 1:Datablock_start + DataBlock 
        line{i} = fgetl(fid);
 end
 
i = Datablock_start;
for p = 1:d % one for each element
   X=[];
   
   for k=1:M   % read line by line
     rline = str2num(line{i}); 
     i=i+1;
     if  ~isequal(rline, zeros(size(rline)))
      X=[X;rline];
     end
   end
   eval(['data.SCA_',num2str(p), '=X;'])
end
fclose(fid);

% Some of the lines were 0 and have been skipped in newly added line
% 138-140; I need to redifine the parameters
NbreOfLine_total = M;
NbreOfLine_with_data=size(X,1);
I0 = I0(:,1:NbreOfLine_with_data); % This one has been 

data.Xrange = Xrange; 
data.Yrange = Yrange;
data.XYstep = [X_step, Y_step];
data.PTXY = [Nbre_points, NbreOfLine_with_data];
data.dwell_time = dwell_time;
data.I0 = I0';
data.energy = energy;
data.name = name;
        

% open files with .mca extension.the return variable is data
% data.Energy contains the value of Energy
% data.spectrum is a 2 x  N matrix with 1st colum is Energy, the 2nd colum
% the fluorescence intensity

function [data] = openfiledotmca(filename)

file = filename;

fid = fopen(file);
 if fid == -1
            msgbox('This file cannot be opened')
            return
 end

spec= [];
% Number of ROIs 1
    line = fgetl(fid);
% Low, high bins:
    line = fgetl(fid);
% 0 2047
    line = fgetl(fid);
% Energy at ch. 0 0.000000
    line = fgetl(fid);
    %Some file have an extra line for high low; must be skipped if present
    if ~strcmp(line(1),'E')
        line = fgetl(fid);
    end
% eV/channel 10.000000
    line = fgetl(fid);
% Selected detector -1
    line = fgetl(fid);
% Title: fragment_reg1bmulti_10keV_redo
    line = fgetl(fid);
    %sometimes the title is skipped, and the next line is XIA detector def
    %file
    if ~strcmp(line(1:3), 'XIA')
    % XIA detector def. file
        line = fgetl(fid);
    end
% XIA detector config (.scg) file
    line = fgetl(fid);
    index = find(line == '\', 1, 'last');
    detector = line(index+1:index+3);
% Stage position  -19715.094635 -49075.263953
    line = fgetl(fid);
    index = find(line == ' ', 2, 'last');
    Positions = [str2double(line(index(1)+1:index(2)-1)),str2double(line(index(2)+1:size(line,2)))];
% Livetime 89.898461
    line = fgetl(fid);
% I0 0.134687
    line = fgetl(fid);
    index = find(line == ' ', 1, 'last');
    I0 = str2double(line(index+1:size(line,2)));
% Energy 10000.000789
    line = fgetl(fid);
    index = find(line == ' ', 1, 'last');
    Energy = str2double(line(index+1:size(line,2)));
% Slits 39.931904 14.666933
    line = fgetl(fid);
% log(I0 gain) 9.301030
    line = fgetl(fid);
%     index = find(line == ' ', 1, 'last');
%     I0 = str2double(line(index+1:size(line,2)));
% Deadtimes(us): 0.562000
    line = fgetl(fid);
    index = find(line == ' ', 1, 'last');
    %deadtimes = str2double(line(index+1:size(line,2)));
    deadtimes = str2double(line(index+1:index+7));
% Sum DT(us):0.562000
    line = fgetl(fid);
% Number of bins 2048
    line = fgetl(fid);
% Time&Date 10/3/2021 8:47:15 PM
    line = fgetl(fid);
% Spectrum
    line = fgetl(fid); %
% starts to read the data, i.e. 1st column = ; 2nd colum = intensity  
while 1
    line = fgetl(fid);
        if ~ischar(line), break, end
        ind = find(line == ' ');
        d = [str2double(line(1:ind-1)), str2double(line(ind+1:size(line,2)))];
        spec = [spec; d];
end
data.Energy = Energy;
data.spectrum = spec;
data.I0= I0;
data.deadtimes = deadtimes;
data.detector = detector;
data.mcaXYpositions = Positions;
fclose(fid);

function data = readfile(source)

if nargin < 1
   error('No source file specified.');
end;

[source] = locGetSourceFiles(source);
data = locLoadScope(source);
%-----------------------------------------------------------------------------
function [fNames] = locGetSourceFiles(source)
% translate various input parameter configurations into a list of dir() structures
if ischar(source)
   if all(size(source) > 1)
      error('Source file can not be a string array (use cell array of strings instead)');
   end;
   
   % get dir structure
   fNames = dir(source);
   [p, f, e] = fileparts(source);
   for i = 1 : length(fNames)
      fNames(i).name = fullfile(p, fNames(i).name);
   end;

elseif iscell(source)
   for i = 1 : length(source)
      t = dir(source{i});
	   for i2 = 1 : length(t)
   	   t(i).name = fullfile(p, t(i).name);
   	end;
      
      fNames = [fNames; t];
   end;
else
   error('Invalid source provided (can not be a numerical value)');
end;
%-----------------------------------------------------------------------------
function data = locLoadScope(source)
% load scope files
data = [];
for i = 1 : length(source)
   val = locLoadScopeFile(source(i).name);
   if i == 1
      data = val;
   else
      data(i) = val;
   end;
   
end;
%-----------------------------------------------------------------------------
function data = locLoadScopeFile(source)
% load individual scope file
data = [];
[p, f, e] = fileparts(source);
if isempty(e)
   e = '.e';
end;

source = fullfile(p, [f e]);

if exist(source, 'file') ~= 2
   error(['File not found (check path and name): ' source]);
end;

data.source = source;

fid = fopen(source, 'r');

for i = 1:19
    line = fgetl(fid);
end

% read remaining chunk
s = fread(fid);
fclose(fid);
s(min(find(s == '>')) : end) = [];

s(find(s == 9)) = ',';
s(find(s == 13)) = ';';
s(find(s< 32)) = [];

val = str2num(['[' setstr(s)' ']']);

data.lambda = val(:, 1);
data.adu = val(:, 2);
%-----------------------------------------------------------------------------


function y=LambertW(x)
% LAMBERTW implementation of the LambertW function
%   y=LambertW(x) computes the solution of x=y+exp(y) using
%   bisection

f=@(y) y+exp(y);
tol=1e-1;
a=-2; b=2;
y=(a+b)/2;
while (b-a)>tol,
  if f(y)<x, a=y; else b=y; end;
  y=(a+b)/2;
end;



function ed_postedge_Callback(hObject, eventdata, handles)
% hObject    handle to ed_postedge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_postedge as text
%        str2double(get(hObject,'String')) returns contents of ed_postedge as a double


% --- Executes during object creation, after setting all properties.
function ed_postedge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_postedge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_oa.
function pb_oa_Callback(hObject, eventdata, handles)
% hObject    handle to pb_oa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Y = Y/(a+1-y*a)   %a = overabs factor


function ed_oa_Callback(hObject, eventdata, handles)
% hObject    handle to ed_oa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_oa as text
%        str2double(get(hObject,'String')) returns contents of ed_oa as a double


% --- Executes during object creation, after setting all properties.
function ed_oa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_oa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rb_oa.
function rb_oa_Callback(hObject, eventdata, handles)
% hObject    handle to rb_oa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_oa



function ed_predgecutoff_Callback(hObject, eventdata, handles)
% hObject    handle to ed_predgecutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_predgecutoff as text
%        str2double(get(hObject,'String')) returns contents of ed_predgecutoff as a double


% --- Executes during object creation, after setting all properties.
function ed_predgecutoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_predgecutoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rb_stackplot.
function rb_stackplot_Callback(hObject, eventdata, handles)
% hObject    handle to rb_stackplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rb_stackplot



function edit_stackPlot_Callback(hObject, eventdata, handles)
% hObject    handle to edit_stackPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_stackPlot as text
%        str2double(get(hObject,'String')) returns contents of edit_stackPlot as a double


% --- Executes during object creation, after setting all properties.
function edit_stackPlot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_stackPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_stackplotraw_Callback(hObject, eventdata, handles)
% hObject    handle to edit_stackplotraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_stackplotraw as text
%        str2double(get(hObject,'String')) returns contents of edit_stackplotraw as a double


% --- Executes during object creation, after setting all properties.
function edit_stackplotraw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_stackplotraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_close.
function pb_close_Callback(hObject, eventdata, handles)
guidata(hObject,handles);
close(handles.figure1)



function ed_element_Callback(hObject, eventdata, handles)
% hObject    handle to ed_element (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_element as text
%        str2double(get(hObject,'String')) returns contents of ed_element as a double


% --- Executes during object creation, after setting all properties.
function ed_element_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_element (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%% I LOVE MATLAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% ==================== Crop QXAS spectra ================================

% --- Executes on button press in pb_crop.
function pb_crop_Callback(hObject, eventdata, handles)
% hObject    handle to pb_crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = cd;

ecropmin = str2double(get(handles.ed_cropEmin, 'string'));
ecropmax = str2double(get(handles.ed_cropEmax, 'string'));

if get(hObject,'Value') == 1
    index = [get(handles.rb_scaler0, 'value'), get(handles.rb_scaler1, 'value'),...
        get(handles.rb_scaler2, 'value'), get(handles.rb_scaler3, 'value'),...
        get(handles.rb_scaler4, 'value'), get(handles.rb_scaler5, 'value'),...
        get(handles.rb_scaler6, 'value'), get(handles.rb_scaler7, 'value'),...
        get(handles.rb_scaler8, 'value'),get(handles.rb_scaler9, 'value'),...
        get(handles.rb_scaler10, 'value'),get(handles.rb_scaler11, 'value'),...
        get(handles.rb_scaler12, 'value')];

    axes(handles.axes_preprocessed);
    hold off
    data=handles.data;
    energy = data.energy/1000;
   
    % crop the energy scale from Emin to Emax & Crop the Intensity cell
    % array
    indemin = find(energy > ecropmin/1000,1);
    if ecropmax/1000 < max(energy)
        indemax = find(energy > ecropmax/1000,1);
    else
        msgbox('The energy boundaries are too large to crop')
    end
    energy = energy(1,indemin:indemax);

    for k=1:size(handles.data.I,2)
        Int = data.I{k};
        Intensity{1,k} = Int(:,indemin:indemax);
    end
    %-------------------------------------

    scaler_select = find(index == 1);
    
    axes(handles.axes_preprocessed);
    set(handles.axes_preprocessed, 'visible', 'on');
    set(handles.text4, 'visible', 'on');
    
    if get(handles.rb_multipleload,'value')==0 % single file
        ind = find(handles.XASfile == '.');
        ind2plot = find(index == 1);
        I= [];

        for j=1:size(ind2plot,2)
            k = ind2plot(j);
            a = Intensity{1,k}./Intensity{1,1};
            plot(energy, mean(a), 'k', 'linewidth', 1)
            hold on
        end  
        grid
        ax = gca;
        ax.FontSize = 6;
        xlabel('Energy [keV]', 'fontsize', 7, 'fontweight', 'bold')
        ylabel('Absorption (a.u.)', 'fontsize', 7, 'fontweight', 'bold')
        title(handles.XASfile(1:ind-1),'fontsize', 12, 'fontweight', 'bold', 'interpreter','none')
     end
    
    if get(handles.rb_multipleload,'value')==1
            % htemp=figure;
            % set(htemp, 'name', 'temp','color','white','visible','off')
            XASfile = handles.XASfileAv{1};
            spec = handles.XASAbsAv; % this is the full-scale average spectrum that needs to be cropped
            Intensity = spec(1,indemin:indemax);
            plot(energy, Intensity, 'k', 'linewidth', 1)
            axis('auto')
            ax = gca;
            ax.FontSize = 6;
            xlabel('Energy [keV]', 'fontsize', 7, 'fontweight', 'bold')
            ylabel('Absorption (a.u.)', 'fontsize', 7, 'fontweight', 'bold')
            name_ext = [];
            ind = find(XASfile == '.');
            for p = 1:size(handles.XASfileAv,2)
                nn=handles.XASfileAv{1,p};
                name_ext = [name_ext, nn(1,ind-4:ind-1)];
            end
            title([XASfile(1:ind-5),'_Raw_avg',name_ext],'fontsize', 8, 'fontweight', 'bold', 'interpreter','none')
            end
    
end
handles.data.energy = energy*1000;
handles.data.I = Intensity;
handles.XASAbsAv = Intensity;
cd(current)
guidata(hObject, handles)


function ed_cropEmin_Callback(hObject, eventdata, handles)
% hObject    handle to ed_cropEmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_cropEmin as text
%        str2double(get(hObject,'String')) returns contents of ed_cropEmin as a double


% --- Executes during object creation, after setting all properties.
function ed_cropEmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_cropEmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ed_cropEmax_Callback(hObject, eventdata, handles)
% hObject    handle to ed_cropEmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_cropEmax as text
%        str2double(get(hObject,'String')) returns contents of ed_cropEmax as a double


% --- Executes during object creation, after setting all properties.
function ed_cropEmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_cropEmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%% ==================== Difference of two QXAS spectra ===================

% --- Executes on button press in pb_diffPS.
function pb_diffPS_Callback(hObject, eventdata, handles)
% hObject    handle to pb_diffPS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

current = cd;

[spectrum1, pathname1] = uigetfile('*.xls', 'Select a first processed spectrum','multiselect','off');
    
    if isequal(spectrum1,0) || isequal(pathname1,0)
       h=msgbox('Upload file cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end

    spec1 = xlsread([pathname1,spectrum1]);
    cd(pathname1)

[spectrum2, pathname2] = uigetfile('*.xls', 'Select the second processed spectrum','multiselect','off');
    
    if isequal(spectrum2,0) || isequal(pathname2,0)
       h=msgbox('Upload file cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end
    spec2 = xlsread([pathname2,spectrum2]);
    cd(pathname2)

    if isempty(spec1) || isempty(spec2)
       h=msgbox('one of the excel files cannot be read');
       pause(5)
       cd(current)
       delete(h)
       return
    end

     % Name of the two spectra
    ix1 = find(spectrum1 == '_',2,'last');
    fn1=[spectrum1(1:7),'_',spectrum1(ix1-3:ix1-1)];
    ix2 = find(spectrum2 == '_',2,'last');
    fn2=[spectrum2(1:7),'_',spectrum2(ix2-3:ix2-1)];
    %------------------------------------------------------
   
    % plot the two processed spectra in the same figure
    hfigdiff = figure;
    set(hfigdiff,'color','white')
    movegui(hfigdiff,'west')

    leg={spectrum1(1:find(spectrum1=='.')-15), spectrum2(1:find(spectrum2=='.')-15),...
        ['Difference: ',spectrum1(1:find(spectrum1=='.')-15),' - ', spectrum2(1:find(spectrum2=='.')-15) ]}; % this is the legend
    plot(spec1(:,1), spec1(:,2),'k')
    hold on
    plot(spec2(:,1), spec2(:,2),'r')
    xlabel('Energy keV')
    ylabel('Normalized absorption')

    % plot the difference
    Emin = max(spec1(1,1), spec2(1,1));
    Emax = min(max(spec1(:,1)), max(spec2(:,1)));
    estep = min(min(diff(spec1(:,1))),min(diff(spec2(:,1))));
    E = Emin:estep:Emax;
    sp1sp = spline(spec1(:,1), spec1(:,2),E);
    sp2sp = spline(spec2(:,1), spec2(:,2),E);

    plot(E, sp1sp-sp2sp, 'b')
    legend(leg,'fontsize', 10, 'Interpreter','none')

% Save the difference plot as bmp and excel
    T = array2table([E; sp1sp-sp2sp]');
    T.Properties.VariableNames(1:2) ={'Energy (keV)','Difference Spectrum'};
    writetable(T,[fn1,'_minus_', fn2,'.xls'])
    saveas(hfigdiff, [fn1,'_minus_', fn2], 'bmp')

cd(current)
guidata(hObject, handles)  

%%% ==================== Division of two QXAS spectra =====================

% --- Executes on button press in pb_divide_spec.
function pb_divide_spec_Callback(hObject, eventdata, handles)
% hObject    handle to pb_divide_spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

current = cd;

[spectrum1, pathname1] = uigetfile('*.xls', 'Select a first processed spectrum','multiselect','off');
    
    if isequal(spectrum1,0) || isequal(pathname1,0)
       h=msgbox('Upload file cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end

    spec1 = xlsread([pathname1,spectrum1]);
    cd(pathname1)

[spectrum2, pathname2] = uigetfile('*.xls', 'Select the second processed spectrum','multiselect','off');
    
    if isequal(spectrum2,0) || isequal(pathname2,0)
       h=msgbox('Upload file cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end
    spec2 = xlsread([pathname2,spectrum2]);
    cd(pathname2)

    if isempty(spec1) || isempty(spec2)
       h=msgbox('one of the excel files cannot be read');
       pause(5)
       cd(current)
       delete(h)
       return
    end

    % Name of the two spectra
    ix1 = find(spectrum1 == '_',2,'last');
    fn1=[spectrum1(1:7),'_',spectrum1(ix1-3:ix1-1)];
    ix2 = find(spectrum2 == '_',2,'last');
    fn2=[spectrum2(1:7),'_',spectrum2(ix2-3:ix2-1)];
    %------------------------------------------------------
   
    % plot the two processed spectra in the same figure
    hfigdiv = figure;
    set(hfigdiv,'color','white')
    movegui(hfigdiv,'west')
    leg={spectrum1(1:find(spectrum1=='.')-15), spectrum2(1:find(spectrum2=='.')-15), ...
        ['Divide: ',spectrum1(1:find(spectrum1=='.')-15),' / ', spectrum2(1:find(spectrum2=='.')-15) ]}; % this is the legend
    plot(spec1(:,1), spec1(:,2),'k')
    hold on
    plot(spec2(:,1), spec2(:,2),'r')
    xlabel('Energy keV')
    ylabel('Normalized absorption')

    % plot spec 1 divided by spec 2
    Emin = max(spec1(1,1), spec2(1,1));
    Emax = min(max(spec1(:,1)), max(spec2(:,1)));
    estep = min(min(diff(spec1(:,1))),min(diff(spec2(:,1))));
    E = Emin:estep:Emax;
    sp1sp = spline(spec1(:,1), spec1(:,2),E);
    sp2sp = spline(spec2(:,1), spec2(:,2),E);

    plot(E, sp1sp./sp2sp, 'b')
    legend(leg, 'fontsize', 10, 'interpreter', 'none')

    % Save the divide plot figure as bmp and excel
    T = array2table([E; sp1sp./sp2sp]');
    T.Properties.VariableNames(1:2) ={'Energy (keV)','Divide Spectrum'};
    writetable(T,[fn1,'_Divided_by_', fn2,'.xls'])
    saveas(hfigdiv, [fn1,'_Divided_by_', fn2], 'bmp')

cd(current)
guidata(hObject, handles)

%%% =============== Substraction of two XFS spectra =======================

% --- Executes on button press in pb_substractXFSspec.
function pb_substractXFSspec_Callback(hObject, eventdata, handles)
% hObject    handle to pb_substractXFSspec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = cd;

[spectrum1, pathname1] = uigetfile('*.xls', 'Select a first processed XFS','multiselect','off');
    
    if isequal(spectrum1,0) || isequal(pathname1,0)
       h=msgbox('Upload file cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end

    spec1 = xlsread([pathname1,spectrum1]);

    cd(pathname1)

[spectrum2, pathname2] = uigetfile('*.xls', 'Select the second processed XFS','multiselect','off');
    
    if isequal(spectrum2,0) || isequal(pathname2,0)
       h=msgbox('Upload file cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end
    spec2 = xlsread([pathname2,spectrum2]);

    if isempty(spec1) || isempty(spec2)
       h=msgbox('one of the excel files cannot be read');
       pause(5)
       cd(current)
       delete(h)
       return
    end

    % Name of the two XFS spectra
    ix1 = find(spectrum1 == '_',2,'last');
    fn1=[spectrum1(1:7),'_',spectrum1(ix1-3:ix1-1)];
    ix2 = find(spectrum2 == '_',2,'last');
    fn2=[spectrum2(1:7),'_',spectrum2(ix2-3:ix2-1)];
    %------------------------------------------------------
   
    % plot the two processed spectra in the same figure
    hfigdiff = figure;
    set(hfigdiff,'color','white')
    movegui(hfigdiff,'west')
    leg={spectrum1, spectrum2}; % this is the legend
    leg{3}=['Difference: ',fn1,' - ', fn2]; % this is the legend

    plot(spec1(:,1), spec1(:,2),'k')
    hold on
    plot(spec2(:,1), spec2(:,2),'r')
    xlabel('Energy keV')
    ylabel('Log10 counts')

    % plot the difference
    Emin = max(spec1(1,1), spec2(1,1));
    Emax = min(max(spec1(:,1)), max(spec2(:,1)));
    estep = min(min(diff(spec1(:,1))),min(diff(spec2(:,1))));
    E = Emin:estep:Emax;
    sp1sp = spline(spec1(:,1), spec1(:,2),E);
    sp1sp(1,1)=0;
    sp2sp = spline(spec2(:,1), spec2(:,2),E);
    sp2sp(1,1)=0;

    plot(E, sp1sp-sp2sp, 'b')
    ax = axis;
    ax1 = str2double(get(handles.ed_mca_Emin,'string'));
    ax2 = str2double(get(handles.ed_mca_Emax,'string'));
    axis([ax1, ax2, ax(3), ax(4)]);
    legend(leg, 'interpreter', 'none')

    % Save the difference plot figure as bmp and excel
    T = array2table([E; sp1sp-sp2sp]');
    T.Properties.VariableNames(1:2) ={'Energy (keV)','Difference Spectrum'};
    writetable(T,[fn1,'_minus_', fn2,'.xls'])
    saveas(hfigdiff, [fn1,'_minus_', fn2], 'bmp')

cd(current)
guidata(hObject, handles)

%%%================ XAS point locations on XRF maps========================

% --- Executes on button press in pb_XASlocation_dat.
function pb_XASlocation_dat_Callback(hObject, eventdata, handles)
% hObject    handle to pb_XASlocation_dat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% First check that XRF autoprocess has been run and that a map is indeed already
% opened
if ~isfield(handles, 'data')
    msgbox('Please run XRF Map auto first')
    return
end

if isempty(findobj('name','XRF maps'))
    msgbox('No XRF map available - Please run XRF Map auto')
    return
end

datamap = handles.data; % these are the data after running XRF maps first

% open the .dat files
% First identify a directory where to look for the data files
default_directory = get(handles.edit_defaultdirectory, 'string');
current_directory = get(handles.edit_currentdirectory, 'string');
current = cd;
cd(handles.dirname);
% upload the .dat as file single file selection
[filexas, pathname] = uigetfile('*.dat', 'Select a SINGLE file');
    
    if isequal(filexas,0) || isequal(pathname,0)
       msgbox('Upload cancelled')
       cd(current)
       return
    end

cd(current)
dataxas = opentheselectedfiledotdat([pathname, filexas]);
            
% read X,Y positions in the .dat file
Xposxas = dataxas.XasPos(1,1);
Yposxas = dataxas.XasPos(1,2);

% convert to pixels i,j,
% data.XYstep must have 2 components: X pixel size and Y pixel size
% some files have data.XYstep with 3 components; in which case only comp 1 and comp 3 are the X and Y pixel size.
% In this patch, account for the fact that data.XY step has 2 or 3 elements, and force it to have only 2 elements
if size(datamap.XYstep, 2) == 3
    datamap.XYstep = [datamap.XYstep(1), datamap.XYstep(3)];
end
i= -round((Xposxas-datamap.Xrange(1))/datamap.XYstep(1,1));
j= -round((Yposxas-datamap.Yrange(1))/datamap.XYstep(1,2));

% create folder where to save the XRF maps with annotated XAS point locations
current = cd;
cd(pathname)
d = dir;
dir_list = [d(:).isdir]; % logical vector of the directories in the root directory
ind_dir=find(dir_list == 1);
ind_dir = ind_dir(3: size(ind_dir,2)); % these are the subfolders in the current directory

newdir = [filexas(1:find(filexas == '.')-1),'_XAS'];

indanno = find(filexas == '_',1,'last');
annotate = filexas(indanno+1: find(filexas == '.')-1); % this is the legend to be put right above XAS point location

[SUCCESS,MESSAGE,MESSAGEID] = mkdir(newdir);
cd([pathname,newdir]) 

% Call-up the open Figures and plot the i,j point on the map and save in
% the folder created above
nbre_maps = size(datamap.name,2);
for k = 1:nbre_maps
 if ismember(k, handles.indx2use)
    hfig= figure(eval(['handles.Figmap_', num2str(k)]));
    hold on
    plot(i,j,'o','color', 'w', 'markersize', 6, 'MarkerFaceColor', 'none','linewidth',2)
    text(i-10,j-15, annotate, 'color', 'w', 'interpreter', 'none', 'fontsize', 8,'fontweight','bold')
    % save the handle of each figure for other routines
    eval(['handles.Figmap_',num2str(k), '= hfig;'])
    % save the XAS point locations on the XRF map as a bmp file
    saveas(gcf, [filexas(1:find(filexas == '.')-1),'_',datamap.name{k},'_XAS_location'], 'bmp')
 end
end
cd(current)

guidata(hObject, handles)

%%%===================== XRF map Auto =====================================

% --- Executes on button press in pb_XRFmapauto.
function pb_XRFmapauto_Callback(hObject, eventdata, handles)

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The subroutine allows for the selection of 1 or 2 files to upload.
% if 1 file is uploaded, the data are saved in handles.data.
% if 2 files are uploaded, the data of the first file are saved in
% handles.data0, the data  for the 2nd files are saved in handles.data
clear data
set(handles.pb_process_spectra, 'visible', 'on')
cla(handles.axes_postprocessed);
axes(handles.axes_postprocessed);
set(handles.axes_postprocessed, 'visible', 'off');
set(handles.text5, 'visible', 'off')
current = cd;

close(findobj('name','XRF maps'));
close(findobj('name','bicolor map'));

% close all previously opened figures for the various elements
close(findobj('name', ''));

% Pick a directory where to look for the data files
default_directory = get(handles.edit_defaultdirectory, 'string');
current_directory = get(handles.edit_currentdirectory, 'string');

if ~isempty(current_directory)
    cd(current_directory)
else
    cd(default_directory)
end

[files, pathname] = uigetfile('*.xrf', 'Select a SINGLE raw file or TWO raw files','MultiSelect', 'on');
cd(current)

 if isequal(files,0) || isequal(pathname,0)
    msgbox('User pressed cancel')
    return
 end

 scans=1;  
 if iscell(files)   
     scans = 2;
 end
 
 for q=1:scans
     if iscell(files)   
      file = files{q};
     else
         file = files;
     end
     
     data = openmapfile([pathname,file]);
    

     if isempty(data)
        msgbox('Select a different file format')
        return
     end
     %Set the current directory to pathname
     set(handles.edit_currentdirectory, 'string',pathname)

    j = find(file == '.',1,'last'); 
   
    % plot the maps with scale (in um) based on the first SCA
    NbrePixel_X = data.PTXY(1);
    NbrePixel_Y = data.PTXY(2);
    XRange = data.Xrange(1)-data.Xrange(2);
    YRange = data.Yrange(1)-data.Yrange(2);
    PixelSize_X = XRange / NbrePixel_X;
    PixelSize_Y = YRange / NbrePixel_Y;

    % make a square matrix whose size is M x M where M = max(X, Y);
    % X and Y steps are nearly identical, so assume matrix size corresponds to
    % aspect ratio
    M = max(NbrePixel_X, NbrePixel_Y);
    m = NbrePixel_Y;
    % Ad is the nbre of line or columns to add to the matrix to make it
    % square
    if NbrePixel_X > NbrePixel_Y
        Ad = M-NbrePixel_Y;
        A = 0 * ones(Ad,NbrePixel_X);
    else
        Ad = M-NbrePixel_X;
        A = 0 * ones(NbrePixel_Y,Ad);
    end

    % option to plot on a single figure
    Z=str2num(get(handles.edit_scalebarsize, 'string'));
    fs = 14; % font size for the elements
    Cax = [str2double(get(handles.ed_cmin,'string')), str2double(get(handles.ed_cmax,'string'))];
    I0=data.I0;
    Norm = 1./I0;
    dwell = data.dwell_time;
    energy = data.energy;

    % pop-up menu to select which channels to use
    [indx2use,tf] = listdlg('ListString',data.name ,'PromptString','Select elements',...
                      'SelectionMode','multiples');
    if ~tf; return; end % user cancel

    for k = 1:size(data.name,2)             
       if ismember(k,indx2use) && ~isempty(data.name{k})
        Normx = Norm(1:size(eval(['data.SCA_', num2str(k)]),1),1);
        C = bsxfun(@times,eval(['data.SCA_', num2str(k)]), Normx(:))/dwell*1000; % SCA_k normalized by I0 / dwell_time * 1000 (counts per seconds
        C(C<0)=0;
        
        if NbrePixel_X < NbrePixel_Y
            hfig = figure('name','XRF maps','units','normalized','NumberTitle', 'off', 'color', 'white');
            if get(handles.rb_autoIntensity, 'value')==1
                imagesc([C, A(1:size(C,1), 1:min(size(C,2),size(A,2)))]);colormap 'turbo'; colorbar('northoutside','fontsize', 12)
                title (['Energy =', num2str(round(100*energy)/100), ' eV'], 'interpreter', 'none','fontsize', 10,'fontweight', 'normal')
            else
                imagesc([C, A(1:size(C,1), 1:min(size(C,2),size(A,2)))]);colormap 'turbo'; clim(Cax); colorbar('northoutside','fontsize', 12)
                title (['Energy =', num2str(round(100*energy)/100), ' eV'], 'interpreter', 'none','fontsize', 10,'fontweight', 'normal')
            end
    %Rectangle to mask the additional point to make the matrix square
            rectangle('position',[NbrePixel_X+1, 0, NbrePixel_Y-NbrePixel_X+1,NbrePixel_Y+1], 'facecolor', 'w', 'edgecolor', 'w') 
        elseif NbrePixel_X > NbrePixel_Y
           
            hfig = figure('name','XRF maps','units','normalized','NumberTitle', 'off', 'color', 'white');
            
            if get(handles.rb_autoIntensity, 'value')==1
                imagesc([C;A]);colormap 'turbo'; colorbar('northoutside','fontsize', 12) 
                title (['Energy =', num2str(round(100*energy)/100), ' eV'], 'interpreter', 'none','fontsize', 10,'fontweight', 'normal')
            else
              imagesc([C;A]); colormap 'turbo'; clim(Cax); colorbar('northoutside', 'fontsize', 12)
              title (['Energy =', num2str(round(100*energy)/100), ' eV'], 'interpreter', 'none','fontsize', 10,'fontweight', 'normal')
            end
     %Rectangle to mask the additional point to make the matrix square
            rectangle('position',[0, NbrePixel_Y+1, M+1,M-NbrePixel_Y], 'facecolor', 'w', 'edgecolor', 'w') 
        else % here the matrix is square, so no need to add the white rectangle
            hfig = figure('name','XRF maps','units','normalized','NumberTitle', 'off', 'color', 'white'); 
            if get(handles.rb_autoIntensity, 'value')==1
                imagesc(C);colormap 'turbo'; colorbar('northoutside', 'fontsize', 12) 
                title (['Energy =', num2str(round(100*energy)/100), ' eV'], 'interpreter', 'none','fontsize', 10,'fontweight', 'normal')
            else
                imagesc(C); colormap 'turbo'; clim(Cax); colorbar('northoutside', 'fontsize', 12)
                title (['Energy =', num2str(round(100*energy)/100), ' eV'], 'interpreter', 'none','fontsize', 10,'fontweight', 'normal')
            end
        end  
        txtpos = [NbrePixel_X+5,5];
        text(txtpos(1), txtpos(2), data.name{k},'FontName','Arial','Fontsize',12, 'fontweight', 'bold', 'BackgroundColor', 'none')
        txtposfile = [0,floor(1.1*NbrePixel_Y)];
        text(txtposfile(1), txtposfile(2), file,'FontName','Arial','Fontsize',10, 'fontweight', 'bold', 'BackgroundColor', 'none','interpreter','none')
        zoom on
        axis off
        axis square    
        
     %Horizontal scale bar
        line([0.9*NbrePixel_X-(Z/PixelSize_X) 0.9*NbrePixel_X], 0.95*[m, m], 'linewidth', 2, 'color', 'w')
        text(0.75*NbrePixel_X, 0.88*m, [num2str(Z),' um'],'FontName','Arial','Fontsize',10, 'fontweight', 'bold', 'color', 'w')

      lett = findstr(data.name{k}, '/');
      if ~isempty(lett)
          data.name{k}=erase(data.name{k},'/');
      end
      
      lett = findstr(file, '.');
      if ~isempty(lett)
          file=replace(file,'.','_');
      end
      
      cd(pathname)
      filename = [file(1:j-1),'_', data.name{k}];
      saveas(gcf, filename, 'bmp') 
      cd(current)
      % save the handle of each figure for other routines
      eval(['handles.Figmap_',num2str(k), '= hfig;'])
    end 
    end

    set(handles.pb_crosscorrelation, 'visible', 'on')
    handles.data = data;
    handles.Norm = Norm;
    handles.dwell = dwell;
    handles.dirname= pathname;
    handles.XRFfilename=file(1:j-1);% keep tab of the XRF map
    handles.hfig = hfig;
    handles.indx2use = indx2use;
    
    if iscell(files) && q == 1
      handles.data0 = data;
      handles.Norm0 = Norm;
      handles.dwell0 = dwell;
      handles.dirname0= pathname;
      handles.XRFfilename0=file(1:j-1);% keep tab of the XRF map
      handles.hfig0 = hfig;
      handles.indx2use = indx2use;
    end

end
guidata(hObject, handles)



% function edit_deadtimeXRF_Callback(hObject, eventdata, handles)
% % hObject    handle to edit_deadtimeXRF (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit_deadtimeXRF as text
% %        str2double(get(hObject,'String')) returns contents of edit_deadtimeXRF as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit_deadtimeXRF_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit_deadtimeXRF (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end

%%% ======================== XRF Histogram ================================

% --- Executes on button press in pb_xrfhistogram.
function pb_xrfhistogram_Callback(hObject, eventdata, handles)
% hObject    handle to pb_xrfhistogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% First check that XRF autoprocess has been run and that a map is indeed already
% opened
if ~isfield(handles, 'data')
    msgbox('Please run XRF Map auto first')
    return
end

if isempty(findobj('name','XRF maps'))
    msgbox('No XRF map available - Please run XRF Map auto')
    return
end

data = handles.data; % these are the data after running XRF maps first

indx2use = handles.indx2use;
% first check which figure is still on & only consider these three elements
active = zeros(1,size(data.name,3));
i=1;
for k=1:size(data.name,2)
   if ismember(k, indx2use) 
    if isa(eval(['handles.Figmap_',num2str(k)]),'handle') && isvalid(eval(['handles.Figmap_',num2str(k)]))
       active(1,k)=1;   
         eval(['F',num2str(i),'=data.SCA_',num2str(k),';']);
       i=i+1;
    end
   end
end

% Pick one element and produce histogram
indactive = find(active == 1);
if isempty(indactive)
    msgbox('Run XRF Map auto first')
    return
end

if ~isequal(i,2)
    hmes = msgbox('You must only have ONE map active');
    pause
    delete(hmes)
    return
end

Element1 = data.name{indactive(1,1)};

hfighisto = figure('name','XRF histogram','units','normalized','NumberTitle', 'off', 'color', 'white');
dwell = data.dwell_time;
Norm = 1./data.I0;
Normx = Norm(1:size(eval(['data.SCA_', num2str(indactive(1,1))])-1),1);
C = bsxfun(@times,eval(['data.SCA_', num2str(indactive(1,1))]), Normx(:))/dwell*1000; % SCA_k normalized by I0 / dwell_time * 1000 (counts per seconds
C(C<0)=0;

if max(C(:))>1000
    histogram(C(:),100)
else
    histogram(C(:))
end
xlabel('Fluorescence emission counts')
ylabel('Frequency')
title(['histogram of XRF map for element = ',data.name{indactive(1,1)}])

% Save the figure
        current = cd;
        cd(get(handles.edit_currentdirectory,'string'))  
H=dir;
name = ['Histogram_', data.name{indactive(1,1)}];
V = size(dir(['*',name,'*']),1);
saveas(hfighisto, [name, '_', num2str(V+1),'.bmp'])
guidata(hObject, handles)

%%%==================Avg of processed XAS spectra=========================

% --- Executes on button press in pb_avgprocessedspectra.
function pb_avgprocessedspectra_Callback(hObject, eventdata, handles)
% hObject    handle to pb_avgprocessedspectra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

current = cd;

cont = 1;
k=1;
fn={};
ext=[];
while cont == 1
    [spectrum, pathname] = uigetfile('*.xls', 'Select a processed spectrum','multiselect','off');
    
    if isequal(spectrum,0) || isequal(pathname,0)
       h=msgbox('last file uploaded, processing the average spectrum');
       pause(3)
       delete(h)
       cont = 0;
    else
        eval(['spec', num2str(k),' = xlsread([pathname,spectrum]);']);
        fname = spectrum;
        fn{k} = fname(1:min(find(fname=='_',2,'last'))-1);
        ext=[ext,'_',fname(min(find(fname=='_',2,'last'))-3:min(find(fname=='_',2,'last'))-1)];
        k=k+1; % the number of processed files is k-1
        cd(pathname)
        
    end
end

if ~exist('spec2')
     h=msgbox('no spectra selected; please select at least two spectra');
       pause(5)
       cd(current)
       delete(h)
       return
end

    % plot the processed spectra in the same figure
    % the number of processed files is k-1
    hfigAv = figure;
    set(hfigAv,'color','white')
    movegui(hfigAv,'west')

    Emin = 0;
    Emax = 1e10;
    estep = 1e10;
    leg = {};
    for p=1:k-1
        eval(['plot(spec',num2str(p),'(:,1), spec',num2str(p),'(:,2))'])
        hold on
        Emin = max(Emin,eval(['spec', num2str(p),'(1,1)']));
        Emax = min(Emax,eval(['max(spec', num2str(p),'(:,1))']));
        estep = min(estep, min(diff(eval(['spec',num2str(p),'(:,1)']))));
        leg{p} = fn{p};
    end
    xlabel('Energy keV')
    ylabel('Normalized absorption')
    
    
    % plot the average spectrum
    if estep<0
        estep=(Emax-Emin)/500;
    end
    E = Emin:estep:Emax;
    AvSpec=[];
    for p=1:k-1
        eval(['sp',num2str(p),'sp=spline(spec', num2str(p),'(:,1),spec', num2str(p),'(:,2),E);']);
        AvSpec=[AvSpec; eval(['sp',num2str(p),'sp'])];
    end
    plot(E, mean(AvSpec),'b')
    leg{k} = 'Average spectrum';
    legend(leg, 'Interpreter','none')
    fname = fname(1:min(find(fname=='_',3,'last')));
    title(fname(1:length(fname)-1),'fontsize', 9, 'interpreter','none')

    S = array2table([E; mean(AvSpec)]');
    S.Properties.VariableNames(1:2) ={'Energy (keV)','Average Spectrum'};
 
    %writetable(S,[fname,'av',ext,'.xls'])
    %writetable(S,[fname,'av',ext,'.txt'])
    writetable(S,[fname,'average spectrum.xls'])
    writetable(S,[fname,'average spectrum.txt'])
    %saveas(hfigAv, [fname,'av',ext], 'bmp')
    saveas(hfigAv, [fname,'average spectrum'], 'bmp')

cd(current)
guidata(hObject, handles)

%%%======================= QXAS 1st derivative ============================

% --- Executes on button press in pb_derivative.
function pb_derivative_Callback(hObject, eventdata, handles)
% hObject    handle to pb_derivative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current = cd;

if ~isempty(get(handles.edit_currentdirectory,'string'))
    cd(get(handles.edit_currentdirectory,'string'))
else
    cd(handles.standard_pathname)
end

[spectrum1, pathname1] = uigetfile('*.xls;*.txt', 'Select a processed spectrum','multiselect','off');
fname = spectrum1;

    if isequal(spectrum1,0) || isequal(pathname1,0)
       h=msgbox('Upload file cancelled');
       pause(5)
       cd(current)
       delete(h)
       return
    end
    
    %Find if file is .xls or.txt
    filetype = spectrum1(find(spectrum1=='.')+1);
    if filetype == 't'
        spec1=[];
        fid=fopen([pathname1,spectrum1]);

        if fid == -1
            msgbox('This file cannot be opened')
            return
        end

        for i=1:13
            line = fgetl(fid);
        end
        while 1
            line = fgetl(fid);
            if ~ischar(line), break, end
            ind = find(line == ' ');
            d = [str2double(line(1:ind-1)), str2double(line(ind+1:size(line,2)))];
            spec1 = [spec1; d];
        end
        spec1(:,1)=spec1(:,1)/1000; % energy in keV

    elseif filetype == 'x'
        spec1 = xlsread([pathname1,spectrum1]);
    else
        h=msgbox('wrong file type');
       pause(5)
       cd(current)
       delete(h)
       return
    end

    cd(pathname1)
    set(handles.edit_currentdirectory,'string', pathname1)

    % This is the 1st derivative spectrum
    Diffspec = diff(spec1(:,2))./(diff(spec1(:,1))*1000);

    % smooth the 1st deriv spectrum with average over N neighbord energies
    N=5;
    Diffspecsmoothed=[];
    Esmoothed=[];
    for k = 1:size(Diffspec)-N
        M = Diffspec(k:k+N,1);
        Esmoothed(k) = mean(spec1(k:k+N,1)); % smoothed energy in keV
        Diffspecsmoothed(k)=mean(M);
    end

    % Move the maximum of the first derivative to the adsorption tabulated value
    Esearchrange=3/1000;
    %Emax = Esmoothed(1,find(Diffspecsmoothed == max(Diffspecsmoothed))); % Glitch energy in keV
    Element = get(handles.ed_element,'string');
    A = element_absorption;
    indel = strfind(A(:,1),Element);
    indel = find(not(cellfun('isempty',indel)));
    Emax = A{indel,2}/1000;  % adsorption energy of the element tabulted in keV
    Iomins = Emax-Esearchrange;
    Iomaxs = min(Emax+Esearchrange,max(Esmoothed));
    Iomin_index = find(Esmoothed > Iomins, 1);
    Iomax_index = find(Esmoothed >= Iomaxs, 1);
    Spectemp = Diffspecsmoothed(1,Iomin_index:Iomax_index);
    etemp = Esmoothed(1,Iomin_index:Iomax_index);
   
    %find the max in the 1st derivative spectrum
    % use a polynomial fit of order with centering and rescaling
    a1 = min(etemp);
    a2 = max(etemp);
    estar = a1:(a2-a1)/100 : a2;
    order = 12;
    p = polyfit((etemp-mean(etemp))/std(etemp), Spectemp,order);
    etempval = polyval(p,(estar-mean(estar))/std(estar));
    emaxinterp = estar(find(etempval == max(etempval))); %max of the polyval
  
    % Set the correction in energy
    Eshift = (emaxinterp - Emax); % energy in keV
    % -------------------------------------------

    % plot the processed spectrum & its 1st derivative
    hfigdiff = figure;
    set(hfigdiff,'color','white')
    movegui(hfigdiff,'west')
    colororder({'k','r'})

    leg={spectrum1(1:find(spectrum1=='.')-15),...
        ['1st derivative: ',spectrum1(1:find(spectrum1=='.')-15)]}; % this is the legend
    yyaxis left
    plot(spec1(:,1), spec1(:,2),'k')
    hold on
    xlabel('Energy keV')
    ylabel('Normalized absorption')

    % plot the 1st derivative
    yyaxis right
    % plot(spec1(1:size(Diffspec),1), Diffspec,'c'); hold on % Non-smoothed
    % plot(spec1(1:size(Diffspec),1), Diffspec,'oc'); hold on % Non-smoothed
    % plot(Esmoothed, Diffspecsmoothed','sr') % smoothed
    %plot(Esmoothed, Diffspecsmoothed','r') % smoothed
    %plot(estar, etempval,'color',[0,1,0])
    plot(Esmoothed-Eshift, Diffspecsmoothed','r') % smoothed & shifted per tabulation
    %plot(Esmoothed-Eshift, Diffspecsmoothed','sr') % smoothed & shifted per tabulation
    ylabel('1st derivative of normalized absorption')
    legend(leg,'fontsize', 10, 'Interpreter','none')


% Save the difference plot figure as bmp and excel
    %T = array2table([spec1(1:size(Diffspec),1), Diffspec]); % Non smoothed
    T = array2table([(Esmoothed-Eshift)', Diffspecsmoothed']); % smoothed
    T.Properties.VariableNames(1:2) ={'Energy (keV)','1st derivative Spectrum'};
    %fname = fname(1:min(find(fname=='_',2,'last')));
    fn = fname(1:min(find(fname=='.',1,'last'))-1);
    writetable(T,[fn,'_1st_derivative_spectrum.xls'])
    saveas(hfigdiff, [fn,'_1st_derivative_spectrum'], 'bmp')

cd(current)
guidata(hObject, handles)  
