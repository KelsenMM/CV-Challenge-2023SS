classdef Camera
    %Camera class
    %   此处显示详细说明
    properties
        CAMERA_ID
        MODEL
        WIDTH
        HEIGHT
        PARAMS
    end
    %% 
    methods
        function obj = Camera(CAMERA_ID,MODEL,WIDTH,HEIGHT,varargin)
            %IMREADERCLASS 构造此类的实例
            %   此处显示详细说明
            obj.CAMERA_ID = CAMERA_ID;
            obj.MODEL = MODEL;
            obj.WIDTH = WIDTH;
            obj.HEIGHT = HEIGHT;
            obj.PARAMS = varargin;
        end
        
        function camIntrincMat = intrix(~)
            % Camera Intrinsic Matrix
            %   获取相机内参 (get camera intrinsic matrix)
            if obj.MODEL == "PINHOLE"
                f_x,f_y,c_x,c_y = varargin;
                camIntrincMat = [f_x,0,c_x;0,f_y,c_y;0,0,1];
            end
        end
     
        function [ cp_cell ] = makehat(mat_3xN)

            cp_cell = cell(1, size(mat_3xN,2));
            for i = 1:size(mat_3xN,2)
            vec_hat = zeros(3,3);
            vec_hat(1,2) = -mat_3xN(3, i);
            vec_hat(1,3) = mat_3xN(2, i);
            vec_hat(2,1) = mat_3xN(3, i);
            vec_hat(2,3) = -mat_3xN(1, i);
            vec_hat(3,1) = -mat_3xN(2, i);
            vec_hat(3,2) = mat_3xN(2, i);
            cp_cell{1,i} = vec_hat;
            end
        end
    
    end
end

