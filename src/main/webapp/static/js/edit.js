var EditInterface = {};
var EMPTY_WIDGET_TEMPLATE = '<div class="widget-container empty-content-widget yui3-g">' +
'<div class="yui3-u empty-content-widget-hd">Add Widget Here</div>' +
'<div class="sample-widget widget-sprite-content-with-heading yui3-u" type="content-with-heading" title="Insert Text with Heading"></div>' +
'<div class="sample-widget widget-sprite-image yui3-u" type="image" title="Insert Image Here"></div>' +
'<div class="sample-widget widget-sprite-content yui3-u" type="content" title="Insert Text Here"></div>' +
'<div class="sample-widget widget-sprite-content-and-image yui3-u" type="content-and-image" title="Insert Text and Image Here"></div>' +
'<div class="yui3-u empty-content-widget-ft"><a href="javascript:void(0)" onclick="EditInterface.showOverlay(\'widgets\')">MORE WIDGETS &hellip;</a></div>' +
'</div>';
var CLOSE_BUTTON_TEMPLATE = '<div class="close"></div>';

var BROWSER_COMPAT = {

  CSS_NAME_EQ : {
    'borderRadius' : {'gecko':'MozBorderRadius','webkit':'WebkitBorderRadius'},
    'borderTopRightRadius' : {'gecko':'MozBorderRadiusTopright','webkit':'WebkitBorderTopRightRadius'},
    'borderTopLeftRadius' : {'gecko':'MozBorderRadiusTopleft','webkit':'WebkitBorderTopLeftRadius'},
    'borderBottomRightRadius' : {'gecko':'MozBorderRadiusBottomright','webkit':'WebkitBorderBottomRightRadius'},
    'borderBottomLeftRadius' : {'gecko':'MozBorderRadiusBottomleft','webkit':'WebkitBorderBottomLeftRadius'}
  },

  getEq : function(name)
  {
      var browser = Y.UA.ie ? 'ie' : (Y.UA.gecko ? 'gecko' : (Y.UA.Chrome || Y.UA.Webkit ? 'webkit' : 'unknown'));
      if(this.CSS_NAME_EQ[name] && this.CSS_NAME_EQ[name][browser])
      {
          return this.CSS_NAME_EQ[name][browser];
      }

      return name;
  }
}

