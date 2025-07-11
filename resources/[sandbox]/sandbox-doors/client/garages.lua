function CreateGaragePolyZones()
	Polyzone.Create:Box("doors_mrpd_garage_enter", vector3(452.44, -1004.72, 28.56), 28.0, 5.4, {
		heading = 0,
		minZ = 24.36,
		maxZ = 29.36,
	}, {
		door_garage_id = "mrpd_garage_enter",
	})
	Polyzone.Create:Box("doors_mrpd_garage_exit", vector3(431.42, -1004.69, 25.7), 27.2, 5.4, {
		heading = 0,
		minZ = 24.1,
		maxZ = 29.1,
	}, {
		door_garage_id = "mrpd_garage_exit",
	})

	Polyzone.Create:Box("doors_mrpd_bollards_exit", vector3(415.39, -1021.02, 29.14), 6.8, 27.2, {
		heading = 0,
		minZ = 28.14,
		maxZ = 32.14,
	}, {
		door_garage_id = "mrpd_bollards_exit",
	})
	Polyzone.Create:Box("doors_mrpd_bollards_enter", vector3(413.39, -1027.79, 28.99), 6.8, 27.2, {
		heading = 0,
		minZ = 27.99,
		maxZ = 31.99,
	}, {
		door_garage_id = "mrpd_bollards_enter",
	})

	Polyzone.Create:Poly("doors_mrpd_reargate", {
		vector2(489.58059692383, -1029.5452880859),
		vector2(497.54434204102, -1029.5280761719),
		vector2(497.94250488281, -1013.8116455078),
		vector2(488.74029541016, -1013.7899780273),
		vector2(488.68612670898, -1017.1776733398),
		vector2(479.84219360352, -1017.140625),
		vector2(479.42630004883, -1023.64453125),
		vector2(486.17926025391, -1023.1638183594),
	}, {
		minZ = 27.1,
		maxZ = 31.99,
	}, {
		door_garage_id = "mrpd_reargate",
	})

	Polyzone.Create:Box("doors_sspd_garage", vector3(1858.3, 3685.7, 33.97), 24.0, 8.8, {
		heading = 35,
		--debugPoly=true,
		minZ = 32.97,
		maxZ = 36.97,
	}, {
		door_garage_id = "sspd_gate",
	})

	Polyzone.Create:Box("doors_redline_dealership_garage", vector3(-534.4, -885.86, 25.22), 16.2, 12.0, {
		heading = 0,
		minZ = 23.82,
		maxZ = 28.22,
	}, {
		door_garage_id = "redline_dealership_garage",
	})

	Polyzone.Create:Box("doors_redline_garage", vector3(-560.25, -930.26, 23.88), 9.8, 15.6, {
		heading = 0,
		minZ = 22.88,
		maxZ = 28.28,
	}, {
		door_garage_id = "redline_garage_door",
	})

	Polyzone.Create:Box("doors_redline_super_secret", vector3(-589.1, -925.18, 28.14), 5.2, 3.6, {
		heading = 0,
		minZ = 27.14,
		maxZ = 29.54,
	}, {
		door_garage_id = "redline_super_secret",
		secretMode = true,
	})

	Polyzone.Create:Box("doors_prison_gate_1", vector3(1846.73, 2607.87, 45.57), 10.8, 23.6, {
		heading = 358,
		--debugPoly=true,
		minZ = 44.57,
		maxZ = 48.57,
	}, {
		door_garage_id = "prison_gate_1",
	})

	Polyzone.Create:Box("doors_prison_gate_2", vector3(1821.32, 2608.62, 45.58), 10.8, 23.6, {
		heading = 358,
		--debugPoly=true,
		minZ = 44.58,
		maxZ = 48.58,
	}, {
		door_garage_id = "prison_gate_2",
	})

	Polyzone.Create:Box("doors_prison_gate_internal", vector3(1796.0, 2617.35, 45.57), 15.4, 7.2, {
		heading = 0,
		--debugPoly=true,
		minZ = 44.22,
		maxZ = 50.02,
	}, {
		door_garage_id = "prison_gate_internal_slide_right",
	})

	Polyzone.Create:Box("doors_prison_gate_double_01", vector3(1832.05, 2696.07, 45.56), 15.4, 15.0, {
		heading = 290,
		--debugPoly=true,
		minZ = 44.21,
		maxZ = 50.01,
	}, {
		door_garage_id = "prison_gate_double_right_01",
	})

	Polyzone.Create:Box("doors_prison_gate_double_02", vector3(1769.18, 2749.6, 45.49), 15.4, 15.0, {
		heading = 255,
		--debugPoly=true,
		minZ = 44.14,
		maxZ = 49.94,
	}, {
		door_garage_id = "prison_gate_double_right_02",
	})

	Polyzone.Create:Box("doors_prison_gate_double_03", vector3(1655.53, 2744.35, 45.56), 15.4, 15.0, {
		heading = 210,
		--debugPoly=true,
		minZ = 44.21,
		maxZ = 50.01,
	}, {
		door_garage_id = "prison_gate_double_right_03",
	})

	Polyzone.Create:Box("doors_prison_gate_double_04", vector3(1580.96, 2673.14, 45.56), 15.4, 15.0, {
		heading = 235,
		--debugPoly=true,
		minZ = 44.21,
		maxZ = 50.01,
	}, {
		door_garage_id = "prison_gate_double_right_04",
	})

	Polyzone.Create:Box("doors_prison_gate_double_05", vector3(1547.39, 2583.92, 45.56), 15.4, 15.0, {
		heading = 265,
		--debugPoly=true,
		minZ = 44.21,
		maxZ = 50.01,
	}, {
		door_garage_id = "prison_gate_double_right_05",
	})

	Polyzone.Create:Box("doors_prison_gate_double_06", vector3(1553.94, 2475.55, 45.56), 15.4, 15.0, {
		heading = 300,
		--debugPoly=true,
		minZ = 44.21,
		maxZ = 50.01,
	}, {
		door_garage_id = "prison_gate_double_right_06",
	})

	Polyzone.Create:Box("doors_prison_gate_double_07", vector3(1660.27, 2408.44, 45.56), 15.4, 15.0, {
		heading = 260,
		--debugPoly=true,
		minZ = 44.21,
		maxZ = 50.01,
	}, {
		door_garage_id = "prison_gate_double_right_07",
	})

	Polyzone.Create:Box("doors_prison_gate_double_08", vector3(1755.7, 2423.52, 45.57), 15.4, 15.0, {
		heading = 295,
		--debugPoly=true,
		minZ = 44.22,
		maxZ = 50.02,
	}, {
		door_garage_id = "prison_gate_double_right_08",
	})

	Polyzone.Create:Box("doors_prison_gate_double_09", vector3(1811.09, 2482.01, 45.56), 15.4, 15.0, {
		heading = 345,
		--debugPoly=true,
		minZ = 44.21,
		maxZ = 50.01,
	}, {
		door_garage_id = "prison_gate_double_right_09",
	})

	Polyzone.Create:Box("doors_davis_pd", vector3(401.26, -1609.2, 29.29), 20.0, 7.4, {
		heading = 315,
		minZ = 28.29,
		maxZ = 32.29,
	}, {
		door_garage_id = "dpd_gate",
	})

	Polyzone.Create:Box("doors_tuna_garage_1", vector3(159.84, -3034.16, 7.04), 25.0, 9.2, {
		heading = 270,
		minZ = 4.84,
		maxZ = 10.24,
	}, {
		door_garage_id = "tuna_garage_1",
	})

	Polyzone.Create:Box("doors_tuna_garage_2", vector3(159.55, -3024.37, 7.04), 25.0, 9.2, {
		heading = 270,
		minZ = 4.84,
		maxZ = 10.24,
	}, {
		door_garage_id = "tuna_garage_2",
	})

	Polyzone.Create:Box("doors_pdm_garage", vector3(-20.88, -1086.56, 27.31), 15.6, 6.2, {
		heading = 340,
		minZ = 26.31,
		maxZ = 30.31,
	}, {
		door_garage_id = "pdm_garage",
	})

	Polyzone.Create:Box("doors_uwu_garage", vector3(-601.88, -1059.2, 22.48), 4.8, 10.8, {
		heading = 0,
		minZ = 21.48,
		maxZ = 25.08,
	}, {
		door_garage_id = "uwu_garage",
	})

	Polyzone.Create:Box("doors_greycat_garage", vector3(2467.16, 4101.27, 38.07), 11.6, 3.8, {
		heading = 65,
		minZ = 37.07,
		maxZ = 39.87,
	}, {
		door_garage_id = "greycat_garage",
	})

	Polyzone.Create:Box("doors_traid_garage", vector3(-816.11, -741.26, 23.57), 14.4, 6.2, {
		heading = 0,
		--debugPoly=true,
		minZ = 22.57,
		maxZ = 26.17,
	}, {
		door_garage_id = "traid_garage",
	})

	Polyzone.Create:Box("doors_lmesapd", vector3(817.64, -1320.88, 26.08), 9.6, 24.6, {
		heading = 0,
		--debugPoly=true,
		minZ = 25.08,
		maxZ = 29.08,
	}, {
		door_garage_id = "la_mesa_parking_gate",
	})

	Polyzone.Create:Box("doors_carmeet", vector3(949.94, -1697.47, 29.6), 7.4, 14.4, {
		heading = 355,
		--debugPoly=true,
		minZ = 28.6,
		maxZ = 32.6,
	}, {
		door_garage_id = "meet_garage",
	})

	Polyzone.Create:Box("doors_taxi_garage", vector3(900.64, -146.49, 76.68), 16.6, 6.0, {
		heading = 330,
		--debugPoly=true,
		minZ = 75.48,
		maxZ = 79.48,
	}, {
		door_garage_id = "taxi_garage",
	})

	Polyzone.Create:Box("doors_dm_gates", vector3(-2558.91, 1914.43, 168.89), 6.6, 17.0, {
		heading = 332,
		--debugPoly=true,
		minZ = 167.49,
		maxZ = 170.49,
	}, {
		door_garage_id = "dm_gate_1",
	})

	Polyzone.Create:Box("doors_dm_garage", vector3(-2596.71, 1926.11, 167.3), 13.4, 9.2, {
		heading = 5,
		--debugPoly=true,
		minZ = 166.3,
		maxZ = 170.3,
	}, {
		door_garage_id = "dm_garage",
	})

	Polyzone.Create:Box("doors_tirenutz_garage_2", vector3(-66.38, -1341.39, 29.26), 8.8, 18.4, {
		heading = 0,
		--debugPoly=true,
		minZ = 28.26,
		maxZ = 31.26,
	}, {
		door_garage_id = "tnutz_garage_2",
	})

	Polyzone.Create:Box("doors_tirenutz_garage_1", vector3(-67.1, -1334.12, 29.26), 5.0, 18.4, {
		heading = 0,
		--debugPoly=true,
		minZ = 28.26,
		maxZ = 31.26,
	}, {
		door_garage_id = "tnutz_garage_1",
	})

	Polyzone.Create:Box("doors_hayes_garage_3", vector3(-1413.71, -438.47, 35.91), 18.6, 6.4, {
		heading = 33,
		--debugPoly=true,
		minZ = 35.03,
		maxZ = 38.63,
	}, {
		door_garage_id = "hayes_garage_3",
	})

	Polyzone.Create:Box("doors_hayes_garage_2", vector3(-1419.36, -442.85, 36.03), 18.6, 6.4, {
		heading = 33,
		--debugPoly=true,
		minZ = 35.03,
		maxZ = 38.63,
	}, {
		door_garage_id = "hayes_garage_2",
	})

	Polyzone.Create:Box("doors_hayes_garage_1", vector3(-1425.67, -446.87, 35.91), 18.6, 6.4, {
		heading = 33,
		--debugPoly=true,
		minZ = 34.91,
		maxZ = 38.51,
	}, {
		door_garage_id = "hayes_garage_1",
	})

	Polyzone.Create:Box("doors_atomic_garage", vector3(478.51, -1887.26, 26.09), 15.6, 10.0, {
		heading = 26,
		--debugPoly=true,
		minZ = 25.09,
		maxZ = 28.69,
	}, {
		door_garage_id = "atomic_garage_1",
	})

	Polyzone.Create:Box("doors_parsons_gate", vector3(-1477.43, 884.97, 183.07), 5.6, 11.0, {
		heading = 345,
		--debugPoly=true,
		minZ = 182.07,
		maxZ = 186.07,
	}, {
		door_garage_id = "doors_parsons_gate",
	})

	Polyzone.Create:Box("doors_odmc_garage1", vector3(964.13, -118.19, 74.37), 19.0, 6.0, {
		heading = 43,
		--debugPoly=true,
		minZ = 73.37,
		maxZ = 77.37,
	}, {
		door_garage_id = "odmc_garage_1",
	})

	Polyzone.Create:Box("doors_odmc_garage2", vector3(968.99, -112.24, 74.35), 19.0, 6.0, {
		heading = 43,
		--debugPoly=true,
		minZ = 73.35,
		maxZ = 77.35,
	}, {
		door_garage_id = "odmc_garage_2",
	})

	Polyzone.Create:Box("doors_odmc_garage3", vector3(983.79, -125.81, 74.35), 19.0, 6.0, {
		heading = 58,
		--debugPoly=true,
		minZ = 72.95,
		maxZ = 76.95,
	}, {
		door_garage_id = "odmc_garage_other",
	})

	-- Polyzone.Create:Box("doors_odmc_gate", vector3(960.01, -140.72, 74.43), 23.0, 8.7, {
	-- 	heading = 330,
	-- 	--debugPoly=true,
	-- 	minZ = 73.43,
	-- 	maxZ = 77.43,
	-- }, {
	-- 	door_garage_id = "odmc_gate",
	-- })

	Polyzone.Create:Box("doors_harmony_1", vector3(1182.28, 2648.13, 37.84), 20.8, 5.0, {
		heading = 0,
		--debugPoly=true,
		minZ = 36.84,
		maxZ = 40.84,
	}, {
		door_garage_id = "harmony_garage_1",
	})

	Polyzone.Create:Box("doors_harmony_2", vector3(1174.64, 2648.26, 37.8), 20.8, 5.0, {
		heading = 0,
		--debugPoly=true,
		minZ = 36.8,
		maxZ = 40.8,
	}, {
		door_garage_id = "harmony_garage_2",
	})

	Polyzone.Create:Box("doors_redline_gate", vector3(-539.26, -931.23, 23.9), 32.0, 19.6, {
		heading = 340,
		--debugPoly=true,
		minZ = 22.9,
		maxZ = 29.7,
	}, {
		door_garage_id = "redline_gate_1",
	})

	Polyzone.Create:Box("doors_redline_paint", vector3(-562.66, -914.53, 23.89), 7.4, 15.4, {
		heading = 0,
		--debugPoly=true,
		minZ = 22.89,
		maxZ = 26.89,
	}, {
		door_garage_id = "redline_paint",
	})

	-- Pillbox Med

	-- Polyzone.Create:Box('doors_pillbox_garagedoor_near', vector3(336.94, -563.73, 28.8), 34.4, 5.6, {
	--     heading = 340,
	--     minZ = 27.8,
	--     maxZ = 31.8
	-- }, {
	--     door_garage_id = 'pillbox_garagedoor_near',
	-- })

	-- Polyzone.Create:Box('doors_pillbox_garagedoor_far', vector3(330.63, -561.59, 28.8), 34.4, 5.6, {
	--     heading = 340,
	--     minZ = 27.8,
	--     maxZ = 31.8
	-- }, {
	--     door_garage_id = 'pillbox_garagedoor_far',
	-- })

	Polyzone.Create:Box("doors_hmech_garage_1", vector3(978.3, -1500.04, 31.51), 5.4, 15.0, {
		heading = 0,
		--debugPoly=true,
		minZ = 29.71,
		maxZ = 34.31,
	}, {
		door_garage_id = "hmech_garage_1",
	})

	Polyzone.Create:Box("doors_hmech_garage_2", vector3(999.53, -1490.94, 31.5), 5.4, 15.0, {
		heading = 90,
		--debugPoly=true,
		minZ = 29.7,
		maxZ = 34.3,
	}, {
		door_garage_id = "hmech_garage_2",
	})

	Polyzone.Create:Box("doors_autoexotics_garage_1", vector3(548.55, -208.79, 54.07), 6.0, 27.6, {
		heading = 270,
		--debugPoly=true,
		minZ = 49.47,
		maxZ = 56.47,
	}, {
		door_garage_id = "autoexotics_garage_1",
	})

	Polyzone.Create:Box("doors_autoexotics_garage_2", vector3(540.67, -189.65, 53.95), 5.2, 15.6, {
		heading = 5,
		--debugPoly=true,
		minZ = 51.75,
		maxZ = 56.95,
	}, {
		door_garage_id = "autoexotics_garage_2",
	})

	Polyzone.Create:Box("doors_autoexotics_garage_3", vector3(539.48, -179.35, 54.48), 5.2, 15.6, {
		heading = 5,
		--debugPoly=true,
		minZ = 52.28,
		maxZ = 57.48,
	}, {
		door_garage_id = "autoexotics_garage_3",
	})

	Polyzone.Create:Box("doors_autoexotics_garage_4", vector3(548.446, -164.251, 54.486), 4.6, 10.0, {
		heading = 90,
		--debugPoly=true,
		minZ = 52.1,
		maxZ = 57.3,
	}, {
		door_garage_id = "autoexotics_garage_4",
	})

	Polyzone.Create:Box("doors_autoexotics_garage_5", vector3(563.26, -209.19, 51.52), 6.4, 14.0, {
		heading = 340,
		--debugPoly=true,
		minZ = 49.72,
		maxZ = 53.12,
	}, {
		door_garage_id = "autoexotics_garage_5",
	})

	Polyzone.Create:Box("doors_autoexotics_garage_6", vector3(553.31, -234.9, 49.98), 10.6, 4.8, {
		heading = 65,
		--debugPoly=true,
		minZ = 48.98,
		maxZ = 52.78,
	}, {
		door_garage_id = "autoexotics_garage_6",
	})

	Polyzone.Create:Box("doors_autoexotics_bollards", vector3(543.25, -250.29, 49.98), 15.2, 5.8, {
		heading = 335,
		--debugPoly=true,
		minZ = 48.98,
		maxZ = 52.18,
	}, {
		door_garage_id = "autoexotics_bollards",
	})

	Polyzone.Create:Box("doors_nines_gate", vector3(-667.16, -892.16, 24.5), 6.8, 19.2, {
		heading = 0,
		--debugPoly=true,
		minZ = 23.5,
		maxZ = 27.5,
	}, {
		door_garage_id = "nines_gate",
	})

	-- Polyzone.Create:Box("doors_block_garage", vector3(-674.03, -878.71, 24.5), 5.8, 19.2, {
	-- 	heading = 0,
	-- 	--debugPoly=true,
	-- 	minZ = 23.5,
	-- 	maxZ = 26.7,
	-- }, {
	-- 	door_garage_id = "block_garage",
	-- })

	Polyzone.Create:Box("doors_hamz_gate", vector3(-1160.36, 312.09, 68.34), 6.8, 17.2, {
		heading = 30,
		--debugPoly=true,
		minZ = 66.94,
		maxZ = 71.74,
	}, {
		door_garage_id = "hamz_gate",
	})

	Polyzone.Create:Box("doors_pepega_gate", vector3(-1129.08, -1590.57, 4.39), 6.8, 17.2, {
		heading = 305,
		--debugPoly=true,
		minZ = 2.99,
		maxZ = 7.79,
	}, {
		door_garage_id = "pepega_gate",
	})

	Polyzone.Create:Box("doors_deathrow_gate", vector3(-1556.12, -298.68, 48.26), 8.4, 18.6, {
		heading = 310,
		--debugPoly=true,
		minZ = 46.86,
		maxZ = 51.66,
	}, {
		door_garage_id = "deathrow_gate",
	})

	Polyzone.Create:Box("doors_rockford_records_garage", vector3(-977.01, -265.85, 38.29), 15.0, 5, {
		heading = 29,
		--debugPoly=true,
		minZ = 37.29,
		maxZ = 41.29,
	}, {
		door_garage_id = "rockford_records_garage",
	})

	Polyzone.Create:Box("doors_securoserv_garage", vector3(29.02, -100.07, 56.09), 6.6, 17.6, {
		heading = 70,
		--debugPoly=true,
		minZ = 54.49,
		maxZ = 58.49,
	}, {
		door_garage_id = "securoserv_garage",
	})

	Polyzone.Create:Box("doors_ottos_garage3", vector3(823.4, -820.26, 26.21), 18.6, 5.8, {
		heading = 270,
		--debugPoly=true,
		minZ = 25.21,
		maxZ = 29.81,
	}, {
		door_garage_id = "ottos_garage3",
	})

	Polyzone.Create:Box("doors_ottos_garage2", vector3(823.67, -812.9, 26.19), 18.6, 5.8, {
		heading = 270,
		--debugPoly=true,
		minZ = 25.19,
		maxZ = 29.79,
	}, {
		door_garage_id = "ottos_garage2",
	})

	Polyzone.Create:Box("doors_ottos_garage1", vector3(824.23, -805.63, 26.18), 18.6, 5.8, {
		heading = 270,
		--debugPoly=true,
		minZ = 25.18,
		maxZ = 29.78,
	}, {
		door_garage_id = "ottos_garage1",
	})

	Polyzone.Create:Box("doors_ottos_garage1_temp", vector3(945.92, -985.11, 39.5), 12.4, 6.0, {
		heading = 4,
		--debugPoly=true,
		minZ = 38.3,
		maxZ = 43.9,
	}, {
		door_garage_id = "ottos_garage1_temp",
	})

	Polyzone.Create:Box("doors_lakevinewood2_gate_1", vector3(-134.58, 973.51, 235.88), 27.2, 8.2, {
		heading = 340,
		--debugPoly=true,
		minZ = 234.48,
		maxZ = 238.88,
	}, {
		door_garage_id = "lakevinewood2_gate_1",
	})

	Polyzone.Create:Box("doors_lakevinewood4_gate_1", vector3(-128.58, 900.3, 235.73), 27.2, 8.2, {
		heading = 275,
		--debugPoly=true,
		minZ = 234.33,
		maxZ = 238.73,
	}, {
		door_garage_id = "lakevinewood4_gate_1",
	})

	Polyzone.Create:Box("doors_lakevinewood3_gate_1", vector3(-105.45, 848.14, 235.75), 27.2, 8.2, {
		heading = 180,
		--debugPoly=true,
		minZ = 234.35,
		maxZ = 238.75,
	}, {
		door_garage_id = "lakevinewood3_gate_1",
	})

	Polyzone.Create:Box("doors_pbpd_gate", vector3(-453.63, 6028.5, 31.34), 6.6, 24.4, {
		heading = 45,
		--debugPoly=true,
		minZ = 30.34,
		maxZ = 34.34,
	}, {
		door_garage_id = "pbpd_gate",
	})

	Polyzone.Create:Box("doors_sagma_garage", vector3(-492.55, 51.48, 52.41), 5.6, 16.8, {
		heading = 355,
		--debugPoly=true,
		minZ = 51.21,
		maxZ = 54.21,
	}, {
		door_garage_id = "sagma_garage",
	})

	Polyzone.Create:Box("doors_bennys_side_garage_1", vector3(-207.8238, -1313.4540, 31.3005), 20.0, 10.0, {
		heading = 2,
		--debugPoly = true,
		minZ = 29.3005,
		maxZ = 34.3005,
	}, {
		door_garage_id = "bennys_side_garage_1",
	})

	Polyzone.Create:Box("doors_bennys_side_garage_2", vector3(-215.9706, -1313.4753, 31.3005), 20.0, 10.0, {
		heading = 2,
		--debugPoly = true,
		minZ = 29.3005,
		maxZ = 34.3005,
	}, {
		door_garage_id = "bennys_side_garage_2",
	})

	Polyzone.Create:Box("doors_bennys_main_garage", vector3(-230.6841, -1327.0823, 31.3005), 20.0, 10.0, {
		heading = 90,
		--debugPoly = true,
		minZ = 29.3005,
		maxZ = 34.3005,
	}, {
		door_garage_id = "bennys_main_garage",
	})

	Polyzone.Create:Box("doors_dpd_gate2", vector3(415.41, -1622.07, 29.29), 6.8, 23.2, {
		heading = 230,
		--debugPoly=true,
		minZ = 28.29,
		maxZ = 32.29,
	}, {
		door_garage_id = "dpd_gate2",
	})

	Polyzone.Create:Box("doors_dpd_gate3", vector3(417.33, -1654.22, 29.29), 6.8, 23.2, {
		heading = 320,
		--debugPoly=true,
		minZ = 28.29,
		maxZ = 32.29,
	}, {
		door_garage_id = "dpd_gate3",
	})

	--[[
		Cloud 9 Gates
	]]
	--

	Polyzone.Create:Box("cloud9_front_gate_entrance", vector3(17.6184, -2532.0994, 6.0500), 20.0, 6.0, {
		heading = 235.0,
		debugPoly = false,
		minZ = 4.0,
		maxZ = 10.0,
	}, {
		door_garage_id = "cloud9_front_gate_enter",
	})

	Polyzone.Create:Box("cloud9_front_gate_exit", vector3(12.0929, -2539.4844, 6.0500), 20.0, 6.0, {
		heading = 235.0,
		debugPoly = false,
		minZ = 4.0,
		maxZ = 10.0,
	}, {
		door_garage_id = "cloud9_front_gate_exit_out",
	})
	Polyzone.Create:Box("cloud9_rear_gate_entrance", vector3(-190.3328, -2515.6428, 6.0510), 20.0, 6.0, {
		heading = 180.0,
		debugPoly = false,
		minZ = 4.0,
		maxZ = 10.0,
	}, {
		door_garage_id = "cloud9_rear_gate_enter",
	})
	Polyzone.Create:Box("cloud9_rear_gate_exit", vector3(-199.6372, -2515.0322, 6.0471), 20.0, 6.0, {
		heading = 180.0,
		debugPoly = false,
		minZ = 4.0,
		maxZ = 10.0,
	}, {
		door_garage_id = "cloud9_rear_gate_exit_out",
	})

	--[[
		Mt Zonah Garage
	]]
	--

	Polyzone.Create:Box("mt_zonah_garage_lobby_door_1", vector3(-495.8302, -340.1208, 34.4972), 15.0, 4.0, {
		heading = 85.0,
		debugPoly = false,
		minZ = 32.0,
		maxZ = 36.0,
	}, {
		door_garage_id = "mt_zonah_garage_lobby_1",
	})

	Polyzone.Create:Box("mt_zonah_garage_lobby_door_2", vector3(-495.5523, -336.0801, 34.4917), 15.0, 4.0, {
		heading = 85.0,
		debugPoly = false,
		minZ = 32.0,
		maxZ = 36.0,
	}, {
		door_garage_id = "mt_zonah_garage_lobby_2",
	})

	Polyzone.Create:Box("mt_zonah_garage_lobby_door_3", vector3(-494.9696, -332.0850, 34.5013), 15.0, 4.0, {
		heading = 85.0,
		debugPoly = false,
		minZ = 32.0,
		maxZ = 36.0,
	}, {
		door_garage_id = "mt_zonah_garage_lobby_3",
	})

	--[[
		St Fiacre Garage
	]]
	--

	Polyzone.Create:Box("st_fiacre_garage_door_1", vector3(1135.84, -1596.4, 34.72), 13.2, 4.8, {
		heading = 0.0,
		debugPoly = false,
		minZ = 33.02,
		maxZ = 36.82,
	}, {
		door_garage_id = "st_fiacre_garage_1",
	})

	Polyzone.Create:Box("st_fiacre_garage_door_2", vector3(1141.47, -1596.37, 34.72), 13.2, 4.8, {
		heading = 0.0,
		debugPoly = false,
		minZ = 33.02,
		maxZ = 36.82,
	}, {
		door_garage_id = "st_fiacre_garage_2",
	})

	--[[
		SAFD Eastside
	]]
	--
	Polyzone.Create:Box("safd_eastside_garage_door_1", vector3(1204.69, -1463.38, 34.86), 15.0, 4.0, {
		heading = 180.0,
		debugPoly = false,
		minZ = 32.0,
		maxZ = 36.0,
	}, {
		door_garage_id = "safd_eastside_garage_1",
	})

	Polyzone.Create:Box("safd_eastside_garage_door_2", vector3(1200.56, -1463.59, 34.87), 15.0, 4.0, {
		heading = 180.0,
		debugPoly = false,
		minZ = 32.0,
		maxZ = 36.0,
	}, {
		door_garage_id = "safd_eastside_garage_2",
	})

	Polyzone.Create:Box("safd_eastside_garage_door_3", vector3(1196.55, -1463.44, 34.86), 15.0, 4.0, {
		heading = 180.0,
		debugPoly = false,
		minZ = 32.0,
		maxZ = 36.0,
	}, {
		door_garage_id = "safd_eastside_garage_3",
	})

	--[[
		SAFD Southside
	]]
	--
	Polyzone.Create:Box("safd_southside_garage_door_1", vector3(215.45, -1645.94, 29.80), 15.0, 4.0, {
		heading = 140.0,
		debugPoly = false,
		minZ = 27.80,
		maxZ = 31.80,
	}, {
		door_garage_id = "safd_southside_garage_1",
	})

	Polyzone.Create:Box("safd_southside_garage_door_2", vector3(212.29, -1643.38, 29.80), 15.0, 4.0, {
		heading = 140.0,
		debugPoly = false,
		minZ = 27.80,
		maxZ = 31.80,
	}, {
		door_garage_id = "safd_southside_garage_2",
	})

	Polyzone.Create:Box("safd_southside_garage_door_3", vector3(209.13, -1640.77, 29.80), 15.0, 4.0, {
		heading = 140.0,
		debugPoly = false,
		minZ = 27.80,
		maxZ = 31.80,
	}, {
		door_garage_id = "safd_southside_garage_3",
	})

	--[[
		Maze Bank Arena
	]]
	--
	Polyzone.Create:Box("mba_garage_door_left_box", vector3(-375.44, -1880.23, 19.11), 15.0, 10.0, {
		heading = 200.0,
		debugPoly = false,
		minZ = 17.80,
		maxZ = 22.80,
	}, {
		door_garage_id = "mba_garage_door_left",
	})

	Polyzone.Create:Box("mba_garage_door_right_box", vector3(-386.16, -1885.45, 19.12), 15.0, 10.0, {
		heading = 200.0,
		debugPoly = false,
		minZ = 17.80,
		maxZ = 22.80,
	}, {
		door_garage_id = "mba_garage_door_right",
	})

	Polyzone.Create:Box("doors_paleto_tuners_garage_1", vector3(151.23, 6390.33, 31.18), 24.0, 10, {
		heading = 30,
		--debugPoly=true,
		minZ = 30.18,
		maxZ = 34.18,
	}, {
		door_garage_id = "paleto_tuners_garage_1",
	})

	Polyzone.Create:Box("doors_paleto_tuners_garage_2", vector3(160.19, 6395.02, 31.18), 24.0, 10, {
		heading = 30,
		--debugPoly=true,
		minZ = 30.18,
		maxZ = 34.18,
	}, {
		door_garage_id = "paleto_tuners_garage_2",
	})

	Polyzone.Create:Box("doors_gpd_garage", vector3(-1097.78, -254.98, 37.45), 7.0, 18.8, {
		heading = 20,
		--debugPoly=true,
		minZ = 31.65,
		maxZ = 39.05,
	}, {
		door_garage_id = "gpd_garage",
	})

	Polyzone.Create:Box("doors_dreamworks_main_garage", vector3(-743.79, -1505.26, 5.06), 25.0, 12.6, {
		heading = 24,
		--debugPoly=true,
		minZ = 4.06,
		maxZ = 8.46,
	}, {
		door_garage_id = "dreamworks_main_garage",
	})
end

local rLimited = false

function DoGarageKeyFobAction()
	if LocalPlayer.state.loggedIn and not rLimited then
		local playerCoords = GetEntityCoords(GLOBAL_PED)
		local inZone = Polyzone:IsCoordsInZone(playerCoords, false, "door_garage_id")
		if inZone and inZone.door_garage_id then
			if Doors:CheckRestriction(inZone.door_garage_id) then
				Callbacks:ServerCallback("Doors:ToggleLocks", inZone.door_garage_id, function(success, newState)
					if success then
						if newState then
							UISounds.Play:FrontEnd(-1, "OOB_Cancel", "GTAO_FM_Events_Soundset")
						else
							UISounds.Play:FrontEnd(-1, "Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset")
						end
					end
				end)
			else
				if not secretMode then
					UISounds.Play:FrontEnd(-1, "Hack_Failed", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
					Notification:Error("Not Authorized")
				end
			end
		end

		rLimited = true
		SetTimeout(650, function()
			rLimited = false
		end)
	end
end
