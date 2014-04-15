YUI.add('longtail-ui-manager', function(Y) {

  function UIManager(config) {
      UIManager.superclass.constructor.apply(this, arguments);
  };

  UIManager.NAME = "longtail-overlay";

  UIManager.ATTRS = {
      panelRegistry : {value:{}}
  };

  var openWidgets = {};
  var uiState = {};

  Y.extend(UIManager, Y.Base, {

      initializer : function()
      {
          var history = new Y.HistoryHash();
          this.set('history', history);
          Y.on('history:change', function (e) {
              var changed = e.changed, removed = e.removed;

              if (changed.tab) {
                  EditInterface.editTabs.selectChild(parseInt(changed.tab.newVal));
              }

              if (changed.page) {
                  pageRelativeUrl = changed.page.newVal == '' ? '/' : '/' + changed.page.newVal + '/';
                  EditInterface.loadPage(PageData.navBase + pageRelativeUrl);
                  PageData.setPage(pageRelativeUrl);
              }
              
              if (changed.mode) {
            	  EditInterface.changeMode(changed.mode.newVal);
              }
          });
      },

      hasState : function(state)
      {
          return L.BODY.hasClass(state);
      },

      enableState : function(state)
      {
          L.BODY.addClass(state);
      },

      disableState : function(state)
      {
          L.BODY.removeClass(state);
      },

      saveState : function(state)
      {
          uiState[state] = L.BODY.hasClass(state);
      },

      clearSaveState : function(state)
      {
          uiState[state] = null;
      },

      bookmark : function(state)
      {
          this.get('history').add(state);
      },

      getBookmark : function(name)
      {
          return this.get('history').get(name);
      },

      restoreState : function(state)
      {
          var canvas = Y.one("body");

          if(typeof(uiState[state]) != "undefined" && uiState[state] != null)
          {
              uiState[state] ? this.enableState(state) : this.disableState(state);
              this.clearSaveState(state);
          }
      },

      register : function(name, constructor, cfg, callback)
      {
          openWidgets[name] = [];
          this.get("panelRegistry")[name] = {name: name, cfg: cfg, callback: callback, constructor:constructor};
      },

      unregister : function(name)
      {
          this.get("panelRegistry")[name] = null;
      },

      closeAll: function(name)
      {
          if (name && openWidgets[name] && openWidgets[name].length)
          {
              for (var i = 0; i< openWidgets[name].length; i++)
              {
                openWidgets[name][i].destroy();
              }

              openWidgets[name] = [];
          }
      },

      open : function(name, cfg, args)
      {
          var r = this.get("panelRegistry")[name];
          var cfg = Y.merge(r.cfg, cfg, true);
          var widget = null;

          if (r.cfg.singleton && r.cfg.construct)
          {
              this.closeAll(name);
          }

          if (r.cfg.singleton && openWidgets[name].length)
          {
              widget = openWidgets[name][0];
              widget.setAttrs(cfg);
          }else
          {
              widget = new r.constructor(cfg);
              openWidgets[name].push(widget);
          }

          Y.log("Opening " + name + " : " + cfg, "debug");
          if(r.callback)
          {
              r.callback.apply(widget, args);
          }

          widget.on("destroy", Y.bind(this.remove,this, [name, widget, cfg]));
          this.fire("open:" + name);
      },

      remove : function(args)
      {
          var name = args[0], widget = args[1], cfg = args[2], wList = openWidgets[name];

          for (var i in wList)
          {
              if (wList.hasOwnProperty(i) && wList[i] == widget)
              {
                  if (i < wList.length - 2)
                  {
                      wList[i] = wList[wList.length - 1]
                      wList[wList.length - 1] = null;
                      wList.length = wList.length - 1;
                  }else
                  {
                      wList[wList.length - 1] = null;
                      wList.length = wList.length - 1;
                  }
                  break;
              }
          }
          /*
           * FIXME: HACK for removing class "active" from style property
           * on close of its "itembrowseroverlay" panel
           */
          if (name == "itembrowseroverlay") {
              Y.all(".css-style-form .yui3-dropdown.active").each(function(el){
                  if (el.getAttribute("data-type") === args[2].type) {
                      el.removeClass("active");
                  }
              });
          }

          this.fire("closed:" + name);
      }
    });

    Y.LUI = new UIManager();
    Y.LUI._openWidgets = openWidgets;

}, "3.1.0", {requires: ["base", "node", "event-delegate", "history"]});
