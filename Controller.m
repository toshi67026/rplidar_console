classdef Controller

    properties (Access = private)
        % pRPLIDAR = CreateRPLIDAR();
        config_file_path = 'config.txt'
    end

    methods

        function obj = Controller(~)
            addpath('Hardware-MATLAB')
            disp('Constructor')
            % hardwarex_init;
        end

        function obj = SwitchConnection(obj, value)

            if strcmp(value, 'On')
                obj = obj.Connect()
            elseif strcmp(value, 'Off')
                obj.Disconnect()
            end

        end

        function obj = Connect(obj)
            disp('Connect')
            % obj.pRPLIDAR = CreateRPLIDAR();
            % [result] = ConnectRPLIDAR(obj.pRPLIDAR, obj.config_file_path)
        end

        function Disconnect(obj)
            disp('Disconnect')
            % [result] = DisconnectRPLIDAR(obj.pRPLIDAR)
            % DestroyRPLIDAR(obj.pRPLIDAR);
        end

        function ScanAndPlot(obj)
            disp('ScanAndPlot')
            % [result, distance, angle, bNewScan, quality] = GetScanDataResponseRPLIDAR(obj.pRPLIDAR);
        end

        function Destructor(~)
            disp('Destructor')
            % unloadlibrary('hardwarex');
        end

    end

end