async function buscards() {
    let url = document.getElementById("url");
    var form = new FormData();
    form.append('url',url);
    var res = await fetch(base_url + '/Rlegal/bot', {method: "POST",body: form})
    .then(response => response.json())
    .then(arrdata => {return arrdata})
    .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    for (const i in res) {
        // console.log(i);
        // console.log(res[i]);

        // var anchor = document.createElement('a');
        // anchor.href = res[i];
        // anchor.target = '_blank';
        // anchor.download = i; 
        // anchor.click();

        let blob = await fetch(res[i]).then(r => r.blob());
        let file = new File([blob],i); 
        // var formd = new FormData();
        // formd.append('file',file);
        // formd.append('name',i);
        // fetch(base_url + '/Rlegal/download', {method: "POST",body: formd})
        // .then(response => response.json())
        // .then(arrdata => {console.log('ok')})
        // .catch(error => console.log(error))  
    }
}