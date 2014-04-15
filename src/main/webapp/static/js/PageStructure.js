var Widget = function(node)
{
	this.node = Y.one(node);
}

Widget.prototype.refresh = function()
{
    var url = PageData.getServiceUrl("/page/render");
    var params = {w : this.getWidgetId()};
    var self = this;
    var container = this._container();

    AjaxRequest(url, params, function(o){
        var callback = new WidgetHTMLInsert(container);
        callback(o);
        self.node = container.one("> .widget");
    });
}

Widget.prototype._container = function()
{
    return this.node;
}

Widget.prototype.getWidgetId = function()
{
    return this.node.get("id");
}

Widget.prototype.destroy = function()
{
    var widgetContainer = this._container();
    var column = widgetContainer.ancestor(".column");
    widgetContainer.remove();
    
    if(column && column.one(".el-widget-instance") == null)
    {
    	column.addClass("empty");
    	column.append(EMPTY_WIDGET_TEMPLATE);
    }
    
    // FIXME : Destroying the node removes event handlers and was causing Errors on Drag.
    // This can lead to memory leak if the handlers etc aren't destroyed.
    // widgetContainer.destroy();
}

Widget.prototype.onDeleteWidget = function(e)
{
    if (!confirm("Are you sure you want to delete this?"))
    {
        return false;
    }

    var uri = PageData.getServiceUrl("/page/delete"),
        widgetId = this.node.get("id"),
        parentId = this.node.get("parentNode").get("id");
    this.destroy();

    AjaxRequest(uri, {
        'widgetId' : widgetId,
        'parent' : parentId,
        'path' : PageData.path
    }, false);
    
    return true;
}
