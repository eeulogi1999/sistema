document.addEventListener('DOMContentLoaded',function () {
    $('#set_procesar').click(function (e) { 
        e.preventDefault();
        fetch(base_url+'/Utilitarios/Inv24Jun')
        .then(response => response.json())
        .then(response => {
            
         })
         .catch(error => console.error('Error:', error));
        
    });
})