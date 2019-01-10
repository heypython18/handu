$(function(){
   // console.log("123")
    var user = getCookie("user");
    var pwd = getCookie("pwd");
  //  console.log(user);
     $("#inp1").val(user);
   $("#inp2").val(pwd);

    $(".btn").click(function(){
        //ajax
        console.log("1111")
        var xhr = new XMLHttpRequest();
        xhr.open("post", "http://localhost/handu/PHP/lander.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "username="+$("#inp1").val()  + "&pwd="+$("#inp2").val();
        xhr.send(str);
        xhr.onreadystatechange = function () {
            if (xhr.readyState==4 && xhr.status==200) {
                console.log(xhr.responseText);
                var obj = JSON.parse(xhr.responseText);
                if(obj.status ==1){
                  // 记住密码
                   // console.log($("#check").)
                    if($("#check")[0].checked){
                        alert("您已经选择了记住密码，下次可直接登陆");
                        var d = new Date();
                        d.setDate(d.getDate() + 30);
                        setCookie("user", $("#inp1").val(), d);
                        setCookie("pwd", $("#inp2").val(), d);
                    }
                    location.href="../html/handu Group.html"
                }
            }
        }
    })
    $(".btn").click(function(){
        //ajax
        //console.log("1111")
        var xhr = new XMLHttpRequest();
        xhr.open("post", "http://localhost/handu/PHP/lander2.php", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var str = "email="+$("#inp1").val()  + "&pwd="+$("#inp2").val();
        xhr.send(str);
        xhr.onreadystatechange = function () {

            if (xhr.readyState==4 && xhr.status==200) {
                console.log(xhr.responseText);
                var obj = JSON.parse(xhr.responseText);
                if(obj.status ==1){
                    //记住密码
                    if($("#check")[0].checked){
                        alert("您已经选择了记住密码，下次可直接登陆");
                        var d = new Date();
                        d.setDate(d.getDate()+30);
                        setCookie("user",$("#inp1").val(),d);
                        setCookie("pwd",$("#inp2").val(),d);
                    }
                    location.href="../html/handu Group.html";
                }
            }
        }
    })
    //验证码
    var verifyCode = new GVerify("v_container");

    document.getElementById("code_input").onblur = function(){
        var res = verifyCode.validate(document.getElementById("code_input").value);
        if(res){
            alert("验证正确");
        }else{
            alert("验证码错误");
        }
    }

})





