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
                    console.log("Http.status: " + Http.status);
                    console.log("Http.responseText: " + Http.responseText);
                }
            }
        };

        // Http.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        
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

function sanitizeString(str){
    str = str.replace(/[^a-z0-9áéíóúñü \.,_-]/gim,"");
    return str.trim();
}

function adauga_statie(){
    request('POST',
    'http://localhost:5000/procedure/AddStation',
    [
        sanitizeString(document.getElementById("statie_nume_input").value),
        sanitizeString(document.getElementById("statie_oras_input").value)
    ]
    );
}

function adauga_vehicul(){
    request('POST',
    'http://localhost:5000/procedure/AddVehicle',
    [
        parseInt(document.getElementById("vehicul_capacitate_input").value),
        parseInt(document.getElementById("vehicul_stare_input").value),
        parseInt(document.getElementById("vehicul_id_depou_input").value)
    ]
    );
}

function adauga_traseu(){
    request('POST',
    'http://localhost:5000/procedure/AddTraseu',
    [
        parseInt(document.getElementById("traseu_numar_input").value),
        parseInt(document.getElementById("traseu_from_statie_input").value),
        parseInt(document.getElementById("traseu_to_statie_input").value)
    ]
    );
}

function lanseaza_cursa(){
    request('POST',
    'http://localhost:5000/procedure/StartCursa',
    [
        parseInt(document.getElementById("cursa_id_vehicul_input").value),
        parseInt(document.getElementById("cursa_id_sofer_input").value),
        parseInt(document.getElementById("cursa_id_traseu_input").value)
    ]
    );
}

function adauga_sofer(){
    request('POST',
    'http://localhost:5000/procedure/AddDriver',[
        sanitizeString(document.getElementById("sofer_nume_input").value),
        sanitizeString(document.getElementById("sofer_prenume_input").value),
        sanitizeString(document.getElementById("sofer_telefon_input").value),
        sanitizeString(document.getElementById("sofer_cnp_input").value)
    ]
    );
}
