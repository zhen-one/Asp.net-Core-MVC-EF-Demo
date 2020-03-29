
/**
 * ajax post提交  
 * @param url  
 * @param param  
 * @param datat 为html,json,text  
 * @param callback回调函数  
 * @return  
 */
function Get(url, param, datatype="json", callback) {
    $.ajax({
        type: "get",
        url: url,
        data: param,
        dataType: datatype,
        success: callback,
        error: function () {
            ClosetoastLoading();
            errorTip();
        }
    });
}

/**  
 * ajax post提交  
 * @param url  
 * @param param  
 * @param datat 为html,json,text  
 * @param callback回调函数  
 * @return  
 */
function Post(url, param, datatype = "json", callback) {
    $.ajax({
        type: "post",
        url: url,
        data: param,
        dataType: datatype,
        success: callback,
        error: function () {
            ClosetoastLoading();
            errorTip();
        }
    });
}