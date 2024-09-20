
function varargout = ValencePlot(varargin)
% VALENCEPLOT M-file for ValencePlot.fig
%      VALENCEPLOT, by itself, creates a new VALENCEPLOT or raises the existing
%      singleton*.
%
%      H = VALENCEPLOT returns the handle to a new VALENCEPLOT or the handle to
%      the existing singleton*.
%
%      VALENCEPLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VALENCEPLOT.M with the given input arguments.
%
%      VALENCEPLOT('Property','Value',...) creates a new VALENCEPLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ValencePlot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ValencePlot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ValencePlot

% Last Modified by GUIDE v2.5 28-Sep-2021 15:00:01
% Last Modified by SF 09-Jan-2019
% Begin initialization code - DO NOT EDIT

%set(axes1,'XMinorTick','on','XScale','log','XTick',1,'XTickLabel','10^{0}'
%set(ax,'XTick',0.5,'XTickLabel','10^{0}');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Theta=Mu3; Kappa=Mu2; Mu=Mu1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(0,'defaultAxesFontName', 'arial')
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ValencePlot_OpeningFcn, ...
                   'gui_OutputFcn',  @ValencePlot_OutputFcn, ...
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


% --- Executes just before ValencePlot is made visible.
function ValencePlot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ValencePlot (see VARARGIN)

% Choose default command line output for ValencePlot
handles.output = hObject;
movegui(handles.figure1,'onscreen')     % move GUI to right
defaultdirectory = 'C:\Users\admin\Documents\MATLAB\mltools4\XASdatabases';
set(handles.edit_defaultDir, 'string', defaultdirectory)
handles.defaultdirectory = defaultdirectory;
%cd(defaultdirectory)
% Deactivate the option of setting a password protection when the Valence
% Plot is linked to the AutoXas
% vv = password;
% 
% if isequal(vv, 0)
%     uiwait(msgbox('Password input canceled by user:    contact Sirine Fakra','modal'));
%     guidata(hObject, handles);
%     close(handles.figure1)
%     return
% end
% -------------------------------------------------------------------

%handles.ax = [0.8, 4, 0.5, 3.8]; % provisory intial value for the axis plot (Values of Se)
                                  % will be changed if a different element
                                  % is selected  
                                  
%handles.ax = [0.025, 1, 0.01, 1];

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes ValencePlot wait for user response (see UIRESUME)
%uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ValencePlot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = []; %handles.output;



% --- Executes on button press in pb_newDataFiles.
function pb_newDataFiles_Callback(hObject, eventdata, handles)
% hObject    handle to pb_newDataFiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Upload all data files in the folder. Here just select one file and the routine will open all data in the folder. 
current = cd;

set(handles.edit_fname, 'String', '  ')
set(handles.edit_nbreoffiles, 'String', ' ')

if isfield(handles, 'pathname') && ~isequal(handles.pathname, 0)
    cd(handles.pathname)
elseif isfield(handles, 'lastdirectory')
    cd(handles.lastdirectory)
else
    cd(handles.defaultdirectory)
end

[filename, pathname] = uigetfile({'*.e', 'All Files (*.e)'}, 'Pick a file');
%pathname;
cd(current)
    if isequal(pathname,0) 
        set(handles.edit_fname, 'String', 'invalid name')
        msgbox('Cancelled - No file selected')
        return
    end
 
 lastdirectory = pathname;
 
extension = filename(find(filename=='.')+1);
if extension == 'e'
    files =readfile(eval(['''',pathname,'*.e','''']));
else % This is a 'txt' file
     fid = fopen([pathname, filename]);
     if fid == -1
        msgbox('The file cannot be opened')
        return
     else
        line = fgetl(fid); % [energy, intensity]
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
     end
     fclose(fid)
     files.source = [pathname, filename];
     files.lambda=M(:,1)*1000;
     files.adu=M(:,2);
end
     
 % Set directory name & directory number of files
 ind = find(lastdirectory == '\');
 set(handles.edit_fname, 'String', lastdirectory(ind(size(ind,2)-1)+1:ind(size(ind,2))-1))   
 set(handles.edit_nbreoffiles, 'String', num2str(size(files,2)))
 
 handles.pathname = pathname;
 handles.filename = filename;
 handles.lastdirectory = lastdirectory;
 handles.files = files;
 
 % Name of directory
 %find(isequal(files.source, '\'))
 
 guidata(hObject, handles);


function edit_fname_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fname as text
%        str2double(get(hObject,'String')) returns contents of edit_fname as a double


% --- Executes during object creation, after setting all properties.
function edit_fname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_nbreoffiles_Callback(hObject, eventdata, handles)
% hObject    handle to edit_nbreoffiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_nbreoffiles as text
%        str2double(get(hObject,'String')) returns contents of edit_nbreoffiles as a double


% --- Executes during object creation, after setting all properties.
function edit_nbreoffiles_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_nbreoffiles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbPlot.
function pbPlot_Callback(hObject, eventdata, handles)
% hObject    handle to pbPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Scheme color of the plot
    %Shape
    Shape = {'h', 'o', 's'};
    shape_selected = [get(handles.rb_hex, 'Value'), get(handles.rb_circle, 'Value'), get(handles.rb_square, 'Value')];
    Shape = Shape(find(shape_selected == 1));
    
    %color [red, blue, black, cyan, green, magenta, orange]
    c = {'r', 'b', 'k', 'c', 'g', 'm',[0.9100 0.4100 0.1700]};
    c_selected = [get(handles.rb_red, 'value'), get(handles.rb_blue, 'value'), ...
        get(handles.rb_black, 'value'), get(handles.rb_cyan, 'value'), ...
        get(handles.rb_green, 'value'), get(handles.rb_magenta, 'value'),... 
        get(handles.rb_orange, 'value')];
    c = c(find(c_selected == 1));
    
    %solid or empty
    fill = {'solid', 'w'};
    fill_selected = [get(handles.rb_solid, 'Value'), get(handles.rb_empty, 'Value')];
    if fill_selected(2) == 1
        fill = 'w';
    else 
        fill = c;
    end

           
    %ax = handles.ax;
    ax1 = get(handles.edit_Xmin, 'value');
    ax2 = get(handles.edit_Xmax, 'value');
    ax3 = get(handles.edit_Ymin, 'value');
    ax4 = get(handles.edit_Ymax, 'value');
    ax = [ax1, ax2, ax3, ax4];
        
    %size
    fs = get(handles.edit_plotSize, 'value');

    %find if a figure is active
    a = findobj('type','figure','name','Valence Plot');
    if isempty(a)
        Val_Plot = figure('name', 'Valence Plot', 'NumberTitle', 'off');
        set(gca,'fontname','Arial');
        set(gca,'fontsize',14);
        set(gca,'Position',[0.13 0.145 0.775 0.8111]);
        set(gcf,'color', 'white');
                               
    else
        Val_Plot = handles.Val_Plot;
        
    end
    
    % Data files of the current folder
    files = handles.files;
    
    % Initialize table to store previous data files (upload previous saved
    % files
    if isfield(handles, 'Table')
        Table = handles.Table;
        Values = handles.Values; 
        Symbol= handles.Symbol;
        SymbolC = handles.SymbolC;
        SymbolFill= handles.SymbolFill;
        SymbolFS = handles.SymbolFS;
    else
        Table ={};
        Values= [];
        Symbol = {};
        SymbolC={};
        SymbolFill = {};
        SymbolFS = [];
    end

    %Read the Wavelength values input in the input boxes
     thetap = get(handles.edit_Theta, 'value');      %I_7110
     theta = [];

     kappap =get(handles.edit_Kappa, 'value');       %I_7113
     kappa = [];

     mup = get(handles.edit_mu, 'value');            %I_7117.5
     mu = [];
     
figure(Val_Plot)
     
for k=1:size(files,2) 
     %ind_theta = max(find(files(k).lambda < thetap));
     ind_theta = find(files(k).lambda < thetap, 1,  'last');
     xinter = thetap - files(k).lambda(ind_theta); % this number must be >0
     slope = (files(k).adu(ind_theta+1)-files(k).adu(ind_theta)) / (files(k).lambda(ind_theta+1)-files(k).lambda(ind_theta));
     yinter = slope *xinter+ files(k).adu(ind_theta);
     theta = [theta; yinter];
     
     %ind_kappa = max(find(files(k).lambda < kappap));
     ind_kappa = find(files(k).lambda < kappap, 1, 'last');
     xinter = kappap - files(k).lambda(ind_kappa); % this number must be >0
     slope = (files(k).adu(ind_kappa+1)-files(k).adu(ind_kappa)) / (files(k).lambda(ind_kappa+1)-files(k).lambda(ind_kappa));
     yinter = slope *xinter + files(k).adu(ind_kappa);
     kappa = [kappa; yinter];
     
     %ind_mu = max(find(files(k).lambda < mup));
     ind_mu = find(files(k).lambda < mup, 1, 'last');
     xinter = mup - files(k).lambda(ind_mu); % this number must be >0
     slope = (files(k).adu(ind_mu+1)-files(k).adu(ind_mu)) / (files(k).lambda(ind_mu+1)-files(k).lambda(ind_mu));
     yinter = slope *xinter + files(k).adu(ind_mu);
     mu = [mu; yinter];
    
     if iscell(c) && ischar(c{:})
        loglog(mu(k), kappa(k), char(Shape), 'MarkerEdgeColor',char(c),'MarkerFaceColor',char(fill),'MarkerSize',fs); hold on
     elseif ischar(fill) % select orange empty symbol
         loglog(mu(k), kappa(k), char(Shape), 'MarkerEdgeColor',c{:},'MarkerFaceColor',char(fill),'MarkerSize',fs); hold on
     else % select orange fill symbol
         loglog(mu(k), kappa(k), char(Shape), 'MarkerEdgeColor',c{:},'MarkerFaceColor',fill{:},'MarkerSize',fs); hold on
     end
         
 
    Name = files(k).source;
    namefile{k} = Name((max(find(Name == '\'))+1): (find(Name == '.')-1));
    S{k}= Shape;
    C{k} = c;
    Fill{k} = fill;
    FS(k) = fs;
end

if get(handles.checkbox_autoaxis, 'value') == 1
    axis('auto')
else
    axis(ax)
    if strcmp(get(handles.edit_ElementSelected,'string'),'Fe')
        % add here the areas limits for Fe
        
% Create line Fe
annotation(Val_Plot,'line',[0.7554 0.7804],[0.7776 0.7357]); %

% Create line Fe
annotation(Val_Plot,'line',[0.725 0.7071],[0.5704 0.5929]);

% Create line Fe
annotation(Val_Plot,'line',[0.4857 0.6607],[0.3857 0.4167]);

% Create line Fe
annotation(Val_Plot,'line',[0.3911 0.4118],[0.5357 0.4327]);

% Create line Fe
annotation(Val_Plot,'line',[0.7270 0.8214],[0.6438 0.6548]);

% Create line Fe
annotation(Val_Plot,'line',[0.4786 0.4375],[0.3905 0.4143]);

% Create line Fe
annotation(Val_Plot,'line',[0.3054 0.3876],[0.6286 0.5388]);

% Create line Fe
annotation(Val_Plot,'line',[0.2107 0.2875],[0.4119 0.6262]);

% Create line Fe
annotation(Val_Plot,'line',[0.7625 0.7239],[0.569 0.5687]);%

% Create line Fe
annotation(Val_Plot,'line',[0.7196 0.7464],[0.7571 0.7786]); %

% Create line Fe
annotation(Val_Plot,'line',[0.6821,0.7179],[0.7262,0.7571]);

% Create line Fe
annotation(Val_Plot,'line',[0.7059 0.7285],[0.5995 0.6432]);

% Create line Fe
annotation(Val_Plot,'line',[0.4107 0.2607],[0.4214 0.3833]);

% Create line Fe
annotation(Val_Plot,'line',[0.7089 0.6857],[0.6929 0.719]); % New

% Create line Fe
annotation(Val_Plot,'line',[0.7803 0.705],[0.7119 0.6929]); %

% Create line Fe
annotation(Val_Plot,'line',[0.7804 0.7821],[0.7347 0.7143]);%


% Create line Fe
annotation(Val_Plot,'line',[0.6839 0.6836],[0.5524 0.4619]);

% Create line Fe
annotation(Val_Plot,'line',[0.4964 0.4393],[0.5595 0.4333]);

% Create line Fe
annotation(Val_Plot,'line',[0.6078 0.6804],[0.6635 0.5595]);

% Create line Fe
annotation(Val_Plot,'line',[0.6589 0.6857],[0.4167 0.4524]);

% Create line Fe
annotation(Val_Plot,'line',[0.6018 0.4964],[0.6643 0.5619]);

% Create line Fe
annotation(Val_Plot,'line',[0.7893 0.7625],[0.581 0.569]);

% Create line Fe
annotation(Val_Plot,'line',[0.825 0.7911],[0.6452 0.5857]);

% Create line Fe
annotation(Val_Plot,'line',[0.2553 0.2107],[0.3833 0.3904]);

% Create textbox Fe
annotation(Val_Plot,'textbox','String',{'Fe(0)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.707 0.792 0.116 0.072]);

% Create textbox Fe
annotation(Val_Plot,'textbox','String',{'Sulfides'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.75 0.491 0.151 0.072]);

% Create textbox Fe
annotation(Val_Plot,'textbox','String',{'Fe(III)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.242 0.662 0.127 0.072]);

% Create textbox Fe
annotation(Val_Plot,'textbox','String',{'Fe(II)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.494 0.658 0.118 0.072]);

     end
    
     if strcmp(get(handles.edit_ElementSelected,'string'),'Se')
        % add here the areas limits for Se
        
% Create line Se
annotation(Val_Plot,'line',[0.2996 0.3429],[0.434 0.4381]);

% Create line Se
annotation(Val_Plot,'line',[0.2474 0.2474],[0.3738 0.3483]);

% Create line Se
annotation(Val_Plot,'line',[0.6531 0.5596],[0.6458 0.5245]);

% Create line Se
annotation(Val_Plot,'line',[0.2926 0.2984],[0.3855 0.3585]);

% Create line Se
annotation(Val_Plot,'line',[0.2383 0.2996],[0.4853 0.434]);

% Create line Se
annotation(Val_Plot,'line',[0.3941 0.3288],[0.6765 0.6758]);

% Create line Se
annotation(Val_Plot,'line',[0.2489 0.2775],[0.3444 0.3425]);

% Create line Se
annotation(Val_Plot,'line',[0.2896 0.2474],[0.3867 0.3738]);

% Create line Se
annotation(Val_Plot,'line',[0.365 0.3861],[0.8789 0.873]);

% Create line Se
annotation(Val_Plot,'line',[0.5581 0.5279],[0.5245 0.4609]);

% Create line Se
annotation(Val_Plot,'line',[0.2821 0.2956],[0.3425 0.3496]);

% Create line Se
annotation(Val_Plot,'line',[0.6576 0.7074],[0.6458 0.6328]);

% Create line Se
annotation(Val_Plot,'line',[0.7089 0.8477],[0.6309 0.4512]);

% Create line Se
annotation(Val_Plot,'line',[0.5294 0.7903],[0.4531 0.2852]);

% Create line Se
annotation(Val_Plot,'line',[0.2786 0.2768],[0.7286 0.8071]);

% Create line Se
annotation(Val_Plot,'line',[0.3258 0.2786],[0.6777 0.7214]);

% Create line Se
annotation(Val_Plot,'line',[0.4536 0.3964],[0.7833 0.6762]);

% Create line Se
annotation(Val_Plot,'line',[0.7982 0.8482],[0.2833 0.4405]);

% Create line Se
annotation(Val_Plot,'line',[0.3893 0.4536],[0.8714 0.7905]);

% Create line Se
annotation(Val_Plot,'line',[0.325 0.3732],[0.5476 0.5333]);

% Create line Se
annotation(Val_Plot,'line',[0.3732 0.3679],[0.5300 0.5071]);

% Create line Se
annotation(Val_Plot,'line',[0.3185 0.2375],[0.5499 0.4952]);

% Create line Se
annotation(Val_Plot,'line',[0.276 0.3607],[0.8184 0.8762]);

% Create line Se
annotation(Val_Plot,'line',[0.3441 0.3696],[0.4394 0.5071]);

% Create textbox Se
annotation(Val_Plot,'textbox','String',{'Se(0)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.3071 0.3395 0.1036 0.0643]);

% Create textbox Se
annotation(Val_Plot,'textbox','String',{'Se(IV)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.3053 0.8776 0.1036 0.0743]);

% Create textbox Se
annotation(Val_Plot,'textbox','String',{'Se(VI)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.6107 0.6443 0.1036 0.0843]);

% Create textbox Se
annotation(Val_Plot,'textbox','String',{'Se(-II,II)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.2625 0.5348 0.1036 0.0943]);

     end
     
     if strcmp(get(handles.edit_ElementSelected,'string'),'As')
        % add here the areas limits for As
        
  % Create line As
annotation(Val_Plot,'line',[0.5429 0.3946],[0.8657 0.7619]);

% Create line As
annotation(Val_Plot,'line',[0.3875 0.3982],[0.6643 0.6548]);

% Create line As
annotation(Val_Plot,'line',[0.40357 0.4554],[0.6524 0.6500]);

% Create line As
annotation(Val_Plot,'line',[0.5518 0.55714],[0.8633 0.7429]);

% Create line As
annotation(Val_Plot,'line',[0.475 0.5589],[0.6595 0.7286]);

% Create line As
annotation(Val_Plot,'line',[0.3946 0.3893],[0.7585 0.6714]);

% Create line As
annotation(Val_Plot,'line',[0.4589 0.475],[0.65 0.6571]);

% Create line As
annotation(Val_Plot,'line',[0.4732 0.4214],[0.45614 0.3]);

% Create line As
annotation(Val_Plot,'line',[0.6304 0.5179],[0.3157 0.2881]);

% Create line As
annotation(Val_Plot,'line',[0.6393 0.6304],[0.3776 0.3143]);

% Create line As
annotation(Val_Plot,'line',[0.5196 0.4768],[0.5119 0.4595]);

% Create line As
annotation(Val_Plot,'line',[0.5214 0.5429],[0.5119 0.5333]);

% Create line As
annotation(Val_Plot,'line',[0.5482 0.5911],[0.5309 0.4810]);

% Create line As
annotation(Val_Plot,'line',[0.5911 0.6161],[0.4786 0.4333]);

% Create line As
annotation(Val_Plot,'line',[0.6161 0.6393],[0.4333 0.3810]);

% Create line As
annotation(Val_Plot,'line',[0.5107 0.425],[0.2857 0.2905]);

% Create textbox As
annotation(Val_Plot,'textbox','String',{'As(III)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.3893 0.8276 0.1375 0.0762]);

% Create textbox As
annotation(Val_Plot,'textbox','String',{'As(IV)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.5804 0.5062 0.1375 0.0762]);

        end

    if strcmp(get(handles.edit_ElementSelected,'string'),'Mn')
        % add here the areas limits for Mn

% Create line Mn
annotation(Val_Plot,'line',[0.7018 0.7179],[0.7942 0.8]);

% Create line Mn
annotation(Val_Plot,'line',[0.7214 0.7714],[0.7976 0.7524]);

% Create line Mn
annotation(Val_Plot,'line',[0.7679 0.8196],[0.599 0.6833]);

% Create line Mn
annotation(Val_Plot,'line',[0.7 0.6911],[0.7929 0.7286]);

% Create line Mn
annotation(Val_Plot,'line',[0.6893 0.7196],[0.7204 0.6595]);

% Create line Mn
annotation(Val_Plot,'line',[0.7179 0.7607],[0.6585 0.5976]);

% Create line Mn
annotation(Val_Plot,'line',[0.7768 0.8196],[0.7476 0.6929]);

% Create line Mn
annotation(Val_Plot,'line',[0.3089 0.3125],[0.5180 0.4405]);

% Create line Mn
annotation(Val_Plot,'line',[0.3054 0.2089],[0.4381 0.4952]);

% Create line Mn
annotation(Val_Plot,'line',[0.2107 0.3054],[0.5024 0.5214]);

% Create line Mn
annotation(Val_Plot,'line',[0.5054 0.525],[0.55 0.4667]);

% Create line Mn
annotation(Val_Plot,'line',[0.4375 0.5161],[0.5609 0.4595]);

% Create line Mn
annotation(Val_Plot,'line',[0.4393 0.5054],[0.5704 0.5524]);

% Create textbox Mn
annotation(Val_Plot,'textbox','String',{'Mn(III)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.5446 0.4942 0.1446 0.0762]);

% Create textbox Mn
annotation(Val_Plot,'textbox','String',{'Mn(IV)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.1786 0.5466 0.1482 0.0762]);

% Create textbox Mn
annotation(Val_Plot,'textbox','String',{'Mn(II)'},'FontSize',12,...
    'FontName','Arial','LineStyle','none',...
    'Position',[0.6411 0.8228 0.1357 0.0762]);
       
     end 
end

 xlabel('\mu1', 'fontsize',14,'FontName','Arial')
 ylabel('\mu2', 'fontsize',14,'FontName','Arial')
 movegui(Val_Plot,'west')
 
 namefile = cat(1, Table, namefile');
 
 % make mu, kappa and theta as column vectors.
 % 
 if size(theta,2) > 1
     theta= theta';
 end
 if size(kappa,2) > 1
     kappa= kappa';
 end
 if size(mu,2) > 1
     mu= mu';
 end
 
 %Values = [Values; theta, kappa, mu];
 theta = zeros(size(kappa));
 Values = [Values; theta, kappa, mu];  % in this version theta is deactivated
 Symbol = cat(1, Symbol, S');
 SymbolFill = cat(1, SymbolFill, Fill');
 SymbolC = cat(1, SymbolC, C');
 SymbolFS = cat(1, SymbolFS, FS');

 handles.Table = namefile;      % Name of the file - allows to concateneate
 handles.Values = Values; %[theta, kappa, mu]; % Values of theta, kappa, mu for the file
 handles.Val_Plot = Val_Plot;
 handles.SizeLastFolder = size(files,2); % used to undo the previous plot
 handles.Symbol = Symbol;
 handles.SymbolC = SymbolC;
 handles.SymbolFill = SymbolFill;
 handles.SymbolFS = SymbolFS;
     
guidata(hObject, handles);
     
     


% --- Executes on button press in rb_hex.
function rb_hex_Callback(hObject, eventdata, handles)
% hObject    handle to rb_hex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_hex, 'value') == 1
    set(handles.rb_circle, 'value', 0)
    set(handles.rb_square, 'value', 0)
end
guidata(hObject, handles);


% --- Executes on button press in rb_square.
function rb_square_Callback(hObject, eventdata, handles)
% hObject    handle to rb_square (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_square, 'value') == 1
    set(handles.rb_circle, 'value', 0)
    set(handles.rb_hex, 'value', 0)
end
guidata(hObject, handles);


% --- Executes on button press in rb_circle.
function rb_circle_Callback(hObject, eventdata, handles)
% hObject    handle to rb_circle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_circle, 'value') == 1
    set(handles.rb_hex, 'value', 0)
    set(handles.rb_square, 'value', 0)
end
guidata(hObject, handles);

% --- Executes on button press in rb_solid.
function rb_solid_Callback(hObject, eventdata, handles)
% hObject    handle to rb_solid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_solid, 'value') == 1
    set(handles.rb_empty, 'value', 0)
end
guidata(hObject, handles);


% --- Executes on button press in rb_empty.
function rb_empty_Callback(hObject, eventdata, handles)
% hObject    handle to rb_empty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_empty, 'value') == 1
    set(handles.rb_solid, 'value', 0)
end
guidata(hObject, handles);


% --- Executes on button press in rb_red.
function rb_red_Callback(hObject, eventdata, handles)
% hObject    handle to rb_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_red, 'value') == 1
    set(handles.rb_blue, 'value', 0)
    set(handles.rb_black, 'value', 0)
    set(handles.rb_green, 'value', 0)
    set(handles.rb_cyan, 'value', 0)
    set(handles.rb_magenta, 'value', 0)
    set(handles.rb_orange, 'value', 0)    
end
guidata(hObject, handles);


% --- Executes on button press in rb_blue.
function rb_blue_Callback(hObject, eventdata, handles)
% hObject    handle to rb_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_blue, 'value') == 1
    set(handles.rb_red, 'value', 0)
    set(handles.rb_black, 'value', 0)
    set(handles.rb_green, 'value', 0)
    set(handles.rb_cyan, 'value', 0)
    set(handles.rb_magenta, 'value', 0)
    set(handles.rb_orange, 'value', 0)
end
guidata(hObject, handles);


% --- Executes on button press in rb_black.
function rb_black_Callback(hObject, eventdata, handles)
% hObject    handle to rb_black (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_black, 'value') == 1
    set(handles.rb_blue, 'value', 0)
    set(handles.rb_red, 'value', 0)
    set(handles.rb_green, 'value', 0)
    set(handles.rb_cyan, 'value', 0)
    set(handles.rb_magenta, 'value', 0)
    set(handles.rb_orange, 'value', 0)
end
guidata(hObject, handles);


% --- Executes on button press in rb_green.
function rb_green_Callback(hObject, eventdata, handles)
% hObject    handle to rb_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_green, 'value') == 1
    set(handles.rb_blue, 'value', 0)
    set(handles.rb_black, 'value', 0)
    set(handles.rb_red, 'value', 0)
    set(handles.rb_cyan, 'value', 0)
    set(handles.rb_magenta, 'value', 0)
    set(handles.rb_orange, 'value', 0)
end
guidata(hObject, handles);


% --- Executes on button press in rb_cyan.
function rb_cyan_Callback(hObject, eventdata, handles)
% hObject    handle to rb_cyan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_cyan, 'value') == 1
    set(handles.rb_blue, 'value', 0)
    set(handles.rb_black, 'value', 0)
    set(handles.rb_green, 'value', 0)
    set(handles.rb_red, 'value', 0)
    set(handles.rb_magenta, 'value', 0)
    set(handles.rb_orange, 'value', 0)
end
guidata(hObject, handles);

% --- Executes on button press in rb_magenta.
function rb_magenta_Callback(hObject, eventdata, handles)
% hObject    handle to rb_magenta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_magenta, 'value') == 1
    set(handles.rb_blue, 'value', 0)
    set(handles.rb_black, 'value', 0)
    set(handles.rb_green, 'value', 0)
    set(handles.rb_red, 'value', 0)
    set(handles.rb_cyan, 'value', 0)
    set(handles.rb_orange, 'value', 0)
end
guidata(hObject, handles);



% --- Executes on button press in rb_orange.
function rb_orange_Callback(hObject, eventdata, handles)
% hObject    handle to rb_orange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.rb_orange, 'value') == 1
    set(handles.rb_blue, 'value', 0)
    set(handles.rb_black, 'value', 0)
    set(handles.rb_green, 'value', 0)
    set(handles.rb_red, 'value', 0)
    set(handles.rb_magenta, 'value', 0)
    set(handles.rb_cyan, 'value', 0)
end
guidata(hObject, handles);

function edit_Theta_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit = str2double(get(hObject,'String'));
set(hObject,'value',edit);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit_Theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Kappa_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Kappa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit = str2double(get(hObject,'String'));
set(hObject,'value',edit);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_Kappa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Kappa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_mu_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

edit = str2double(get(hObject,'String'));
set(hObject,'value',edit);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_mu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_plotSize_Callback(hObject, eventdata, handles)
% hObject    handle to edit_plotSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

edit = str2double(get(hObject,'String'));
set(hObject,'value',edit);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_plotSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_plotSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbClose.
function pbClose_Callback(hObject, eventdata, handles)
% hObject    handle to pbClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles);
close(handles.figure1)


% --- Executes on button press in pb_undo.
function pb_undo_Callback(hObject, eventdata, handles)
% hObject    handle to pb_undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
       
Table = handles.Table;
Values = handles.Values;
SizeLastFolder = handles.SizeLastFolder;
Shape = handles.Symbol;
fill = handles.SymbolFill;
c = handles.SymbolC;
fs = handles.SymbolFS;

%Remove the last N lines of the Table, N = SizeLastFolder;
L = size(Table,1);
Table = Table(1:L-SizeLastFolder, 1);
Values = Values(1:L-SizeLastFolder,:);
mu = Values(:,3);
kappa = Values(:,2);

Shape = Shape(1:L-SizeLastFolder, 1);
fill = fill(1:L-SizeLastFolder, 1);
c = c(1:L-SizeLastFolder, 1);
fs = fs(1:L-SizeLastFolder, 1);

%find the active figure, find the axis value, then close it and recreate an idential one without
%the last data

%ax = handles.ax;
if findobj('type','figure','name','Valence Plot')==1
    figure(handles.Val_Plot)
    ax= axis;
else
    msgbox('ERROR: figure does not exist')
    return
end
    
close(findobj('type','figure','name','Valence Plot'))
Val_Plot = figure('name', 'Valence Plot', 'NumberTitle', 'off');
set(gca,'fontsize',14, 'FontName','arial')
set(gca,'Position',[0.13 0.145 0.775 0.8111])
set(gcf,'color', 'white')

% Replot the figure with the original symbol font & size    
figure(Val_Plot)

for k = 1: L-SizeLastFolder
    loglog(mu(k), kappa(k), char(Shape{k}), 'MarkerEdgeColor',char(c{k}),'MarkerFaceColor',char(fill{k}),'MarkerSize',fs(k)); hold on
end
 
if get(handles.checkbox_autoaxis, 'value') == 1
    axis('auto')
else
    axis(ax)   
end

xlabel('\mu1', 'fontsize',14, 'fontname', 'arial')
ylabel('\mu2', 'fontsize',14, 'fontname', 'arial')
movegui(Val_Plot,'west')

handles.Table = Table;      % Name of the file - allows to concateneate
handles.Values = Values; %[theta, kappa, mu]; % Values of theta, kappa, mu for the file
handles.Val_Plot = Val_Plot;
    
guidata(hObject, handles);
    

% --- Executes on button press in pb_SelectElement.
function pb_SelectElement_Callback(hObject, eventdata, handles)
% hObject    handle to pb_SelectElement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(findobj('type','figure','name','Select an Element'))
fig_element = figure('name', 'Select an Element', 'unit', 'normalized', 'position', [0.25, 0.25 0.5 0.5],'color','white', 'NumberTitle', 'off');
axis off
%movegui(fig_element,'west') 

txt_title = uicontrol('style','text','units','normalized','position', [0.3, 0.9, 0.4, 0.1], ...
        'BackgroundColor', 'y', 'fontsize',22, 'fontweight', 'bold', 'HorizontalAlignment', 'center', 'string', 'Select an Element' );

pb_Fe = ...
        uicontrol('style','pushbutton','units','normalized','position', [0.2, 0.7, 0.08 0.08], ...
        'BackgroundColor', [255, 204, 255]/255, 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', ...
        'string', 'Fe', 'callback', {@pb_FeValues_Callback, handles});   
    
pb_Mn = ...
        uicontrol('style','pushbutton','units','normalized','position', [0.7, 0.7, 0.08 0.08], ...
        'BackgroundColor', [229, 204, 255]/255, 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', ...
        'string', 'Mn','callback', {@pb_MnValues_Callback, handles},'visible','off'); 
    
pb_V = ...
        uicontrol('style','pushbutton','units','normalized','position', [0.7, 0.25, 0.08 0.08], ...
        'BackgroundColor', [255, 255, 204]/255, 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', ...
        'string', 'V', 'callback', {@pb_XValues_Callback, handles},'visible','off'); 
    
pb_Cu = ...
        uicontrol('style','pushbutton','units','normalized','position', [0.2, 0.25, 0.08 0.08], ...
        'BackgroundColor', [255, 153, 51]/255, 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', ...
        'string', 'Cu','callback', {@pb_XValues_Callback, handles},'visible','off'); 
    
    %-----
pb_Se = ...
        uicontrol('style','pushbutton','units','normalized','position', [0.2, 0.4, 0.08 0.08], ...
        'BackgroundColor', [255, 102, 102]/255, 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', ...
        'string', 'Se', 'callback', {@pb_SeValues_Callback, handles});
         
pb_Pt = ...
        uicontrol('style','pushbutton','units','normalized','position', [0.7, 0.55, 0.08 0.08], ...
        'BackgroundColor', [204, 204, 0]/255, 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', ...
        'string', 'Pt', 'callback', {@pb_XValues_Callback, handles},'visible','off'); 
    
pb_Cr = ...
        uicontrol('style','pushbutton','units','normalized','position', [0.7, 0.4, 0.08 0.08], ...
        'BackgroundColor', [128, 128, 128]/255, 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', ...
        'string', 'Cr', 'callback', {@pb_XValues_Callback, handles},'visible','off'); 
    
pb_As = ...
        uicontrol('style','pushbutton','units','normalized','position', [0.2, 0.55, 0.08 0.08], ...
        'BackgroundColor', [0, 204, 204]/255, 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', ...
        'string', 'As', 'callback', {@pb_AsValues_Callback, handles}); 
    %----

% pb_Fe = ...
%         uicontrol('style','pushbutton','units','normalized','position', [0.2, 0.7, 0.2 0.2], ...
%         'BackgroundColor', 'w', 'fontsize',20,'fontweight', 'bold', 'HorizontalAlignment', 'center', 'string', 'Fe', ...
%         'callback', {@pb_plotSelectedKinetics_Callback, handles}); 
guidata(hObject, handles);


function edit_ElementSelected_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ElementSelected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ElementSelected as text
%        str2double(get(hObject,'String')) returns contents of edit_ElementSelected as a double


% --- Executes during object creation, after setting all properties.
function edit_ElementSelected_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ElementSelected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_defaultDir_Callback(hObject, eventdata, handles)
% hObject    handle to edit_defaultDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_defaultDir as text
%        str2double(get(hObject,'String')) returns contents of edit_defaultDir as a double
handles.defaultdirectory = get(hObject,'String');
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_defaultDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_defaultDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pb_FeValues_Callback(hObject, eventdata, handles)
% hObject    handle to pb_plotSelectedKinetics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Theta = 7110;
Kappa = 7113;
Mu = 7117.5;
ax = [0.025, 1, 0.01, 1];

set(handles.edit_Theta, 'value',Theta);
set(handles.edit_Theta, 'string',num2str(Theta));
set(handles.edit_Kappa, 'value', Kappa);
set(handles.edit_Kappa, 'string',num2str(Kappa));
set(handles.edit_mu, 'value',Mu);
set(handles.edit_mu, 'string',num2str(Mu));
set(handles.edit_ElementSelected, 'string', 'Fe')

set(handles.edit_Xmin, 'value', ax(1))
set(handles.edit_Xmin, 'string', num2str(ax(1)))
set(handles.edit_Xmax, 'value', ax(2))
set(handles.edit_Xmax, 'string', num2str(ax(2)))
set(handles.edit_Ymin, 'value', ax(3))
set(handles.edit_Ymin, 'string', num2str(ax(3)))
set(handles.edit_Ymax, 'value', ax(4))
set(handles.edit_Ymax, 'string', num2str(ax(4)))

%handles.ax = ax;

guidata(hObject, handles);
close(findobj('type','figure','name','Select an Element'))

function pb_MnValues_Callback(hObject, eventdata, handles)
% hObject    handle to pb_plotSelectedKinetics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Theta = 6520;
Kappa = 6545;
Mu = 6552;
ax = [0.4, 2.2, 0.01, 2];

set(handles.edit_Theta, 'value',Theta);
set(handles.edit_Theta, 'string',num2str(Theta));
set(handles.edit_Kappa, 'value', Kappa);
set(handles.edit_Kappa, 'string',num2str(Kappa));
set(handles.edit_mu, 'value',Mu);
set(handles.edit_mu, 'string',num2str(Mu));
set(handles.edit_ElementSelected, 'string', 'Mn')

set(handles.edit_Xmin, 'value', ax(1))
set(handles.edit_Xmin, 'string', num2str(ax(1)))
set(handles.edit_Xmax, 'value', ax(2))
set(handles.edit_Xmax, 'string', num2str(ax(2)))
set(handles.edit_Ymin, 'value', ax(3))
set(handles.edit_Ymin, 'string', num2str(ax(3)))
set(handles.edit_Ymax, 'value', ax(4))
set(handles.edit_Ymax, 'string', num2str(ax(4)))

%handles.ax = ax;
guidata(hObject, handles);
close(findobj('type','figure','name','Select an Element'))


function pb_SeValues_Callback(hObject, eventdata, handles)
% hObject    handle to pb_plotSelectedKinetics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('not active');
return
Theta = 12660;
Kappa = 12664.25;
Mu = 12667.8;
ax = [0.8, 4, 0.5, 3.8];

set(handles.edit_Theta, 'value',Theta);
set(handles.edit_Theta, 'string',num2str(Theta));
set(handles.edit_Kappa, 'value', Kappa);
set(handles.edit_Kappa, 'string',num2str(Kappa));
set(handles.edit_mu, 'value',Mu);
set(handles.edit_mu, 'string',num2str(Mu));
set(handles.edit_ElementSelected, 'string', 'Se')

set(handles.edit_Xmin, 'value', ax(1))
set(handles.edit_Xmin, 'string', num2str(ax(1)))
set(handles.edit_Xmax, 'value', ax(2))
set(handles.edit_Xmax, 'string', num2str(ax(2)))
set(handles.edit_Ymin, 'value', ax(3))
set(handles.edit_Ymin, 'string', num2str(ax(3)))
set(handles.edit_Ymax, 'value', ax(4))
set(handles.edit_Ymax, 'string', num2str(ax(4)))

%handles.ax = ax;
guidata(hObject, handles);
close(findobj('type','figure','name','Select an Element'))

function pb_AsValues_Callback(hObject, eventdata, handles)
% hObject    handle to pb_plotSelectedKinetics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('not active');
return
Theta = 11850;
Kappa = 11870.8;
Mu = 11889.9;
ax = [0.7, 2, 0.2, 6];

set(handles.edit_Theta, 'value',Theta);
set(handles.edit_Theta, 'string',num2str(Theta));
set(handles.edit_Kappa, 'value', Kappa);
set(handles.edit_Kappa, 'string',num2str(Kappa));
set(handles.edit_mu, 'value',Mu);
set(handles.edit_mu, 'string',num2str(Mu));
set(handles.edit_ElementSelected, 'string', 'As')

set(handles.edit_Xmin, 'value', ax(1))
set(handles.edit_Xmin, 'string', num2str(ax(1)))
set(handles.edit_Xmax, 'value', ax(2))
set(handles.edit_Xmax, 'string', num2str(ax(2)))
set(handles.edit_Ymin, 'value', ax(3))
set(handles.edit_Ymin, 'string', num2str(ax(3)))
set(handles.edit_Ymax, 'value', ax(4))
set(handles.edit_Ymax, 'string', num2str(ax(4)))

%handles.ax = ax;
guidata(hObject, handles);
close(findobj('type','figure','name','Select an Element'))


function pb_XValues_Callback(hObject, eventdata, handles)
% hObject    handle to pb_plotSelectedKinetics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('Values not available yet; parameters have not changed')
close(findobj('type','figure','name','Select an Element'))

set(handles.edit_Theta, 'value',0);
set(handles.edit_Theta, 'string','');
set(handles.edit_Kappa, 'value', 0);
set(handles.edit_Kappa, 'string','');
set(handles.edit_mu, 'value',0);
set(handles.edit_mu, 'string','');

set(handles.edit_Xmin, 'value', 0)
set(handles.edit_Xmin, 'string', '')
set(handles.edit_Xmax, 'value', 0)
set(handles.edit_Xmax, 'string', '')
set(handles.edit_Ymin, 'value', 0)
set(handles.edit_Ymin, 'string', '')
set(handles.edit_Ymax, 'value', 0)
set(handles.edit_Ymax, 'string', '')
set(handles.edit_ElementSelected, 'string', '')
return


% --- Executes on button press in checkbox_autoaxis.
function checkbox_autoaxis_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_autoaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_autoaxis

    

function [vv] = password()
vv=1;
%X = inputdlg('PLEASE ENTER THE PASSWORD TO PROCEED');
X = passcode; % this is a string
if isempty(X) % user canceled
    vv=0;
    return
end
X = {X};
x = X{1,1}; %str2double(X{1,1});

MyPassword = 'xray$1032';                   % SET IT HERE MANUALLY - must be inbetween ' ......  '

if isnumeric(MyPassword)
    MyPassword = num2str(MyPassword);
end

password = MyPassword;             
if strcmp(x, password)
    uiwait(msgbox('Welcome! Click ok to proceed'));
else 
while ~ strcmp(x, MyPassword)
    if strcmp(x, password)
       uiwait(msgbox('Welcome! Click ok to proceed'));
       break;
    else
        uiwait(errordlg('Incorrect Password, try again!'));
        X = inputdlg('PLEASE ENTER THE PASSWORD TO PROCEED');
        X = passcode; % this is a string
        if isempty(X) % user canceled
            vv=0;
            return
        end
        X = {X};
        x =  X{1,1}; %str2double(X{1,1});
    end 
end
uiwait(msgbox('Welcome! Click ok to proceed'));

end

function pass = passcode(charset);
%PASSCODE  password input dialog box.
%  passcode creates a modal dialog box that returns user password input.
%  Given characters are substituted with '*'-Signs like in usual Windows dialogs.
%  
%  usage:
%  answer = PASSCODE 
%     without input parameter allows to type any ASCII-Character
%  answer = PASSCODE('digit') 
%     allows only digits as input characters [0-9]
%  answer = PASSCODE('letter')
%     allows only letters as input characters [a-z_A-Z]
%  answer = PASSCODE(<string>)
%     allows to use characters from the specified string only
%     
%  See also PCODE.

% Version: v1.2 (03-Mar-2008)
% Author:  Elmar Tarajan [MCommander@gmx.de]

if nargin==0
   charset = default;
else
   if any(strcmp({'letter' 'digit'},charset))
      charset = eval(charset);
   elseif ~isa(charset,'char')
      error('string expected. Check input parameters.')
   end% if
end% if
%
ScreenSize = get(0,'ScreenSize');
hfig = figure('Menubar','none', ...
   'Units','Pixels', ...
   'Resize','off', ...
   'NumberTitle','off', ...
   'Name',['password required'], ...
   'Position',[ (ScreenSize(3:4)-[300 75])/2 300 75], ...
   'Color',[0.8 0.8 0.8], ...
   'WindowStyle','modal');
hedit = uicontrol('Parent',hfig, ...
   'Style','Edit', ...
   'Enable','inactive', ...
   'Units','Pixels','Position',[49 28 202 22], ...
   'FontSize',15, ...
   'String',[], ...   
   'BackGroundColor',[0.7 0.7 0.7]);
hpass = uicontrol('Parent',hfig, ...
   'Style','Text', ...
   'Tag','password', ...
   'Units','Pixels','Position',[51 30 198 18], ...
   'FontSize',15, ...
   'BackGroundColor',[1 1 1]);
hwarn = uicontrol('Parent',hfig, ...
   'Style','Text', ...
   'Tag','error', ...
   'Units','Pixels','Position',[50 2 200 20], ...
   'FontSize',8, ...
   'String','character not allowed',...
   'Visible','off',...
   'ForeGroundColor',[1 0 0], ...
   'BackGroundColor',[0.8 0.8 0.8]);
%
set(hfig,'KeyPressFcn',{@keypress_Callback,hedit,hpass,hwarn,charset}, ...
         'CloseRequestFcn','uiresume')
%
uiwait
pass = get(hpass,'userdata');
delete(hfig)
  %
  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function keypress_Callback(hObj,data,hedit,hpass,hwarn,charset)
%--------------------------------------------------------------------------
pass = get(hpass,'userdata');
%
switch data.Key
   case 'backspace'
      pass = pass(1:end-1);
      %
   case 'return'
      uiresume
      return
      %
   otherwise
      try
         if any(charset == data.Character)
            pass = [pass data.Character];
         else
            set(hwarn,'Visible','on')
            pause(0.5)
            set(hwarn,'Visible','off')
         end% if
      end% try
      %
end% switch
%
set(hpass,'userdata',pass)
set(hpass,'String',char('*'*sign(pass)))
  %
  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function charset = default
%--------------------------------------------------------------------------
% charset = [letter digit '<>[]{}()@!?*#=~-+_.,;:$%&/|\'];
charset = char(1:255);
  %
  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function charset = digit
%--------------------------------------------------------------------------
charset = '0123456789';
  %
  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function charset = letter
%--------------------------------------------------------------------------
charset = char([65:90 97:122]);
  %
  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% I LOVE MATLAB %%%



function edit_Xmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Xmin as text
%        str2double(get(hObject,'String')) returns contents of edit_Xmin as a double


% --- Executes during object creation, after setting all properties.
function edit_Xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Xmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Xmax as text
%        str2double(get(hObject,'String')) returns contents of edit_Xmax as a double


% --- Executes during object creation, after setting all properties.
function edit_Xmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Ymin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ymin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ymin as text
%        str2double(get(hObject,'String')) returns contents of edit_Ymin as a double


% --- Executes during object creation, after setting all properties.
function edit_Ymin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ymin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Ymax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Ymax as text
%        str2double(get(hObject,'String')) returns contents of edit_Ymax as a double


% --- Executes during object creation, after setting all properties.
function edit_Ymax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    
end
