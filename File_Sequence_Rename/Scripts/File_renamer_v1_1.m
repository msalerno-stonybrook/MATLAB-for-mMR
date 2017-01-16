% %------------------------------------------------------------------------
MFolder=pwd;
copyfile('sort_nat.m',myFolder)
if output_dir_switch == 0
    cd ..
    cd output
    output_path=pwd;
else
    cd (output_dir)
    mkdir('FileRenamer_output');
    cd FileRenamer_output
    output_path = pwd;
end
% %------------------------------------------------------------------------
cd (myFolder)
dirData = dir('*.v');         %# Get the selected file data
fileNames = {dirData.name};     %# Create a cell array of file names
fileNames = sort_nat(fileNames);
for iFile = 1:numel(fileNames)  %# Loop over the file names
  newName = sprintf('output_%04d.v',iFile);  %# Make the new name
  copyfile(fileNames{iFile},newName);        %# Rename the file
  fileNames2{iFile}=newName;
end
for iFile2 = 1:numel(fileNames2) 
    movefile(fileNames2{iFile2},output_path);
end
delete('sort_nat.m');
cd (MFolder)
cd ..
% %------------------------------------------------------------------------
