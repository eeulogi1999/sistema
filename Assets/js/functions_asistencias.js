var asi_table;
var calendar;
var url_asi = base_url+"/Asistencias/getAsistencias";
document.addEventListener('DOMContentLoaded',function () {
    divLoading.style.display = "flex";
    if (document.querySelector("#asi_table")) {
        asi_table = $('#asi_table').autoTable({
            "url": url_asi,
            "numerate": true,
            "thid": 'asi_id',
            "columns":[
                {"data":"asi_col_id.col_gpe_id.gpe_nombre",header:{t:"NOMBRE",c:'text'},tipo:'string'},
                {"data":"asi_col_id.col_gpe_id.gpe_apellidos",header:{t:"APELLIDOS",c:'text'},tipo:'string'},
                {"data":"asi_ndias",header:{t:"ASISTENCIAS"},tipo:'string'},
                {"data":"asi_nhoras",header:{t:"HORAS"},tipo:'string'},
                {"data":"asi_options",header:"ACCIONES",tipo:'string'}
            ]
        });
    }
    if (document.querySelector('#asi_col_id')) {
        $('#asi_col_id').loadOptions('colaboradores',['col_gpe_id.gpe_nombre','col_gpe_id.gpe_apellidos']);   
    }
    if (document.querySelector("#week")) {
        document.querySelector("#week").value  = data.asi.asi_week;
        $('#week').change(function (e) {
            e.preventDefault();
            var formData = new FormData();
            formData.append('asi_week',$('#week').val()); 
            fetch(base_url + '/Asistencias/changeWeek',{method: "POST",body: formData})
            .then(r => r.json())
            .then(r => {
                if (r.status) {
                    asi_table.reload();
                } else {
                    swal("Atencion","Error en el Proceso","error");
                }
            })
            .catch(e => console.error(e))
        })
    }
});
window.addEventListener('load', async () => {
    asi_table = await asi_table;
    divLoading.style.display = "none";
});
// $(function() {
//     $.contextMenu({
//         selector: '.context-menu-one', 
//         callback: function(key, options,info) {
//             switch (true) {
//                 case key == 'delete':
//                     console.log(key);
//                     console.log(options);
//                     console.log(info.event);
//                     break;
//                 default:
//                     break;
//             }
//         },
//         items: {
//             "edit": {name: "Edit", icon: "edit"},
//             "cut": {name: "Cut", icon: "cut"},
//            copy: {name: "Copy", icon: "copy"},
//             "paste": {name: "Paste", icon: "paste"},
//             "delete": {name: "Delete", icon: "delete"},
//             "sep1": "---------",
//             "quit": {name: "Quit", icon: function(){
//                 return 'context-menu-icon context-menu-icon-quit';
//             }}
//         }
//     });
//     $('.context-menu-one').on('click', function(e){
//         console.log('clicked', this);
//     })    
// });
async function importAsi() {
    var formData = new FormData();
    formData.append('asi_xls',$('#asi_xlsx')[0].files[0]); 
    fetch(base_url + '/Asistencias/importAsi',{method: "POST",body: formData})
    .then(r => r.json())
    .then(r => {
        if (r.status) {
            swal("Exito", r.msg , "success");
        } else {
            swal("Error", r.msg , "error");
        }
    })
    .catch(e => swal("Atención","Error en el proceso: "+e, "error"))

}
function viewAsi(asi_col_id) {
        $('#modal_asi').modal('show');
        setTimeout(() => {
            calendar = new FullCalendar.Calendar($('#calendar')[0],{
                timeZone: 'America/Lima',
                headerToolbar: {
                  left: 'prev,next today',
                  center: 'title',
                  right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                },
                initialView: 'timeGridWeek',
                height: 'auto',
                nowIndicator: true,
                initialDate: new Date(),
                navLinks: true,
                editable: true,
                selectable: true,
                //eventClassNames: ['context-menu-one'],
                eventSources: [base_url + '/Asistencias/getAsi/'+asi_col_id],
                select: async function(info) {
                    var asi = await set('asi',null,{asi_id:0,asi_col_id:asi_col_id,asi_horaE:info.startStr,asi_horaS:info.endStr},true);
                    if (asi.status) {
                        calendar.refetchEvents();
                        asi_table.reload();
                    }
                },
                eventDidMount: (info) =>{
                    info.el.addEventListener("contextmenu", async function(jsEvent){
                        jsEvent.preventDefault();
                        var asi = await del('asi',info.event.id,true);
                        if (asi.status) {
                            calendar.refetchEvents();
                            asi_table.reload();
                        }
                    })
                },
                eventResize: async function(info) {
                    var asi = await set('asi',null,{asi_id:info.event.id,asi_horaS:info.event.endStr},true);
                    if (asi.status) {
                        calendar.refetchEvents();
                        asi_table.reload();
                    }
                },
                eventDrop:async (info)=>{
                    var asi = await set('asi',null,{asi_id:info.event.id,asi_horaE:info.event.startStr,asi_horaS:info.event.endStr},true);
                    if (asi.status) {
                        calendar.refetchEvents();
                        asi_table.reload();
                    }
                }

              });
              calendar.render();  
        }, 220);
}
function viewHex(asi_col_id) {
    $('#modal_asi').modal('show');
    setTimeout(() => {
        calendar = new FullCalendar.Calendar($('#calendar')[0],{
            timeZone: 'America/Lima',
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
            },
            initialView: 'timeGridWeek',
            height: 'auto',
            nowIndicator: true,
            initialDate: new Date(),
            navLinks: true,
            editable: true,
            selectable: true,
            //eventClassNames: ['context-menu-one'],
            eventSources: [base_url + '/Asistencias/getHex/'+asi_col_id],
            select: async function(info) {
                var asi = await set('asi',null,{asi_id:0,asi_ext:1,asi_col_id:asi_col_id,asi_horaE:info.startStr,asi_horaS:info.endStr},true);
                if (asi.status) {
                    calendar.refetchEvents();
                }
            },
            eventDidMount: (info) =>{
                info.el.addEventListener("contextmenu", async function(jsEvent){
                    jsEvent.preventDefault();
                    var asi = await del('asi',info.event.id,true);
                    if (asi.status) {
                        calendar.refetchEvents();
                    }
                })
            },
            eventResize: async function(info) {
                var asi = await set('asi',null,{asi_id:info.event.id,asi_horaS:info.event.endStr},true);
                if (asi.status) {
                    calendar.refetchEvents();
                }
            },
            eventDrop:async (info)=>{
                var asi = await set('asi',null,{asi_id:info.event.id,asi_horaE:info.event.startStr,asi_horaS:info.event.endStr},true);
                if (asi.status) {
                    calendar.refetchEvents();
                }
            }

          });
          calendar.render();  
    }, 220);
}

function openAsi() {
    document.querySelector("form").reset();
    $('#modal_asi2').modal('show');
}

function setAsi(e) {
    e.preventDefault()
    const formData = new FormData(e.target)
    fetch(base_url + '/Asistencias/setAsistencias',{method: "POST",body: formData})
            .then(r => r.json())
            .then(r => {
                if (r.status) {
                    asi_table.reload();
                    e.target.reset();
                    swal('Atencion',r.msg,'success')
                } else {
                    swal("Atencion","Error en el Proceso","error");
                }
                $('#modal_asi2').modal('hide');
            })
            .catch(e => swal("Atención","Error en el proceso: "+e, "error"))
}