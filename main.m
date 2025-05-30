%% 定义数值
% tic
disp('begin...')
latitude=30.5288888;
longitude=114.3530555;
altitude=56;
minelevation=60;
starttime=datetime(2025,5,30,14,0,0,'TimeZone',hours(8));
sampletime=60;

%% 
disp('creating satellitescenario object...')
% 创建图窗
sc = satelliteScenario(starttime,starttime+hours(2),sampletime);

%% 
disp('creating groundstation...')
% 创建地面站
gs=groundStation(sc,Name='WHU',Latitude=latitude,Longitude=longitude,Altitude=altitude,MinElevationAngle=minelevation);

%% 
disp('importing satellites...')
% 创建和读取卫星，渲染轨道
% sat=satellite(sc,[pwd,'\gp_single.tle'],OrbitPropagator="sgp4");
% sat=satellite(sc,[pwd,'\gp_half.tle'],OrbitPropagator="sgp4");
% sat=satellite(sc,[pwd,'\sup-gp.tle'],OrbitPropagator="sgp4");


%% 
% 设置卫星的可见性(optional)
disp('computing visibility...')
ac=access(gs,sat);
intvls = accessIntervals(ac);

%% 
disp('getting positions and predicting...')

[position,velocity]=states(sat,CoordinateFrame='ecef');

% 获取地面站 ECEF 坐标
gsLLA = [latitude, longitude, altitude];
gsECEF = lla2ecef(gsLLA);

vecECEF=position-gsECEF';
[xn,ye,zup]=ecef2enu(vecECEF(1,:,:),vecECEF(2,:,:),vecECEF(3,:,:),gsLLA(1),gsLLA(2),gsLLA(3),wgs84Ellipsoid);
[azimuth,elevations]=enu2aer(xn,ye,zup);
azimuth=squeeze(azimuth);
elevations=squeeze(elevations);

%% plot radar figure
disp('plotting radar figure...');


% toc
%% 

% % 创建Viewer
% v=satelliteScenarioViewer(sc,Name='Starlink Scenario Viewer',Basemap='satellite',Dimension='2D');
% campos(v,latitude,longitude);
% play(sc);