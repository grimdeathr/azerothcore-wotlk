-- DB update 2022_01_03_07 -> 2022_01_03_08
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2022_01_03_07';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2022_01_03_07 2022_01_03_08 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1640873815468810463'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1640873815468810463');

-- Cleanup Southshore Guards "Fix movement, position, and remove overspawns
UPDATE `creature` SET `wander_distance`=2,`MovementType`=1,`position_x`=-696.3634,`position_y`=-428.55398,`position_z`=31.63203 WHERE `guid`=15668;
UPDATE `creature` SET `wander_distance`=2,`MovementType`=1,`position_x`=-678.02656,`position_y`=-427.078430,`position_z`=31.63488 WHERE `guid`=15667;
UPDATE `creature` SET `wander_distance`=2,`MovementType`=1,`position_x`=-777.4129,`position_y`=-576.014648,`position_z`=20.289885 WHERE `guid`=16386;
UPDATE `creature` SET `wander_distance`=2,`MovementType`=1 WHERE `guid` IN (15674,25927,15934,15935,15363,15360,15664,15927);
DELETE FROM `creature` WHERE `guid` IN (15928,16383,2054765,2054762,2054790,16387,16385);
DELETE FROM `creature_addon` WHERE `guid` IN (15668,15928,16383,2054765,2054762,2054790,16387,16385);
DELETE FROM `waypoint_data` WHERE `id` IN (156680,20547620,20547900,163870);

-- Pathing for Southshore Guard Entry: 2386
SET @NPC := 15323;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `wander_distance`=0,`MovementType`=2,`position_x`=-677.44574,`position_y`=-420.20734,`position_z`=66.726234 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-677.44574,-420.20734,66.726234,0,0,0,0,100,0),
(@PATH,2,-680.8098,-422.57272,66.72688,0,0,0,0,100,0),
(@PATH,3,-682.9655,-427.89313,66.72623,0,0,0,0,100,0),
(@PATH,4,-680.9497,-431.63397,66.72623,0,0,0,0,100,0),
(@PATH,5,-676.5903,-434.42737,66.72623,0,0,0,0,100,0),
(@PATH,6,-672.27026,-434.13983,66.72623,0,0,0,0,100,0),
(@PATH,7,-670.167,-432.39224,66.72623,0,0,0,0,100,0),
(@PATH,8,-667.95294,-428.7198,66.72622,0,0,0,0,100,0),
(@PATH,9,-667.6899,-424.55328,66.72623,0,0,0,0,100,0),
(@PATH,10,-672.7508,-420.13138,66.72623,0,0,0,0,100,0);

-- Pathing for Southshore Guard Entry: 2386
SET @NPC := 16402;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `guid`=16402 WHERE `guid`=2054758;
DELETE FROM `creature_addon` WHERE `guid`=2054758;
DELETE FROM `waypoint_data` WHERE `id`=20547580;
UPDATE `creature` SET `wander_distance`=0,`MovementType`=2,`position_x`=-797.35876,`position_y`=-525.4022,`position_z`=17.23382 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-797.35876,-525.4022,17.23382,0,0,0,0,100,0),
(@PATH,2,-808.3094,-528.867,15.457181,0,0,0,0,100,0),
(@PATH,3,-830.24207,-521.8862,12.474027,0,0,0,0,100,0),
(@PATH,4,-843.0829,-527.0458,11.309986,0,0,0,0,100,0),
(@PATH,5,-866.69977,-538.31256,8.527973,0,0,0,0,100,0),
(@PATH,6,-876.2786,-542.11035,7.7533154,0,0,0,0,100,0),
(@PATH,7,-890.73956,-540.6976,6.96938,0,0,0,0,100,0),
(@PATH,8,-876.2786,-542.11035,7.7533154,0,0,0,0,100,0),
(@PATH,9,-866.69977,-538.31256,8.527973,0,0,0,0,100,0),
(@PATH,10,-843.0829,-527.0458,11.309986,0,0,0,0,100,0),
(@PATH,11,-830.24207,-521.8862,12.474027,0,0,0,0,100,0),
(@PATH,12,-808.3094,-528.867,15.457181,0,0,0,0,100,0);

