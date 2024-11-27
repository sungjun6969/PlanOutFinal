window.addEventListener("load", ()=>{
    document.getElementById("signup_button");
    
    signup_button.addEventListener("click", e => {
        signup();
    });

    document.getElementById("userid_check_async").addEventListener("click", e =>{
        const userid = document.querySelector("input[name='userid']").value;
        const xhr = new XMLHttpRequest();
        xhr.open("GET", `userid_check/${userid}`, true);

        xhr.onreadystatechange = () => {
            if(xhr.readyState === xhr.DONE) {
                if(xhr.status == 200) {
                    if(xhr.responseText === "OK") {
                        alert("사용가능한 계정 입니다.");
                        userid_check = true;
                    } else
                    alert("사용불가합니다. 정보를 다시 입력해주세요");
                }
            }
        };

        xhr.send();
    });

    

    document.querySelector("input[name='userid']").addEventListener("change", e => {
        console.log(e.target.value);
        userid_check = false;
    });

    document.querySelectorAll(".password").forEach(div =>{
        const input = div.querySelector("input[type = 'password']");
        const view = div.querySelector(".view");

        view.addEventListener("mousedown", e => {
         input.setAttribute("type","text");
        });

        view.addEventListener("mouseup", e => {
            input.setAttribute("type","password");
           });
    });
});