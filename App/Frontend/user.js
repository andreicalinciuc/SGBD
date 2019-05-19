function request(){
    if (arguments.length == 2 || arguments.length == 3){
        target_method = arguments[0];
        target_url = arguments[1];
        
        const Http = new XMLHttpRequest();
        const url = target_url;

        Http.open(target_method, url);

        Http.onreadystatechange=(e)=>{
            if(Http.readyState === 4){
                if(Http.status === 200) {
                    if(Http.responseText !== ""){
                        console_out = document.getElementById("output-console");
                        console_out.value = Http.responseText + console_out.value;
                    }
                }
                else{
                    console.log("Http.status" + Http.status);
                    console.log("Http.responseText" + Http.responseText);
                }
            }
        };

        if (arguments.length == 3){
            target_parameters = arguments[2];
            Http.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
            Http.send(JSON.stringify(target_parameters));
        }
        else{
            Http.send();
        }
        
        return true;
    }
    return false;
}

function get_user_data(){
    request('GET',
    'http://localhost:5000/get_user_data/' +
    parseInt(document.getElementById("id_user_input").value)
    );
}

function trasee_active(){
    request('GET',
    'http://localhost:5000/get_active_routes'
    );
}

function statiile_cursei(){
    request('GET',
    'http://localhost:5000/get_traseu_cursa/' +
    parseInt(document.getElementById("id_cursa_input").value)
    );
}

function clientii_cursei(){
    request('GET',
    'http://localhost:5000/get_clienti_in_cursa/' +
    parseInt(document.getElementById("id_cursa_input").value)
    );
}

function urca_in_cursa(){
    request('POST',
    'http://localhost:5000/procedure/PassagerIn',
    [parseInt(document.getElementById("id_user_input").value), parseInt(document.getElementById("id_cursa_input").value)]
    );
}

function coboara_din_cursa(){
    request('POST',
    'http://localhost:5000/procedure/PassagerOut',
    [parseInt(document.getElementById("id_user_input").value)]
    );
}

function cea_mai_rapida_cursa(){
    request('GET',
    'http://localhost:5000/get_fastest_ride/' +
    parseInt(document.getElementById("id_node_from_input").value) +
    "," +
    parseInt(document.getElementById("id_node_to_input").value)
    );
}