-- Pathing for Southshore Guard Entry: 2386
SET @NPC := 15672;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `wander_distance`=0,`MovementType`=2,`position_x`=-694.8457,`position_y`=-425.3675,`position_z`=31.631714 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-694.8457,-425.3675,31.631714,0,0,0,0,100,0),
(@PATH,2,-695.1766,-431.15323,31.631712,0,0,0,0,100,0),
(@PATH,3,-690.6848,-438.80923,31.585836,0,0,0,0,100,0),
(@PATH,4,-683.91797,-444.35858,31.550913,0,0,0,0,100,0),
(@PATH,5,-673.64777,-446.6058,31.626446,0,0,0,0,100,0),
(@PATH,6,-664.25323,-443.74353,31.552015,0,0,0,0,100,0),
(@PATH,7,-657.4524,-434.33682,31.636646,0,0,0,0,100,0),
(@PATH,8,-656.3378,-424.82318,31.560394,0,0,0,0,100,0),
(@PATH,9,-660.51984,-416.80978,31.543428,0,0,0,0,100,0),
(@PATH,10,-663.72424,-411.80896,31.539776,0,0,0,0,100,0),
(@PATH,11,-671.3255,-408.95346,31.560839,0,0,0,0,100,0),
(@PATH,12,-682.30853,-407.82297,31.601543,0,0,0,0,100,0),
(@PATH,13,-688.34985,-413.33124,31.559906,0,0,0,0,100,0),
(@PATH,14,-692.722,-418.8364,31.616985,0,0,0,0,100,0);

