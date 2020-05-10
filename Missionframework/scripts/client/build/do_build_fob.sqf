private [ "_minfobdist", "_minsectordist", "_distfob", "_clearedtobuildfob", "_distsector", "_clearedtobuildsector", "_idx" ];

if ( count KPLIB_all_fobs >= KPLIB_maximum_fobs ) exitWith {
    hint format [ localize "STR_HINT_FOBS_EXCEEDED", KPLIB_maximum_fobs ];
};

_minfobdist = 1000;
_minsectordist = KPLIB_capture_size + KPLIB_fob_range;
_distfob = 1;
_clearedtobuildfob = true;
_distsector = 1;
_clearedtobuildsector = true;

FOB_build_in_progress = true;
publicVariable "FOB_build_in_progress";

_idx = 0;
while { (_idx < (count KPLIB_all_fobs)) && _clearedtobuildfob } do {
    if ( player distance (KPLIB_all_fobs select _idx) < _minfobdist ) then {
        _clearedtobuildfob = false;
        _distfob = player distance (KPLIB_all_fobs select _idx);
    };
    _idx = _idx + 1;
};

_idx = 0;
if(_clearedtobuildfob) then {
    while { (_idx < (count sectors_allSectors)) && _clearedtobuildsector } do {
        if ( player distance (markerPos (sectors_allSectors select _idx)) < _minsectordist ) then {
            _clearedtobuildsector = false;
            _distsector = player distance (markerPos (sectors_allSectors select _idx));
        };
        _idx = _idx + 1;
    };
};

if (!_clearedtobuildfob) then {
    hint format [localize "STR_FOB_BUILDING_IMPOSSIBLE",floor _minfobdist,floor _distfob];
    FOB_build_in_progress = false;
    publicVariable "FOB_build_in_progress";
} else {
    if ( !_clearedtobuildsector ) then {
        hint format [localize "STR_FOB_BUILDING_IMPOSSIBLE_SECTOR",floor _minsectordist,floor _distsector];
        FOB_build_in_progress = false;
        publicVariable "FOB_build_in_progress";
    } else {
        buildtype = 99;
        dobuild = 1;
        deleteVehicle (_this select 0);
    };
};
