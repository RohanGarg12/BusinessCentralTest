controladdin "MAPEmbed"
{

    HorizontalStretch = true;
    VerticalStretch = true;
    VerticalShrink = false;
    RequestedHeight = 300;
    //RequestedWidth = 200
    // RefreshScript = 'Using_MAP_Embed/CallMAPProd.js';
    //RecreateScript = 'Using_MAP_Embed/CallMAPProd.js';

    //MaximumHeight = 700;

    // JS files required for Bootstrap
    Scripts = 'Using_MAP_Embed/Startup.js';

    StartupScript = 'Using_MAP_Embed/Startup.js';

    // Bootstrap css
    StyleSheets = 'Using_MAP_Embed/StyleSheet.css';
    procedure CallMAPProd(IMO: Text);
    event OnStartup();
}