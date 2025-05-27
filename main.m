% tle_struct=TLE_read([pwd,'\gp.tle']);

latitude=30.5288888;
longitude=114.3530555;
altitude=56;
starttime=datetime(2024,1,1,0,0,0,'TimeZone','UTC');
stoptime=datetime(2024,1,2,0,0,0,'TimeZone','UTC');
sampletime=1;

% https://www.mathworks.com/help/releases/R2024b/aerotbx/ug/satelliteScenario-key-concepts.html#mw_e08739b4-c5da-4983-898b-56e18cc71f87

% 创建图窗
sc = satelliteScenario();

% 创建地面站
gs=groundStation(sc,Name='WHU',Latitude=latitude,Longitude=longitude,Altitude=altitude,MinElevationAngle=60);

% 创建和读取卫星，渲染轨道
% satellite(sc,[pwd,'\gp_single.tle'],OrbitPropagator="sgp4")
sat=satellite(sc,[pwd,'\gp.tle'],OrbitPropagator="sgp4");

% 设置卫星的可见性
ac=access(gs,sat);
intvls = accessIntervals(ac);

% % 创建Viewer
% v=satelliteScenarioViewer(sc,Name='Starlink Scenario Viewer',Basemap='Streets',Dimension='3D');
% campos(v,latitude,longitude);
% play(sc);