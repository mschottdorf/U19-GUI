function gui_state = virmenGuiState(defaults)

gui_state = struct( ...
    'selectedWorld',            1, ...
    'selectedObject',           0, ...
    'selectedShape',            0, ...
    'showTriangulation',        defaults.showTriangulation, ...
    'triangulationColor',       defaults.triangulationColor,  ...
    'worldXLim',                defaults.worldXLim, ...
    'worldYLim',                defaults.worldYLim, ...
    'textureXLim',              [], ...
    'textureYLim',              [], ...
    'worldMouseMode',           'rotate', ...
    'fileName',                 '', ...
    'showWireframe',            defaults.showWireframe ...
    );