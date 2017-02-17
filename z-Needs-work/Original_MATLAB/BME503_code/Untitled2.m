function launch_a_bat_file()
%//LAUNCH_A_BAT_FYLE Run a bat file with asynchronous process control

batFile = 'C:\Users\SUNY\Desktop\BME503_Final_Project\Study1\mMR\Input-Converted\Input-LM-00\Run-04-Input-LM-00-PSF-mMR.bat';
startInfo = System.Diagnostics.ProcessStartInfo('cmd.exe', sprintf('/c "%s"', batFile));
% startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;  %// if you want it invisible
proc = System.Diagnostics.Process.Start(startInfo);
if isempty(proc)
    error('Failed to launch process');
end
while true
    if proc.HasExited
        fprintf('\nProcess exited with status %d\n', proc.ExitCode);
        break
    end
    fprintf('.');
    pause(.1);
end

