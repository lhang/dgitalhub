EventUtil = {
  addHandler: function(element, type, handler){
    if (element.addEventListener){
      element.addEventListener(type, handler, false);
    }else if (element.attachEvenet){
      element.attachEvenet("on" + type, handler);
    }else {
      element["on" + type] = handler;
    }
  }
}

EventUtil.addHandler(document, "DOMContentLoaded", jdenticon);
EventUtil.addHandler(document, "DOMSubtreeModified", jdenticon);
