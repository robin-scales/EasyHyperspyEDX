clear; close all; clc;

FOI = "C:\Users\mans3428\OneDrive - Nexus365\DPhil\Data\SEM\EDX\HyperSpy\RJSP5 EDX High Mag 02";

D = string({dir(fullfile(FOI, '*.hspy')).name});

FigAll = figure('Name', 'All');
for i = 1:length(D)
    currName = D(i);
    [~, El, ~] = fileparts(currName);
    figure(FigAll);
    nexttile;
    ax = gca;
    fileloc = fullfile(FOI, currName);
    [data, ax_scales, ax_units, ax_names, ax_sizes, ax_offsets, ax_navigates] = readHyperSpyH5(fileloc);
%     data = wiener2(data,[5 5]);
%     data = medfilt2(data, [5 5]);
    data = imgaussfilt(data,2);
%     data = imresize(data,0.25, "method", "box");

%     data = f_Scalebar(data, 1, 1, [], 1/ax_scales(2), ax_units{1, 2},1);
    imagesc(ax, data);
    colormap(viridis)
    title(ax, El, 'Interpreter','none');
%     str2double(string(xticklabels(ax)))*ax_scales(2)
%     xticklabels(ax, string(round(xticks(ax)*ax_scales(2),1))+ax_units{1, 2})
%     yticklabels(ax, string(round(yticks(ax)*ax_scales(1),1))+ax_units{1, 1})
    set(gca,'XTick',[])
    set(gca,'YTick',[])
    axis image
    colorbar;
% 
%     FigIndiv = figure('Name', 'Indiv');
%     imagesc(data);
%     colorbar;

end