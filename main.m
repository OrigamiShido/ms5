% tle_struct=TLE_read([pwd,'\gp.tle']);

% https://www.mathworks.com/help/releases/R2024b/aerotbx/ug/satelliteScenario-key-concepts.html#mw_e08739b4-c5da-4983-898b-56e18cc71f87
sc = satelliteScenario();
groundStation(sc,Name='WHU',Latitude=30.5288888,Longitude=114.3530555,Altitude=56,MinElevationAngle=60);
% satellite(sc,[pwd,'\gp_single.tle'],OrbitPropagator="sgp4")
satellite(sc,[pwd,'\gp.tle'],OrbitPropagator="sgp4");
play(sc);