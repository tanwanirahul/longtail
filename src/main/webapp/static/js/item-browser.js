YUI.add('longtail-item-browser', function(Y) {

    function ItemBrowser(config) {
      ItemBrowser.superclass.constructor.apply(this, arguments);
    };

    ItemBrowser.NAME = "item-browse";

    ItemBrowser.ATTRS = {
      bodyContent :  {value:'<div class="yui3-u-1">Loading...</div>'},
      zIndex : {value:110},
      type : {value:null},
      href : {value:PageData.servicesBase + "/image/browse"},
      uploadUrl : {value:PageData.servicesBase + "/image/upload"},
      node : {value: null}
    };

    Y.extend(ItemBrowser, Y.longtail.OverlayPanel, {

        bindUI : function()
        {
          ItemBrowser.superclass.bindUI.apply(this, arguments);
          var node = this.get("boundingBox").one(".yui3-widget-bd");
          node.delegate("click", Y.bind(this.onSelect, this), ".image-thumb, .yui3-dropdown-item");
          node.delegate("click", Y.bind(this.nextPage, this), ".list-pagination a");
        },

        nextPage : function(e)
        {
          e.halt();
          var href = e.currentTarget.get("href");
          this.set("href", href);
          Y.Cookie.set(this.get("type") + '_url', href);
          this.syncUI();
        },

        onSelect : function(e)
        {
          var node = e.currentTarget, cssText = node.getAttribute("data-csstext"), uuid = node.getAttribute("data-uuid"),
          	  type = this.get("type");
          
          this.get("boundingBox").all(".yui3-dropdown-item-selected").removeClass("yui3-dropdown-item-selected");
          node.addClass("yui3-dropdown-item-selected");

          if(uuid == "custom")
          {
            Y.fire('custom:css', {node: this.get("node"), cssText: cssText});
          } else
          {
          	cssText = node.ancestor(".swatch-container").one("style").get("textContent");
          	Y.fire('quickstyle:selected', {node: this.get("node"), css: cssText, id: uuid, type: type});  
          }
        }
    });

    Y.namespace("longtail").ItemBrowser = ItemBrowser;

}, '3.2.0', {requires:['longtail-overlay-panel']});
