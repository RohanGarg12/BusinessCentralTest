
function carouselMarkup(imo) {
    return `
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">zkair hussain 
    <script type="text/javascript">
    // Map appearance
    var width="100%";         // width in pixels or percentage
    var height="1000";         // height in pixels
    var names=true;           // always show ship names (defaults to false)

    // Single ship tracking
    var imo="9320568";        // display latest position (by IMO, overrides MMSI)
    var show_track=true;      // display track line (last 24 hours)
    </script>
    <script type="text/javascript" src="https://www.vesselfinder.com/aismap.js"></script>

    </div>
    `;
}

function CallMAPProd(imo) {
    try {
        console.log('HTML-Start-0001');
        //test();
        var markup = carouselMarkup(imo);
        console.log('HTML-Start');
        // document.getElementById('controlAddIn').height = '700px';
        // document.getElementById('controlAddIn').width = '700px';
        document.getElementById('controlAddIn').innerHTML = markup;
        alert(document.getElementById('controlAddIn').innerHTML);
        // $('#carouselExampleCaptions').carousel();
        document.ontimeupdate;
        console.log(markup);

        console.log('After-Javascript');
    } catch (err) {
        console.log(err);
    }

}

var names = true;

//var imo = "9138850";
var width = "100%";
var height = "300";
var show_track = true;
