$(document).ready(function(){ 
    //wait until all the document loads
    $("#category-name").hover(
        function(){
            $.ajax({
                type:"get", //http method
                url: "getCategoryNamesServlet", //servlet url
                data:"category=", //parameter for servlet
                success:function(data){
                    $('#category-name').find('option').remove();
                    $.each(data,function(key, value) 
                    {
                        $("#category-name").append('<option value=' + key + '>' + value + '</option>');
                    });
                }
            });
        }
    );
});


