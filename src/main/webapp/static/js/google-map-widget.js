YUI.add('longtail-google-maps', function(Y) {

    function GoogleMapsWidget(config) {
        GoogleMapsWidget.superclass.constructor.apply(this, arguments);
    };
    
    GoogleMapsWidget.NAME = "longtail-google-maps";

    GoogleMapsWidget.ATTRS = {
            widgetElement: {value: null},
            mapAddr: {value: "Bangalore, India"},
            mapLat: {value: 12.9715987},
            mapLng: {value: 77.5945627},
            zoomLevel: {value: 12},
            map: {value: null}
        };

    Y.extend(GoogleMapsWidget, Y.Widget, {
        geocoder: null,
        
        initializer: function() {
            if (!this.geocoder) {
                if (typeof google === "undefined") {
                    Y.later(500, this, this.initGeocoder, null, true);
                } else {
                    this.geocoder = new google.maps.Geocoder();
                }
            }
        },
        
        initGeocoder: function() {
            if (typeof google !== "undefined") {
                this.geocoder = new google.maps.Geocoder();
            }
        },

        renderUI : function() {
            var widgetEl = this.get("widgetElement");

            this.set("mapLat", parseFloat(widgetEl.one(".gmap-lat").get("value")));
            this.set("mapLng", parseFloat(widgetEl.one(".gmap-lng").get("value")));
            this.set("zoomLevel", parseFloat(widgetEl.one(".gmap-zoom-level").get("value")));

            var mapContainer = Y.Node.getDOMNode(this.get("contentBox"));
            var args = {
                    zoom: this.get("zoomLevel"),
                    center: new google.maps.LatLng(this.get("mapLat"), this.get("mapLng")),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

            this.set("map", new google.maps.Map(mapContainer, args));
        },

        bindUI: function() {
            var widgetEl = this.get("widgetElement");

            widgetEl.one(".gmap-zoom-level").on("change", Y.bind(function(e) {
                    var map = this.get("map");
                    var zoomLevel = parseInt(widgetEl.one(".gmap-zoom-level").get("value"));

                    this.set("zoomLevel", zoomLevel);
                    widgetEl.one(".gmap-zoom-level").set("value", zoomLevel);

                    map.setZoom(zoomLevel);
                }, this));
            widgetEl.one(".gmap-addr").on("change", Y.bind(this.syncUI, this));
            widgetEl.one(".gmap-search-btn").on("click", Y.bind(this.syncUI, this));
        },

        syncUI: function() {
            var _self = this;
            var widgetEl = this.get("widgetElement");
            var address = widgetEl.one(".gmap-addr").get("value");

            this.geocoder.geocode( { 'address': address }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {  
                    _self.set("mapAddr", results[0].formatted_address);

                    var location = results[0].geometry.location;
                    _self.set("mapLat", location.lat());
                    _self.set("mapLng", location.lng());
                    widgetEl.one(".gmap-lat").set("value", location.lat());
                    widgetEl.one(".gmap-lng").set("value", location.lng());

                    var map = _self.get("map");
                    map.setCenter(results[0].geometry.location);
                    map.setZoom(parseInt(widgetEl.one(".gmap-zoom-level").get("value")));

                    var marker = new google.maps.Marker({
                        map: map,
                        position: location
                    });
                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
             });
        }

    });

    Y.namespace("longtail").googlemaps = GoogleMapsWidget;

}, "3.3.0", {requires: ["node", "event", "widget"]});
