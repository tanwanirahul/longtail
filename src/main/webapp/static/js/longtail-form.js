YUI.add('longtail-form', function(Y) {
   
    var LongtailForms = Y.namespace("longtail.forms");
    
    Y.mix(LongtailForms, {
        
    	serialize: function(node) {
            var data = {};

            this.eachField(node, function(e, type, name, value){
            	if(value)
            	{
            		data[name] = value;
            	}
            });

            // Iterate over the form elements collection to construct the
            // label-value pairs.
            
            return data;
        },
        
        setFormValue : function(el, type, value, noChange)
        {
        	var valueChange = false;
        	if(type == "select-one" || type == "select-multiple")
        	{
        		var j, jl;
        		for (j = 0, jl = e.options.length; j < jl; ++j) 
        		{
        			var o = e.options[j];
        			var oVal = (o.attributes.value && o.attributes.value.specified ? o.value : o.text);
                    
        			if(value == oVal || (value + "").toLowerCase() == oVal.toLowerCase())
        			{
        				el.selectedIndex = j;
        				valueChange = true;
        				break;
        			}
                }
        	}else if(type == "radio" || type == "checkbox")
        	{
        		var checked = (el.value == value);
        		valueChange = (el.checked && !checked) || (!el.checked && checked);  
        		el.checked = checked;
        	}else if(type != "file"){
        		valueChange = el.value != value;
        		el.value = value;
        	}
        	
        	if(!noChange && valueChange)
        	{
        		Y.one(el).simulate("change");
        	}
        },
        
        setValues : function(formNode, fn, nochange)
        {
        	var self = this;
        	this.eachField(formNode, function(e, type, name, value){
        		
        		if(typeof(fn) == "function")
        		{
        			value = fn(name);
        		}else if(typeof(fn) == "object")
        		{
        			value = fn[name];
        		}else 
        		{
        			value = fn;
        		}
        		
        		if(typeof(value) != "undefined")
        		{
        			self.setFormValue(e, type, value, nochange);
        		}
        	});
        },
        
        getValue : function(e)
        {
        	var o, v;
        	
        	switch (e.type) {
            // Safari, Opera, FF all default options.value from .text if
            // value attribute not specified in markup
            case 'select-one':
                if (e.selectedIndex > -1) {
                    o = e.options[e.selectedIndex];
                    v = (o.attributes.value && o.attributes.value.specified ? o.value : o.text);
                }
                break;
            case 'select-multiple':
            	v = [];
                if (e.selectedIndex > -1) {
                	
                    for (j = e.selectedIndex, jl = e.options.length; j < jl; ++j) {
                        o = e.options[j];
                        if (o.selected) {
                          v.push((o.attributes.value && o.attributes.value.specified ? o.value : o.text));
                        }
                    }
                }
                break;
            case 'file':
            case undefined:
            case 'reset':
            case 'button':
            case 'submit':
            	v = null;
            	break;
            case 'radio':
            case 'checkbox':
            	v = e.checked ? e.value : null;
            	break;
            	
            default:	
            	v = e.value;
            }
        	
        	return v;
        },
        
        eachField : function(formNode, fn)
        {
        	var fNode = Y.one(formNode);
        	
        	if(fNode == null)
        	{
        		return;
        	}
        	
        	var f = Y.Node.getDOMNode(fNode);
        	if(f.elements)
        	{
	        	for (i = 0, il = f.elements.length; i < il; ++i) {
	                e = f.elements[i];
	                d = e.disabled;
	                n = e.name;
	                if (!d && e.type && e.type != "button" && e.type != "submit") {
	
	                	v = this.getValue(e);
	                    fn(e, e.type, n, v);
	                }
	            }
        	}

        },
        
        fileUpload : function(formNode, uri)
        {
            var form = Y.one(formNode);
            var cfg = {
                    method: 'POST',
                    form: {
                        id: form,
                        upload: true
                    },

                    on : {
                        complete : function(id, o, args)
                        {
                    		Y.fire("formSubmit", {form: form, response: o, type: 'image'});
                    	}
                    }};
            Y.io(uri, cfg);
        }
    }, true);

}, '3.2.0' ,{requires:['node-base','node-event-simulate']});
