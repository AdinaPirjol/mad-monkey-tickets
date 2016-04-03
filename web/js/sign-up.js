$(document).ready(function(){ 
    //wait until all the document loads
    $("#btn-signup").click(
        function(){
            var name = $('[name="name"]').val();
            var password = $('[name="password"]').val();
            var email = $('[name="email"]').val();
            var phone = $('[name="phone"]').val();
            var city = $('[name="city"]').val();
            
            $.ajax({
                type:"get", //http method
                url: "getCategoryNamesServlet", //servlet url
                data: {
                    "name": name,
                    "password": password,
                    "email": email,
                    "phone": phone,
                    "city": city
                },
                success:function(data){
                    if(data !== null) {
                        $.session.set("customer", data);
                        window.location.href = "index.jsp";
                    }
                }
            });
        }
    );
});