-- Pathing for Farmer Kent Entry: 2436
SET @NPC := 15976;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `wander_distance`=0,`MovementType`=2,`position_x`=-758.9269,`position_y`=-543.15076,`position_z`=18.330992 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-758.9269,-543.15076,18.330992,0,0,0,0,100,0),
(@PATH,2,-758.5872,-533.2114,20.286669,0,0,0,0,100,0),
(@PATH,3,-763.08014,-526.2084,21.717333,0,0,0,0,100,0),
(@PATH,4,-764.835,-526.019,21.637743,0,1000,0,0,100,0),
(@PATH,5,-761.95746,-526.40216,21.529345,0,1000,0,0,100,0),
(@PATH,6,-764.1141,-525.72314,21.709032,0,1000,0,0,100,0),
(@PATH,7,-762.27313,-524.7361,22.007372,0,1000,0,0,100,0),
(@PATH,8,-763.66675,-525.39856,21.786669,0,1000,0,0,100,0),
(@PATH,9,-764.5065,-526.01886,21.637743,0,1000,0,0,100,0),
(@PATH,10,-762.30676,-525.1052,21.807177,0,1000,0,0,100,0),
(@PATH,11,-764.5857,-526.05597,21.628954,0,1000,0,0,100,0),
(@PATH,12,-762.3665,-524.66284,22.007372,0,1000,0,0,100,0),
(@PATH,13,-762.81244,-526.51245,21.644579,0,1000,0,0,100,0),
(@PATH,14,-764.835,-526.019,21.637743,0,1000,0,0,100,0),
(@PATH,15,-760.40295,-535.31934,19.863218,0,0,0,0,100,0),
(@PATH,16,-757.3709,-541.85645,18.629332,0,0,0,0,100,0),
(@PATH,17,-762.82135,-544.6161,18.072447,0,0,0,0,100,0),
(@PATH,18,-779.1243,-541.8245,18.170403,0,0,0,0,100,0),
(@PATH,19,-791.1094,-536.7461,17.295403,0,0,0,0,100,0),
(@PATH,20,-805.01935,-528.7821,16.003567,0,0,0,0,100,0),
(@PATH,21,-816.6068,-523.022,14.257718,0,0,0,0,100,0),
(@PATH,22,-825.93176,-520.5369,12.994046,0,0,0,0,100,0),
(@PATH,23,-836.20197,-504.06592,15.477711,0,0,0,0,100,0),
(@PATH,24,-836.42474,-504.7489,15.427662,0,1000,0,0,100,0),
(@PATH,25,-838.2793,-505.49805,15.059986,0,1000,0,0,100,0),
(@PATH,26,-836.97797,-504.39764,15.469654,0,1000,0,0,100,0),
(@PATH,27,-836.19336,-504.75586,15.426685,0,1000,0,0,100,0),
(@PATH,28,-836.818,-504.26947,15.485035,0,1000,0,0,100,0),
(@PATH,29,-835.46954,-504.21332,15.491871,0,1000,0,0,100,0),
(@PATH,30,-836.627,-504.80176,15.42107,0,1000,0,0,100,0),
(@PATH,31,-835.9921,-504.4359,15.46526,0,1000,0,0,100,0),
(@PATH,32,-836.7956,-504.51245,15.455982,0,1000,0,0,100,0),
(@PATH,33,-836.75586,-503.51172,15.559986,0,1000,0,0,100,0),
(@PATH,34,-835.77734,-504.31384,15.479664,0,1000,0,0,100,0),
(@PATH,35,-838.2359,-504.88293,15.13567,0,1000,0,0,100,0),
(@PATH,36,-836.8183,-503.76382,15.440113,0,1000,0,0,100,0),
(@PATH,37,-836.13763,-504.5862,15.447193,0,1000,0,0,100,0),
(@PATH,38,-837.01245,-505.12625,15.325611,0,1000,0,0,100,0),
(@PATH,39,-836.4318,-504.3011,15.481373,0,1000,0,0,100,0),
(@PATH,40,-835.6341,-510.708,14.580738,0,0,0,0,100,0),
(@PATH,41,-831.12964,-514.4581,13.073636,0,0,0,0,100,0),
(@PATH,42,-831.9032,-519.6377,12.2774935,0,0,0,0,100,0),
(@PATH,43,-840.47235,-523.65924,11.309986,0,0,0,0,100,0),
(@PATH,44,-855.597,-531.6628,9.947926,0,0,0,0,100,0),
(@PATH,45,-875.52313,-540.56195,7.7894483,0,0,0,0,100,0),
(@PATH,46,-895.1356,-539.0213,6.8796177,0,0,0,0,100,0),
(@PATH,47,-903.5875,-537.29663,6.8796177,0,0,0,0,100,0),
(@PATH,48,-915.12067,-537.19434,6.879618,0,0,0,0,100,0),
(@PATH,49,-915.76117,-534.2777,6.879618,0,1000,0,0,100,0),
(@PATH,50,-914.4863,-535.4483,6.879618,0,1000,0,0,100,0),
(@PATH,51,-914.656,-534.35944,6.879618,0,1000,0,0,100,0),
(@PATH,52,-914.96356,-534.7339,6.879618,0,1000,0,0,100,0),
(@PATH,53,-915.8514,-534.4144,6.879618,0,1000,0,0,100,0),
(@PATH,54,-915.48456,-534.03845,6.879618,0,1000,0,0,100,0),
(@PATH,55,-914.256,-533.626,6.879618,0,1000,0,0,100,0),
(@PATH,56,-914.581,-533.72394,6.879618,0,1000,0,0,100,0),
(@PATH,57,-902.9579,-538.5414,6.8796177,0,0,0,0,100,0),
(@PATH,58,-889.8371,-538.16406,7.1092725,0,0,0,0,100,0),
(@PATH,59,-875.12744,-539.2008,7.9527783,0,0,0,0,100,0),
(@PATH,60,-855.39844,-531.9824,9.934986,0,0,0,0,100,0),
(@PATH,61,-841.84705,-527.9842,11.309986,0,0,0,0,100,0),
(@PATH,62,-835.9883,-533.4375,12.99329,0,0,0,0,100,0),
(@PATH,63,-825.97906,-542.5843,14.960751,0,0,0,0,100,0),
(@PATH,64,-816.8363,-548.639,15.353817,0,0,0,0,100,0),
(@PATH,65,-809.4641,-549.4289,15.762508,0,0,0,0,100,0),
(@PATH,66,-803.6602,-561.7845,15.335751,0,0,0,0,100,0),
(@PATH,67,-799.71027,-577.0812,15.33921,0,0,0,0,100,0),
(@PATH,68,-800.1057,-583.4887,15.443812,0,0,0,0,100,0),
(@PATH,69,-797.8984,-583.4703,15.230567,0,1000,0,0,100,0),
(@PATH,70,-797.98755,-579.6382,15.276465,0,1000,0,0,100,0),
(@PATH,71,-800.19495,-583.45465,15.431117,0,1000,0,0,100,0),
(@PATH,72,-799.88434,-579.14764,15.216163,0,1000,0,0,100,0),
(@PATH,73,-798.1693,-580.1143,15.276465,0,1000,0,0,100,0),
(@PATH,74,-800.16125,-583.4415,15.431605,0,1000,0,0,100,0),
(@PATH,75,-800.8542,-579.315,15.237758,0,1000,0,0,100,0),
(@PATH,76,-800,-583.334,15.425258,0,1000,0,0,100,0),
(@PATH,77,-798.3655,-580.18207,15.276465,0,1000,0,0,100,0),
(@PATH,78,-797.9403,-580.0052,15.276465,0,1000,0,0,100,0),
(@PATH,79,-800.2767,-583.62036,15.4596815,0,1000,0,0,100,0),
(@PATH,80,-810.34436,-581.9623,15.237758,0,0,0,0,100,0),
(@PATH,81,-818.30096,-586.2939,15.237758,0,0,0,0,100,0),
(@PATH,82,-819.33673,-591.93414,15.237758,0,0,0,0,100,0),
(@PATH,83,-813.4908,-603.00287,14.751536,0,0,0,0,100,0),
(@PATH,84,-814.1696,-619.47876,13.492991,0,0,0,0,100,0),
(@PATH,85,-823.3555,-629.81573,12.992991,0,0,0,0,100,0),
(@PATH,86,-840.6395,-646.8327,16.252172,0,0,0,0,100,0),
(@PATH,87,-839.0176,-642.96484,16.050756,0,1000,0,0,100,0),
(@PATH,88,-838.93555,-639.86523,15.99729,0,1000,0,0,100,0),
(@PATH,89,-842.6993,-640.93994,16.195288,0,1000,0,0,100,0),
(@PATH,90,-841.01965,-643.8317,16.29099,0,1000,0,0,100,0),
(@PATH,91,-839.7244,-639.42096,16.017553,0,1000,0,0,100,0),
(@PATH,92,-839.8908,-639.9865,16.169653,0,1000,0,0,100,0),
(@PATH,93,-840.87494,-641.45056,16.112036,0,1000,0,0,100,0),
(@PATH,94,-842.7273,-643.167,16.370825,0,1000,0,0,100,0),
(@PATH,95,-840.53546,-644.1127,16.232885,0,1000,0,0,100,0),
(@PATH,96,-833.2031,-635.0208,14.602794,0,0,0,0,100,0),
(@PATH,97,-817.6917,-624.2955,13.075755,0,0,0,0,100,0),
(@PATH,98,-813.1201,-614.69257,13.867991,0,0,0,0,100,0),
(@PATH,99,-812.67755,-604.09796,14.522532,0,0,0,0,100,0),
(@PATH,100,-819.17377,-591.17865,15.237758,0,0,0,0,100,0),
(@PATH,101,-818.1184,-586.8952,15.237758,0,0,0,0,100,0),
(@PATH,102,-804.39374,-583.2604,15.237758,0,0,0,0,100,0),
(@PATH,103,-800.2036,-569.90594,15.362758,0,0,0,0,100,0),
(@PATH,104,-804.6609,-555.2182,15.335751,0,0,0,0,100,0),
(@PATH,105,-808.4378,-549.5417,15.710751,0,0,0,0,100,0),
(@PATH,106,-817.9054,-548.0948,15.290585,0,0,0,0,100,0),
(@PATH,107,-826.03314,-541.5869,14.899227,0,0,0,0,100,0),
(@PATH,108,-835.1634,-532.89264,12.912281,0,0,0,0,100,0),
(@PATH,109,-836.16,-527.04865,11.743336,0,0,0,0,100,0),
(@PATH,110,-833.3715,-523.9012,11.992847,0,0,0,0,100,0),
(@PATH,111,-821.2341,-525.02606,13.873441,0,0,0,0,100,0),
(@PATH,112,-806.83167,-531.29114,15.661038,0,0,0,0,100,0),
(@PATH,113,-779.9744,-544.9393,18.170403,0,0,0,0,100,0),
(@PATH,114,-766.5353,-547.13434,17.7619,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2022_01_03_08' WHERE sql_rev = '1640873815468810463';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;