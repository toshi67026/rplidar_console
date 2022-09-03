classdef Controller

    properties (Access = private)
        pRPLIDAR = CreateRPLIDAR();

        % edit according to port etc.
        config_file_path = 'config.txt';
    end

    methods

        function obj = Controller(~)
            addpath('Hardware-MATLAB')
            addpath('Hardware-MATLAB/linux_x64')
        end

        function obj = SwitchConnection(obj, value)

            if strcmp(value, 'On')
                obj = obj.Connect();
            elseif strcmp(value, 'Off')
                obj.Disconnect();
            end

        end

        function obj = Connect(obj)
            disp('Connect')
            obj.pRPLIDAR = CreateRPLIDAR();
            [result] = ConnectRPLIDAR(obj.pRPLIDAR, obj.config_file_path);
        end

        function Disconnect(obj)
            disp('Disconnect')
            [result] = DisconnectRPLIDAR(obj.pRPLIDAR);
            DestroyRPLIDAR(obj.pRPLIDAR);
        end

        function [x, y] = Scan(obj)
            disp('Scan')

            % TODO support for multiple measurements
            [result, distance, angle, bNewScan, quality] = GetScanDataResponseRPLIDAR(obj.pRPLIDAR);
            x = distance * cos(angle);
            y = distance * sin(angle);
        end

        function Destructor(~)
            unloadlibrary('hardwarex');
        end

    end

end
