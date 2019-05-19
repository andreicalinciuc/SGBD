function request(){
    target_url = null;
    if (arguments.length >= 2){
        target_method = arguments[0];
        target_url = arguments[1];
        parameters = Array(arguments).slice(2);
        const Http = new XMLHttpRequest();
        const url = target_url;
        Http.open(target_method, url);
        Http.send();
        Http.onreadystatechange=(e)=>{
            if(Http.readyState === 4){
                if(Http.status === 200) {
                    console_out = document.getElementById("output-console");
                    console_out.innerHTML = console_out.innerHTML + Http.responseText;
                }
                else 
                    console.log("Error occured! Failed to get data.");
            }
        };
        return true;
    }
    return false;
}