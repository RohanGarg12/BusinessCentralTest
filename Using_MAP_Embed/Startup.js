Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnStartup')
var names = true;
var test = window.parent.document.querySelector("[aria-label^='Description, ']");
var imo = test.title;
console.log(test);
console.log(imo);
//var imo = "9138850";
var width = "100%";
var height = "300";
var show_track = true;

function carouselMarkup() {
    return `
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">zkair hussain 
    <script type="text/javascript">
    // Map appearance
    var width="100%";         // width in pixels or percentage
    var height="1000";         // height in pixels
    var names=true;           // always show ship names (defaults to false)

    // Single ship tracking
    var imo="9765067";        // display latest position (by IMO, overrides MMSI)
    var show_track=true;      // display track line (last 24 hours)
</script>
<script type="text/javascript" src="https://www.vesselfinder.com/aismap.js"></script>

    </div>
    `;
}

function CallMAPProd() {
    try {
        console.log('HTML-Start-0001');
        //test();
        
        console.log('HTML-Start');
         test = window.parent.document.querySelector("[aria-label^='Description, ']");
         imo = test.title;
         var markup = carouselMarkup();
        // document.getElementById('controlAddIn').height = '700px';
        // document.getElementById('controlAddIn').width = '700px';
        document.getElementById('controlAddIn').innerHTML = markup;
       // alert(document.getElementById('controlAddIn').innerHTML);
        // $('#carouselExampleCaptions').carousel();
       // document.ontimeupdate;
        console.log(markup);

        console.log('After-Javascript');
    } catch (err) {
        console.log(err);
    }

}