var Utils = {
    totalWidth : function(node)
    {
        return parseInt(node.getComputedStyle("width"), 10) + parseInt(node.getComputedStyle("paddingLeft"), 10) +
        parseInt(node.getComputedStyle("paddingRight"), 10) + parseInt(node.getComputedStyle("borderLeftWidth"), 10) +
        parseInt(node.getComputedStyle("borderRightWidth"), 10);
    },

    totalHeight : function(node)
    {
        return parseInt(node.getComputedStyle("height"), 10) + parseInt(node.getComputedStyle("paddingTop"), 10) +
        parseInt(node.getComputedStyle("paddingBottom"), 10) + parseInt(node.getComputedStyle("borderBottomWidth"), 10) +
        parseInt(node.getComputedStyle("borderTopWidth"), 10);
    },

    calc : function(node, formulaArr)
    {
      var value = 0;
      for(var i = 0; i < formulaArr.length; i++)
      {
        var term = formulaArr[i][0] == '-' || formulaArr[i][0] == '+' ? formulaArr[i].substring(1) : formulaArr[i];
        var sign = formulaArr[i][0] == '-' ? -1 : 1;
        value += parseInt(node.getComputedStyle(term)) * sign;
      }

      return value;
    },

    cutHex : function(h) {
    return (h.charAt(0)=="#") ? h.substring(1,7):h;
  },

  RGBToHex : function(h)
  {
    if(h == "transparent")
    {
      return h;
    }

    var r = parseInt(h.replace(/rgb[a]*\(([\d ]+),([\d ]+),([\d ]+).*/,"$1"),10).toString(16);
    var g = parseInt(h.replace(/rgb[a]*\(([\d ]+),([\d ]+),([\d ]+).*/,"$2"),10).toString(16);
    var b = parseInt(h.replace(/rgb[a]*\(([\d ]+),([\d ]+),([\d ]+).*/,"$3"),10).toString(16);
    r.length == 1 ? r = "0" + r : 0;
    g.length == 1 ? g = "0" + g : 0;
    b.length == 1 ? b = "0" + b : 0;
    return "#" + r + g + b;
  },

  HexToRGB : function(h)
  {
    var r = parseInt((this.cutHex(h)).substring(0,2),16);
    var g = parseInt((this.cutHex(h)).substring(2,4),16);
    var b = parseInt((this.cutHex(h)).substring(4,6),16);
    return [r,g,b];
  }
};

EditInterface.init = function()
{
    Y.log("Initializing Edit Interface", "info");
    Y.Event.define("clickoutside", {
        on: function (node, subscription, notifier) {
                function outside(clickTarget) {
                    return clickTarget !== node && !clickTarget.ancestor(
                        function (parent) {
                            return parent === node;
                        });
                }

                var handle = Y.one('doc').on('click', function (e) {
                        if (outside(e.target)) {
                            notifier.fire(e);
                        }
                    });
                subscription.clickHandle = handle;
            },

        detach: function (node, subscription, notifier) {
                subscription.clickHandle.detach();
            }
    });

    L.HTML.addClass("preview-mode");
    EditInterface.initOverlays();

    SiteInterfaceController.on("hashed:editinit", EditInterface.addTitles, EditInterface);
    SiteInterfaceController.on("hashed:editinit", EditInterface.addSectionButton, EditInterface);
    SiteInterfaceController.on("hashed:editinit", EditInterface.initImageGallery, EditInterface);
    SiteInterfaceController.on("hashed:editinit", EditInterface.addColumnSliders, EditInterface);
    SiteInterfaceController.on("hashed:editinit", EditInterface.initSpinners, EditInterface);
    SiteInterfaceController.on("hashed:editinit", EditInterface.initColorPicker, EditInterface);
    SiteInterfaceController.on("hashed:editinit", EditInterface.initEmptyColumns, EditInterface);

    /* Commenting the code below to prevent style-frame to show-up for widgets on mouseover
     *
     * Y.delegate("mouseenter", function(e){
     *   if(Y.LUI.hasState("widget-styles-enabled"))
     *   {
     *     var node = e.currentTarget;
     *     EditInterface.showWidgetOverlay("#" + node.get("id"));
     *   }
     * }, L.CANVAS, ".el-leaf-widget");
     */

    L.CANVAS.on("mouseenter", function(e){Y.LUI.enableState("in-canvas");});
    L.CANVAS.on("mouseleave", function(e){Y.LUI.disableState("in-canvas");});

    Y.delegate("click", function(e) {
        if (!EDIT_MODE || Y.LUI.getBookmark('mode') == "preview") { return; }
        var node = e.target.hasClass("editable") ? e.target : e.target.ancestor(".editable") || e.currentTarget;
        Y.log("Selected Node XXX " + node + " :: Ancestor" + e.target.ancestor(".editable"));
        if (node.hasClass("editing"))
        {
            return;
        }

        Y.LUI.disableState('widget-styles-enabled');
        EditInterface.selectWidget("#" + node.get("id"));
    }, L.HTML, ".editable, .column > .el-leaf-widget");

    Y.delegate("click", function(e) { EditInterface.onClickAjaxUrl(e); }, L.BODY, ".action-url");
    Y.delegate("click", function(e) { EditInterface.onAppendSection(e); }, L.BODY, ".addSectionButton");
    Y.delegate("click", function(e) { showUploadForm(e); }, L.BODY, ".video-upload-button");
    Y.delegate("click", function(e) { EditInterface.navigateTo(e); }, L.BODY, ".admin-nav-link");
    Y.delegate("click", function(e) { EditInterface.initSliders(e.target); }, L.BODY, "input[type=color]");
    Y.delegate("click", function(e) { EditInterface.selectWidget("#" + e.currentTarget.ancestor(".section-container").one("> .section").get("id")); }, L.BODY, ".col-change .edit-styles");
    Y.delegate("click", function(e) { EditInterface.addWidget(e); }, L.BODY, ".empty-content-widget .sample-widget");

    Y.DD.DDM.on("drag:end", function(){Y.longtail.FrameManager.sync();});
    Y.on("keyup", function(){Y.longtail.FrameManager.sync();});
    Y.on("keydown", function(){Y.longtail.FrameManager.sync();});

    var key_code_map = {"38" : "ancestor", "40" : "one", "39" : "next", "37" : "previous"};
    Y.on("keyup", function(e){
        if(e.shiftKey && e.ctrlKey && e.altKey){
            var handler = key_code_map[e.keyCode + ""];
            EditInterface.navigate(handler);
        }
    });
    Y.on("mouseup", function(){Y.longtail.FrameManager.sync(true);});

    Y.delegate("click", function(e){
            if (e.currentTarget.hasClass("admin") || e.currentTarget.ancestor(".widget-settings") != null)
            {
                return;
            }

            e.halt();
            alert("Forms submission is not allowed in admin interface.\n\nUsers can use this form on your actual site to submit information.");
        }, ".c_canvas", "form input[type=submit]");

    // Prevent links from navigating away from the page
    Y.delegate("click", function(e){
        e.preventDefault();
        if (!EDIT_MODE || (Y.LUI.getBookmark('mode') && Y.LUI.getBookmark('mode') == "preview"
                && e.currentTarget.ancestor(".el-navigation-data-item") != null))
        {
            EditInterface.navigateTo(e);
        }
    }, document, "#layoutArea a");

    EditInterface.initInterfaceElements();
    var bookmarkedPage = Y.LUI.getBookmark('page');
    if(bookmarkedPage && bookmarkedPage != PageData.path.replace(/\//g, ""))
    {
        bookmarkedPage = '/' + bookmarkedPage + '/';
        EditInterface.loadPage(PageData.navBase + bookmarkedPage);
        PageData.setPage(bookmarkedPage);
    }

    Y.LUI.enableState('widget-styles-enabled');
    Y.log("Registered all events", "info");

    Y.on("formSubmit", function(e){
        if(e.form.hasClass('data-update-form'))
        {
            var json = Y.JSON.parse(e.response.responseText);
            if(json.refresh)
            {
                new Widget('#' + json.refresh).refresh();
            }
        }
    });
}

EditInterface.selectNextNode = function(node, fn)
{
    if(node && fn){
        var next = node[fn](".editable, .el-widget-instance, .el-editable-marker");
        
        if(next == null && (fn == "next" || fn == "previous")){
            next = EditInterface.selectNextNode(
                    EditInterface.selectNextNode(
                            EditInterface.selectNextNode(node, "ancestor"),fn),"one");
        }
        
        return next;
    }
}

EditInterface.navigate = function(handler)
{
    var node = Y.longtail.FrameManager.getNode();
    var next = EditInterface.selectNextNode(node, handler);    
    if(next) EditInterface.selectWidget("#" + next.get('id'));
}

EditInterface.highlightSelection = function()
{
    Y.longtail.FrameManager.highlight();
}

EditInterface.selectWidget = function(selector, displayStr)
{
  var node = Y.one(selector);

  if(node.hasClass("editing"))
  {
      return;
  }

  if(node.hasClass("rich-text"))
  {
    displayStr = "Text Element";
    Y.longtail.EditorManager.editText(node);
  }else if(node.hasClass("html-text"))
  {
    displayStr = "HTML Text";
    Y.longtail.EditorManager.editHTML(node);
  }else if(node.hasClass("image-div"))
  {
    displayStr = "Image";
  }else if(node.hasClass("el-navigation-data-item"))
  {
        displayStr = "Navigation";
  }else if(node.get("tagName") == "FORM")
  {
      displayStr = "Form";
  }

  EditInterface.showOverlay("design");
  Y.LUI.disableState('widget-styles-enabled');

  EditInterface.showWidgetOverlay(selector);
  EditInterface.editStyles(selector, displayStr);

  // Close selectionOverlayContainer after user selection
  var selectionOverlayContainer = Y.one('#selectionOverlayContainer');
  if (selectionOverlayContainer) { selectionOverlayContainer.setStyle('display', 'none'); }
  // Bring selected component in the visible region
  var viewport = node.get("viewportRegion");
  var intersection = node.intersect(viewport);
  if(!intersection.inRegion)
  {
    node.scrollIntoView();
  }
}

EditInterface.elementType = function(sel)
{
  var node = Y.one(sel);
  var type = ELEMENT_TYPES[0];

  if(node.hasClass("widget") && node.hasClass("leaf"))
  {
    type = ELEMENT_TYPES[1];
  }else if(node.hasClass("widget"))
  {
    type = ELEMENT_TYPES[2];
  }else if(node.hasClass("rich-text"))
  {
    type = ELEMENT_TYPES[3];
  }else if(node.hasClass("image-div"))
  {
    type = ELEMENT_TYPES[4];
  }

  if(type == "unknown-element")
  {
    Y.log("Unable to figure type for " + sel,"warn");
  }

  return type;
}

var ELEMENT_TYPES = ["unknown-element", "leaf-widget-element", "container-widget-element", "text-element", "image-element"];

EditInterface.showWidgetOverlay = function(selector)
{
    var node = Y.one(selector);

    if(!node || node.compareTo(Y.longtail.FrameManager.getNode()))
    {
      return;
    }


    var styler = Y.longtail.FrameManager.showNode(node);
    styler.on("edit-styles", function(){
      EditInterface.selectWidget("#" + node.get("id"));
    });

    styler.on("moved", EditInterface.updateNodePosition, EditInterface, selector);
    styler.on("resized", EditInterface.updateNodeSize, EditInterface, selector);
    styler.on("delete", function(){new Widget(node).onDeleteWidget()});
}

EditInterface.updateNodePosition = function(e, selector)
{
    Y.log("Moved node " + selector + " to " + e.marginLeft + " : " + e.marginTop, "info");
    var nodeId = Y.one(selector).get("id");
    Y.longtail.SaveQueue.save('custom-styles', {node: nodeId, styles : e.details[0]});
}

EditInterface.updateNodeSize = function(e, selector)
{
    Y.log("Resized node " + selector + " to " + e.width + " : " + e.height, "info");
    Y.longtail.CSSUtils.applyCSS(selector, e.details[0]);
    var nodeId = Y.one(selector).get("id");
    Y.longtail.SaveQueue.save('custom-styles', {node: nodeId, styles : e.details[0]});
}

EditInterface.addWidget = function(e)
{
    var emptyWidget = e.currentTarget.ancestor(".empty-content-widget");
    var parent = emptyWidget.ancestor(".column");

    var uri = PageData.getServiceUrl("/page/add");
    var parentWidgetId = parent.get("id");

    Y.log("Adding a new widget using empty-column-links in " + parentWidgetId, "info");

    var params = {
        'parent' : parentWidgetId,
        'position' : 0,
        'widget' : e.currentTarget.getAttribute("type"),
        'path' : PageData.path
    };

    AjaxRequest(uri, params, new WidgetHTMLInsert(emptyWidget, null, {"replace":true}));
}

EditInterface.initSpinners = function(e)
{
    e.all("input.yui3-spinner").each(function(el){

        var spinner = new Y.Spinner({
            srcNode : el
        });
        spinner.render();
        spinner.set("watching",true);
    });
};

EditInterface.initColorPicker = function(e)
{
    e.all("input[type=color]").each(function(el) {
        Y.log("Initializing color-picker element", "info");
        jscolor.init(Y.Node.getDOMNode(el));
    });
};

EditInterface.hideEditOverlay = function()
{
  EditInterface.editTabs.deselectAll();
};

EditInterface.initEmptyColumns = function(e)
{
    e.all(".column.empty").each(function(e){
        var htmlTemplate = Y.Node.create(EMPTY_WIDGET_TEMPLATE);
        e.append(htmlTemplate);
    });
}

EditInterface.showOverlay = function(overlayId)
{
  var index = 3;
  // if(overlayId == "layouts") index = 0;
  if(overlayId == "themes") index = 0;
  // if(overlayId == "pages") index = 2;
  if(overlayId == "widgets") index = 1;
  if(overlayId == "design") index = 2;
  EditInterface.editTabs.selectChild(index);
}

EditInterface.toggleTabMode = function(mode)
{
  if(mode == "design") {
      Y.one(".design-settings-button").replaceClass('settings-mode','design-mode');
      Y.one(".css-style-form").replaceClass('settings-mode','design-mode');
  }else {
      Y.one(".design-settings-button").replaceClass('design-mode', 'settings-mode');
      Y.one(".css-style-form").replaceClass('design-mode', 'settings-mode');
  }
}

var Animatrix = {

    flyInFromLeft : function(sampleWidgets)
    {
        sampleWidgets.setStyle("maxWidth", "30px");
        sampleWidgets.setStyle("opacity", 0);
        sampleWidgets.transition({
                opacity: 1,
                maxWidth: "120px",
                easing: "cubic-bezier(0.5, 0.5, 1.0, 1.0)",
                duration: 1.0
        });
    }

};

EditInterface.addTitles = function(e)
{
    if (e)
    {
        e.all(".editable").each(function(e, k) {
                e.setAttribute("title", "Click to Edit");
            });
        e.all(".nav-widget li a").each(function(e) {
                e.setAttribute("title", "Navigate to edit '" + e.get("textContent") + "'");
            });
    }
}

EditInterface.initSliders = function(node)
{
    Y.log("Initializing Sliders", "debug");
    Y.all("input.yui3-slider").each(function(e){
        e.setStyle("display", "none");
        var min = parseFloat(e.getAttribute("min"));
        var max = parseFloat(e.getAttribute("max"));

        var slider = new Y.Slider({
            length : '150px',
            thumbImage : 'http://yui.yahooapis.com/3.3.0/build/slider/assets/skins/sam/thumb-x.png',
            min : 5
        });

        e.setAttribute("type", "hidden");
        var sliderNode = Y.Node.create('<div class="yui3-skin-sam"></div>');
        e.replace(sliderNode);
        e.removeClass("yui3-slider");
        sliderNode.append(e);
        slider.render(sliderNode);
        slider.on("valueChange", function(event){
            Y.log("New Value is " + event.newVal/100);
            e.set("value", event.newVal/100);
            e.simulate("change");
        });
    });
}

EditInterface.addColumnSliders = function(e)
{
    Y.use("multi-col-slider", function(Y) {

        e.all(".section").each(function(e, k) {
            Y.log("Adding column slider for section " + k, "info");
            var resizedNode = e;
            var slider = new Y.longtail.MultiColumnSlider({cloneNode: "#columnResizer", resizedNode: resizedNode, clone: true});
            slider.render();

            slider.on("colslider:resized", function(e)
            {
                var widgetId = resizedNode.get("id");
                var widths = e.widths;
                var total = widths[widths.length - 1];
                var prev = 0;
                for(var i = 0; i < widths.length; i++)
                {
                        var width = 100 * (widths[i] - prev)/total;
                        prev = widths[i];
                        var selector = resizedNode.get("children").item(i).get("id");
                        var css = {width: width + "%"};
                        Y.longtail.CSSUtils.applyCSS("#" + selector, css);
                        Y.longtail.SaveQueue.save('custom-styles',{node: selector, styles: css})
                }
            });

            slider.on("colslider:col-delete", function(e) {
                if (!confirm("This action cannot be undone. Do you want to proceed?"))
                {
                    return;
                }

                var uri = PageData.getServiceUrl("/page/delete"),
                    nodeToDelete = e.resizedNode,
                    widgetId = nodeToDelete.get("id"),
                    containerNode = nodeToDelete.get("parentNode"),
                    parentId = containerNode.get("parentNode").get("id");

                containerNode.remove();
                Y.log("Deleting " + widgetId);

                AjaxRequest(uri, {
                    'widgetId' : widgetId,
                    'parent' : parentId,
                    'path' : PageData.path
                }, false);
            });

            slider.on("colslider:col-change", function(e) {
                var switchedMode = "childs-" + e.value;
                var modes = ["childs-1", "childs-2", "childs-3", "childs-4", "childs-5"];
                for (var i; i < modes.length; i++) {
                   resizedNode.removeClass(modes[i]);
                }

                Y.log("Mode Switched to " + switchedMode);
                resizedNode.addClass(switchedMode);
                var widgetId = resizedNode.get("id");
                var uri = PageData.getServiceUrl("/page/columns");
                AjaxRequest(uri, {
                    'widgetId' : widgetId,
                    'columns': e.value,
                    'path' : PageData.path
                }, new WidgetHTMLInsert(resizedNode.get("parentNode"), null, {replace:true}));
            });

            slider.on("colslider:move-up", function(e) {
              Y.LUI.saveState('widget-styles-enabled');
              Y.LUI.disableState('widget-styles-enabled');

                var nodeToMove = e.resizedNode.get("parentNode");
                var previousNode = nodeToMove.previous();
                if (previousNode) {
                    var parentNode = nodeToMove.get("parentNode");

                    nodeToMove.remove();
                    parentNode.insertBefore(nodeToMove, previousNode);

                    // Saving changes
                    var index = parentNode.all("> .section-container").indexOf(nodeToMove);
                    var params = {
                            'parent': parentNode.get("id"),
                            'currentparent': parentNode.get("id"),
                            'position': index,
                            'path': PageData.path,
                            'widgetId': nodeToMove.one(".el-widget-instance").get("id")
                        };
                    var uri = PageData.getServiceUrl("/page/move");
                    AjaxRequest(uri, params, false);
                }

                Y.LUI.restoreState('widget-styles-enabled');
            });

            slider.on("colslider:move-down", function(e) {
              Y.LUI.saveState('widget-styles-enabled');
              Y.LUI.disableState('widget-styles-enabled');

                var nodeToMove = e.resizedNode.get("parentNode");
                var nextNode = nodeToMove.next();
                if (nextNode) {
                    var parentNode = nodeToMove.get("parentNode");

                    nextNode.remove();
                    parentNode.insertBefore(nextNode, nodeToMove);

                    // Saving changes
                    var index = parentNode.all("> .section-container").indexOf(nodeToMove);
                    var params = {
                            'parent': parentNode.get("id"),
                            'currentparent': parentNode.get("id"),
                            'position': index,
                            'path': PageData.path,
                            'widgetId': nodeToMove.one(".el-widget-instance").get("id")
                        };
                    var uri = PageData.getServiceUrl("/page/move");
                    AjaxRequest(uri, params, false);
                }

                Y.LUI.restoreState('widget-styles-enabled');
            });
        });
    });
}

EditInterface.addSectionButton = function(e)
{
    e.all(".content-area").each(function(e) {
        var appendSectionButton = Y.Node.create(
                '<input type="button" class="addSectionButton" title="Adds Row or Section that can be divided into 1-5 columns" value="Add Row"/>'
            );
        e.append(appendSectionButton);
    });
}

EditInterface.initImageGallery = function(e)
{
    e.all(".plugin-slideshow").each(function(e) {
        e.ss.stop();
    });
}

EditInterface.changeMode = function(mode)
{
    Y.log("Opening up Preview mode", "info");
    var html = L.HTML;
    if (mode == "edit")
    {
        EditInterface.setupEditMode();
        Y.one('#editCssLink').set("disabled", false);
        Y.all("preview-link").set("innerHTML", "Preview");
        html.removeClass("preview-mode");
        html.addClass("edit-mode");
    } else if(mode == "preview")
    {
       Y.one('#editCssLink').set("disabled",true);
       html.removeClass("edit-mode");
       html.addClass("preview-mode");
       EditInterface.setupPreviewMode();
    }
}

EditInterface.openItemBrowse = function(el, type, filters)
{
  var el = Y.one(el);
  var renderNode = el;
  var form = el.ancestor("form");

  if(form)
  {
    renderNode = form.one(".field-extension");
  }

  renderNode.set("innerHTML", "");
  var href = Y.Cookie.get(type + '_url');

  if(filters)
  {
     href = PageData.servicesBase + '/styles/browse/' + type + "?filters=" + filters;
  }else if(!href)
  {
     href = PageData.servicesBase + '/styles/browse/' + type;
  }

  Y.LUI.open("itembrowseroverlay", {type: type, href: href,
      node:el, headerContent: "Browsing " + type}, [renderNode]);
}

EditInterface.browseOptions = function(el, type)
{
    var el = Y.one(el);

    if(!el.hasClass("active"))
    {
        L.EDIT_BAR.all(".yui3-dropdown.active").removeClass("active");
    }
          
    el.toggleClass("active");
          
	if(el.hasClass("active"))
	{
		EditInterface.openItemBrowse(el, type);
	}else{
	    Y.LUI.closeAll('itembrowseroverlay');
	}
}

EditInterface.initEditTopBar = function(editBar)
{
    L.EDIT_BAR = editBar;
    
    var tabview = new Y.TabView({srcNode: L.EDIT_BAR.one(".editbar-tabs")});
    tabview.render();
    EditInterface.editTabs = tabview;
    
    extractAndMoveStyles(L.EDIT_BAR.all("style"));
    
    tabview.selectChild(Y.LUI.getBookmark('tab') || PageData.editbarTab);

    tabview.on('selectionChange', function(e){
    	var newVal = e.target.indexOf(e.newVal);
    	Y.LUI.bookmark({'tab':newVal});
    });

    tabview.previous = function()
    {
        var tabview = EditInterface.editTabs;
        var curTab = tabview.indexOf(tabview.get('selection'));
        var moveToTab = Math.max(curTab - 1, 0);
        Y.LUI.bookmark({ 'tab': moveToTab });
        return moveToTab;
    }

    tabview.next = function()
    {
        var tabview = EditInterface.editTabs;
        var curTab = tabview.indexOf(tabview.get('selection'));
        var moveToTab = Math.min(curTab + 1, tabview.size() - 1);
        Y.LUI.bookmark({ 'tab': moveToTab });
        return moveToTab;
    }
    
    tabview = new Y.TabView({srcNode: L.EDIT_BAR.one(".design-tabs")});
    tabview.render();
    
    EditInterface.initSpinners(L.EDIT_BAR);
    EditInterface.initColorPicker(L.EDIT_BAR);
    
    if(L.EDIT_BAR.one('.css-style-form')){
        L.EDIT_BAR.all(".css-style-form").on("change", Y.longtail.StyleSelector.onCssFormChange, Y.longtail.StyleSelector);
        L.EDIT_BAR.all(".css-style-form button").on("click", Y.longtail.StyleSelector.onAction, Y.longtail.StyleSelector);
    }
    
    if(L.EDIT_BAR.one('#themeGallery')){
        var themeBrowser = new Y.longtail.ItemBrowser({srcNode: "#themeGallery .theme-selection-overlay", href: null, bodyContent: null, "closeOnClickOutside": false});
        themeBrowser.render();
    }
    
    L.EDIT_BAR.delegate("click", function(e){
    	e.halt();
    	var node = e.currentTarget;
    	var cssText = node.ancestor(".swatch-container").one("style").get("textContent");
    	var uuid = node.getAttribute("data-uuid");
      	var type = 'quickstyles';
    	Y.fire('quickstyle:selected', {node: node, css: cssText, id: uuid, type: type});
    },".yui3-dropdown-item");
    
    Y.delegate("click", function(e) {
        var divId = e.currentTarget.one("a").getAttribute("href");
        Animatrix.flyInFromLeft(Y.all(divId + " .sample-widget," + divId + " .theme"))
      }, L.EDIT_BAR, ".editbar-tabs .yui3-tab");

    var trayDelegate = new Y.DD.Delegate({
        cont: L.EDIT_BAR,
        nodes: '.sample-widget'
    });

    trayDelegate.dd.plug(Y.Plugin.DDProxy, {moveOnEnd: false, cloneNode: true}).plug(Y.Plugin.DDWinScroll);

    var dropper = null;

    trayDelegate.on("drag:start", function(e) {
        var dragNode = e.target.get("dragNode");
        dragNode.addClass("yui3-dragging-sample");
        Y.one("body").append(dragNode);
        dropper = new Y.longtail.WidgetDropper({node: dragNode});
      });

    trayDelegate.on("drag:drag", function(e) {
        var dragNode = e.target.get("dragNode");
        dropper.updatePosition(dragNode.getXY());
      });

    trayDelegate.on("drag:end", function(e) {
        var dragNode = e.target.get("dragNode");
        dropper.onDrop();
        dropper.destroy();
        dropper = null;
      });

    if(Y.LUI.getBookmark('mode') != 'preview'){
    	EditInterface.changeMode('edit');
    }

    

    // EditInterface.editStyles("#canvas", "Canvas");
}

EditInterface.initInterfaceElements = function()
{
    Y.log("Loading Editbar", "info");
    var requestURL = PageData.servicesBase + "/editbar";
    var requestParams = window.location.search.substring(1).split("&");
    for (var p = 0; p < requestParams.length; p++)
    {
        if (requestParams[p].match("fp=") !== null) { requestURL += "?" + requestParams[p]; }
    }

    // Get editbar if not already there
    var topbar = Y.one("#topBar");
    if (topbar == null) {
        Y.log("Getting editbar", "info");
        AjaxRequest(requestURL, {}, function(responseText){
            topbar = Y.Node.create(responseText);
            L.BODY.prepend(topbar);
            EditInterface.initEditTopBar(topbar);
        }, "GET");
    }else{
        EditInterface.initEditTopBar(topbar);
    }
}

EditInterface.closeSitePublishMsg = function()
{
    Y.one("#user-publish-msg").setStyle("display", "none");
}

EditInterface.setupEditMode = function()
{
    var c_canvas = Y.one("#c_canvas");
    var canvasTopMargin = typeof(WIZARD_MODE) === "undefined" || WIZARD_MODE === false ? "220px" : "260px";
    c_canvas.setStyle("marginTop", "0px");
    c_canvas.transition({
        marginTop: canvasTopMargin, duration: 1
    }, function() {
        L.EDIT_BAR.setStyles({"opacity": 0, "display": "block"});
        L.EDIT_BAR.transition({opacity: 1.0, duration: 2});
        this.transition({marginLeft: "20px", marginRight: "20px"}, function(){this.addClass("ui-ready");});
    });
}

EditInterface.setupPreviewMode = function()
{
    L.EDIT_BAR.transition({opacity:0.0, duration: 1}, function() {
        L.EDIT_BAR.setStyle("display", "none");
    });

    var c_canvas = Y.one("#c_canvas");
    var canvasTopMargin = typeof(WIZARD_MODE) === "undefined" || WIZARD_MODE === false ? "220px" : "260px";
    c_canvas.setStyle("marginTop", canvasTopMargin);
    c_canvas.transition({
        marginTop: "0px" , duration: 1
    }, function() {
        this.transition({marginLeft: "0px", marginRight: "0px"}, function(){this.addClass("ui-ready");});
    });
}

EditInterface.navigateTo = function(e)
{
    e.halt();

    var target = e.currentTarget;
    var href = target.getAttribute("href").replace(PageData.navBase, "");
    var parent = target.ancestor("li");
    target.ancestor("ul").all("li.selected").removeClass("selected");
    parent.addClass("selected");

    var page = href;
    Y.log("Navigating to page :" + page, "info");
    PageData.setPage(page);
    Y.LUI.bookmark({'page':PageData.path.replace(/\//g,'')});
}

EditInterface.loadPage = function(uri)
{
    var pageNode = Y.one("#Content_Body");
    AjaxRequest(uri, { renderBare: 1 }, new WidgetHTMLInsert(pageNode, null, { animate: true, replace: false }), 'GET');
}

EditInterface.onAppendSection = function(e)
{
    var parentNode = e.currentTarget.ancestor(".content-area");
    var widgetId = parentNode.get("id");
    var sections = parentNode.all("> .section-container");
    var lastChildPos = sections.size();
    var lastChild = sections.item(lastChildPos - 1);
    var newWidgetNode = Y.Node.create("<div></div>");
    if (lastChild == null)
    {
        parentNode.prepend(newWidgetNode);
    }else
    {
        lastChild.insert(newWidgetNode, "after");
    }

    Y.log("Append a new section at " + lastChildPos, "info");

    var params = {
            'parent' : widgetId,
            'position' : lastChildPos,
            'widget' : "section",
            'path' : PageData.path
        };
    var uri = PageData.getServiceUrl("/page/add");
    AjaxRequest(uri, params, new WidgetHTMLInsert(newWidgetNode,  null, {replace: true}));
}

EditInterface.onClickAjaxUrl = function(e)
{
    e.halt();
    var uri = e.currentTarget.get("href");
    Y.log("Clicked an ajax-only-url " + uri, "info");
    AjaxRequest(uri, {}, true);
    return false;
}

EditInterface.changeTheme = function(themeName, el)
{
    Y.log("Changing Theme to " + themeName);
    var theme = Y.one('#themeStylesCss');
    var updateUri = PageData.servicesBase + "/page/theme?theme=" + themeName;
    AjaxRequest(updateUri, {}, function(txt){
        var json = Y.JSON.parse(txt);
        theme.set("textContent", json.themeStylesText);
        
        for(var i in json.userStyles)
        {
            if(json.userStyles.hasOwnProperty(i))
            {
                Y.longtail.CSSUtils.applyCSS(i, json.userStyles[i]);
            }
        }
    });
}

EditInterface.changeSiteLayout = function(siteLayoutName)
{
    Y.log("Changing Site Layout to " + siteLayoutName);
    var updateUri = PageData.servicesBase + "/page/layout?layout=" + siteLayoutName;
    AjaxRequest(updateUri, {}, true);

    // FIXME: Need to implement a better way to refresh the page after site layout change

}

EditInterface.createPage = function(e) {
    e.halt();

    do {
        var path = prompt("Provide the page path - /<path>/", "");
    } while (path != null && !path.match(/\/[a-z_-]*\//));

    if (path != null) {
        var uri = PageData.getServiceUrl("/page/create");
        var cfg = {
            method : 'GET',
            data : Stringify( {
                'path' : path
            }),
            on : {
                success : onSuccessReload
            }
        };
        AjaxRequest(uri, {'path' : path}, true);
    }

    return path;
}

EditInterface.deletePage = function()
{
    if (confirm("Are you sure you want to delete page, at \"" + PageData.path + "\"?")) {
        AjaxRequest(PageData.servicesBase + "/page/deletepage",
                {path : PageData.path}, false, 'POST');
    }
}

EditInterface.populatePagePath = function(form)
{
    form.path.value = "/" + form.name.value.toLowerCase().replace(/ /g, "-") + "/";
}

EditInterface.saveAndShare = function(selector)
{
    if(selector)
    {
        AjaxRequest(PageData.getServiceUrl("/styles/saveAndShareQuickStyle"),
                {selector : selector}, false, 'POST');
    }
}

EditInterface.editStyles = function(selector, displayStr)
{
  var type = EditInterface.elementType(selector);
  var form = Y.one(".css-style-form");

  for(var i = 0; i < ELEMENT_TYPES.length; i++)
  {
    form.removeClass(ELEMENT_TYPES[i]);
  }
  form.addClass(type);
  form.one(".selector-value").set("value", selector);

  // Enable image-properties and disable text-styles when image is selected, and visa-versa
  var selectHeader = form.one(".selected-widget");
  selectHeader.set("innerHTML", (displayStr ? displayStr : selector));
  selectHeader.setAttribute("target", selector);
  selectHeader.addClass("selected-widget-active");

  form.one(".selector-value").simulate("change");
}

EditInterface.siteSelectionOverlay = function(el)
{
    var SITE_SELECTORS = ['#canvas', ['#layoutArea', [['#header', ['#primaryNav']],
                                                      ['.content-area', ['.section', ['.column', ['.el-leaf-widget']]]]]]];
    var SITE_SELECTOR_LABELS = {'#canvas': 'Canvas', '#layoutArea': 'Page', '#header': 'Header', '#primaryNav': 'Navigation',
            '.content-area': 'Body', '.section': 'Row', '.column': 'Column', '.el-leaf-widget': 'Widget'};

    var printSiteSelectionTree = function(el, arr, index)
    {
        var html = '';

        if (index >= arr.length) { return html; }
        var sel = arr[index];

        if (typeof(sel) == 'object')
        {
            html += printSiteSelectionTree(el, sel, 0);
            html += printSiteSelectionTree(el, arr, index + 1);
            return html;
        }

        var selNode = el.one(sel);
        var numSiblings = !selNode ? 0 : selNode.siblings('.el-widget-instance').size();
        var selectedElement = Y.one(".selected-widget").getAttribute("target");

        el.all(sel).each(function(elm) {
            var elmId = '#' + elm.get("id"),
                liClass = sel == '.column' && numSiblings > 0 ? 'yui3-u-1-' + (numSiblings + 1) : 'yui3-u-1';

            if (selectedElement && selectedElement == elmId) {
                liClass += ' selected';
            }

            html += '<li class="' + liClass + '"><a onclick="EditInterface.selectWidget(\'' + elmId + '\')">'
                    + SITE_SELECTOR_LABELS[sel] + '</a>';
            if (sel == '#primaryNav')
            {
                html += '<ul class="yui3-g"><li class="yui3-u-1-3' + (selectedElement && selectedElement == '#primaryNav > li > a' ? ' selected' : '')
                        + '"><a onclick="EditInterface.selectWidget(\'#primaryNav > li > a\')">Link</a></li>'
                        + '<li class="yui3-u-2-3' + (selectedElement && selectedElement == '#primaryNav > li.selected > a' ? ' selected' : '')
                        + '"><a onclick="EditInterface.selectWidget(\'#primaryNav > li.selected > a\')">Selected Link</a></li></ul>';
            } else
            {
                html += printSiteSelectionTree(elm, arr, index + 1);
            }
            html += '</li>';
        });

        if (html != '') { html = '<ul class="yui3-g">' + html + '</ul>'; }

        return html;
    }

    var canvas = Y.one('#c_canvas'),
        selectionOverlayContainer = Y.one('#selectionOverlayContainer'),
        selectionTreeNode = null,
        selectionTreeHTML = '';

    // If selectionOverlayContainer is already open, close it and return
    if (selectionOverlayContainer.getStyle('display') == 'block')
    {
        selectionOverlayContainer.setStyle('display', 'none');
        return;
    }
    selectionTreeHTML = printSiteSelectionTree(canvas, SITE_SELECTORS, 0);
    selectionTreeNode = Y.Node.create(selectionTreeHTML);
    selectionTreeNode.set('id', 'selectionTree');
    selectionOverlayContainer.set('innerHTML', '');
    selectionOverlayContainer.append(selectionTreeNode);
    selectionOverlayContainer.setStyle('display', 'block');
}

function showUploadForm(e)
{
    Y.log("Showing Video Upload Form ", "info");
    if (this.visible)
    {
        return;
    }

    this.visible = true;

    var displayDiv = e.currentTarget.get("parentNode");

    var formHTML = '<form enctype="multipart/form-data"><input type="file" name="file"/>'
            + '<input type="hidden" name="token" value="${tokens.token}"/>'
            + '<input type="submit" class="uploadVideo" value="Upload Video File" onclick="return false"/></form>';

    var request = Y.io(PageData.getServiceUrl("/data/videoToken"), {sync: true});
    var tokens = Y.JSON.parse(request.responseText);

    formHTML = formHTML.replace("${tokens.token}", tokens.token);
    formObj = Y.Node.create(formHTML);
    displayDiv.append(formObj);

    formObj.one(".uploadVideo").on("click", function(e){
        var uri = tokens.url + "?nexturl=" + PageData.getServiceUrl("/data/ajax-proxy");
        var cfg = {
                method: 'POST',
                form: {
                    id: formObj,
                    upload: true
                },

                on : {
                    complete : function(id, o, args)
                    {
                            var editPath = displayDiv.getAttribute("editPath");
                            var response = Y.JSON.parse(o.responseText);
                            var value = response.id;
                            InlineContentEditor.saveValue(editPath, value);
                            alert("The video has been uploaded and depending on video size, might take upto 5 to 20 mins to be processed and appear on the site. Thanks for your patience.");

                            // FIXME : Just a simple refreshing of the widget, or re-embedding the video will work.
                            location.reload(false);
                        }
                }
        };

        Y.io(uri, cfg);
    });
}

function removejscssfile(filename, filetype){
    //determine element type to create nodelist from
    var targetelement = filetype == "js" ? "script" : filetype == "css" ? "link" : "none";
    //determine corresponding attribute to test for
    var targetattr = filetype == "js" ? "src" : filetype == "css" ? "href" : "none";
    var allsuspects = document.getElementsByTagName(targetelement);

    for (var i = allsuspects.length; i >= 0; i--) { //search backwards within nodelist for matching elements to remove
        if (allsuspects[i] && allsuspects[i].getAttribute(targetattr) != null
                && allsuspects[i].getAttribute(targetattr).indexOf(filename) != -1) {
            // remove element by calling parentNode.removeChild()
            allsuspects[i].parentNode.removeChild(allsuspects[i]);
        }
     }
}

EditInterface.initOverlays = function()
{
    Y.LUI.register("helpoverlay", Y.longtail.OverlayPanel, {
        href: '/overlays/help',
        headerContent: 'Quick Overview ' + CLOSE_BUTTON_TEMPLATE,
        srcElement: null,
        type: 'help',
        centered : true,
        showMask: true,
        closeOnClickOutside: true
      }, function() {
          this.render();
    });

    Y.LUI.register("guidedinterface", Y.longtail.OverlayPanel, {
        href: '/overlays/guided',
        headerContent: 'Guided Creation ' + CLOSE_BUTTON_TEMPLATE,
        srcElement: null,
        type: 'guide',
        centered : false,
        showMask: false,
        closeOnClickOutside: false
      }, function() {
          this.render();
    });

    Y.LUI.register("itembrowseroverlay", Y.longtail.ItemBrowser, {
        singleton : true,
        construct : true,
        closeOnClickOutside : false
      }, function(renderNode){
          renderNode ? this.render(renderNode) : this.render();
          this.on("loaded", function(){Y.fire("custom:cssInit",{node:renderNode});});
    });

    Y.LUI.register("updatepageoverlay", Y.longtail.OverlayPanel, {
        href: PageData.servicesBase + '/page/edit',
        headerContent: 'Updating Page ' + PageData.path + CLOSE_BUTTON_TEMPLATE,
        type: 'page',
        closeOnSubmit : false,
        iframe: true,
        closeOnClickOutside : false,
        showMask: true,
        modal : true
        }, function() {
          this.render();
    });

}
