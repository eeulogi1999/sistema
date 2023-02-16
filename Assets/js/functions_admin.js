// (function () {
// 	"use strict";
// 	var treeviewMenu = $('.app-menu');
// 	// Toggle Sidebar
// 	$('[data-toggle="sidebar"]').click(function(event) {
// 		event.preventDefault();
// 		$('.app').toggleClass('sidenav-toggled');
// 	});
// 	// Activate sidebar treeview toggle
// 	$("[data-toggle='treeview']").click(function(event) {
// 		event.preventDefault();
// 		if(!$(this).parent().hasClass('is-expanded')) {
// 			treeviewMenu.find("[data-toggle='treeview']").parent().removeClass('is-expanded');
// 		}
// 		$(this).parent().toggleClass('is-expanded');
// 	});
// 	// Set initial active toggle
// 	$("[data-toggle='treeview.'].is-expanded").parent().toggleClass('is-expanded');
// 	//Activate bootstrip tooltips
// 	$("[data-toggle='tooltip']").tooltip();
// })();

document.addEventListener('DOMContentLoaded',function () {
    $('.modal').on('show.bs.modal', function (e) {
        var idx = $('.modal:visible').length;
        $(this).css('z-index', 1040 + (10 * idx));
    });
    $('.modal').on('shown.bs.modal', function (e) {
        var idx = ($('.modal:visible').length) - 1;
        $('.modal-backdrop').not('.stacked').css('z-index', 1039 + (10 * idx));
        $('.modal-backdrop').not('.stacked').addClass('stacked');
    });
    $(".treeview-menu").addClass('bg-'+cid);
    $(".app-menu__item.active,.app-menu__item:hover,.app-menu__item:focus").css('border-left-color',''+bg[cid]);
    $(".treeview.is-expanded [data-toggle='treeview']").css('border-left-color',''+bg[cid]);
    fetch(base_url + '/Main/setNav')
    .then(r => r.json())
    .then(r => {
        document.querySelector("[tree='"+r.tree+"']").style.backgroundColor = 'black';
        document.querySelector("[tree='"+r.tree+"']").parentElement.parentElement.classList.add('open'); 
        document.querySelector("[tree='"+r.tree+"']").parentElement.style.paddingLeft = '10px';
        if (r.tree.toString().split('.').length>2) {
            document.querySelector("[tree='"+r.tree+"']").parentElement.parentElement.parentElement.parentElement.classList.add('open');
            document.querySelector("[tree='"+r.tree+"']").parentElement.parentElement.parentElement.style.paddingLeft = '10px';
            document.querySelector("[tree='"+r.tree+"']").parentElement.parentElement.style.backgroundColor = '#212529';
        }
    })
    .catch(error => swal("Atención", "Error en el proceso: " + error, "error"))
    var tree = document.querySelectorAll('ul.tree a:not(:last-child)');
    for(var i = 0; i < tree.length; i++){
        tree[i].addEventListener('click', function(e) {
            var parent = e.target.parentElement;
            var classList = parent.classList;
            if (e.target.tagName =='SPAN'||e.target.tagName =='I') {
                var classList = parent.parentElement.classList;
            }
            if(classList.contains("open")) {
                classList.remove('open');
                var opensubs = parent.querySelectorAll(':scope .open');
                for(var i = 0; i < opensubs.length; i++){
                    opensubs[i].classList.remove('open');
                }
            } else {
                classList.add('open');
                if (e.target.tagName =='SPAN'||e.target.tagName =='I') {
                    e.target.parentElement.nextElementSibling.style.paddingLeft = '10px';
                }else{
                    e.target.nextElementSibling.style.paddingLeft = '10px';
                }
            }
        });
    }
    var tre_a = document.querySelectorAll('ul.tree a:last-child');
    for (let i = 0; i < tre_a.length; i++) {
        tre_a[i].addEventListener('click', function(e) {
            var formData = new FormData();
            if (e.target.tagName =='SPAN'||e.target.tagName =='I') {
                formData.append('tree',e.target.parentElement.parentElement.getAttribute('tree'));
            }else{
                formData.append('tree',e.target.parentElement.getAttribute('tree'));
            }
            fetch(base_url + '/Main/setNav',{method: "POST",body: formData})
        })
    }
});
(function() {
    /**
     * Ajuste decimal de un número.
     *
     * @param {String}  type  El tipo de ajuste.
     * @param {Number}  value El número.
     * @param {Integer} exp   El exponente (El logaritmo de ajuste en base 10).
     * @returns {Number} El valor ajustado.
     */
    function decimalAdjust(type, value, exp) {
      if (typeof exp === 'undefined' || +exp === 0) {
        return Math[type](value);
      }
      value = +value;
      exp = +exp;
      if (isNaN(value) || !(typeof exp === 'number' && exp % 1 === 0)) {
        return NaN;
      }
      value = value.toString().split('e');
      value = Math[type](+(value[0] + 'e' + (value[1] ? (+value[1] - exp) : -exp)));
      value = value.toString().split('e');
      return +(value[0] + 'e' + (value[1] ? (+value[1] + exp) : exp));
    }
    if (!Math.round10) {
      Math.round10 = function(value, exp) {
        return decimalAdjust('round', value, exp);
      };
    }
    if (!Math.floor10) {
      Math.floor10 = function(value, exp) {
        return decimalAdjust('floor', value, exp);
      };
    }
    if (!Math.ceil10) {
      Math.ceil10 = function(value, exp) {
        return decimalAdjust('ceil', value, exp);
      };
    }
  })();
function controlTag(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true; 
    else if (tecla==0||tecla==9)  return true;
    patron =/[0-9\s]/;
    n = String.fromCharCode(tecla);
    return patron.test(n); 
}
function testText(txtString){
    var stringText = new RegExp(/^[a-zA-ZÑñÁáÉéÍíÓóÚúÜü\s]+$/);
    if(stringText.test(txtString)){
        return true;
    }else{
        return false;
    }
}
function testEntero(intCant){
    var intCantidad = new RegExp(/^([0-9])*$/);
    if(intCantidad.test(intCant)){
        return true;
    }else{
        return false;
    }
}
function capitalize(word) {
    let lower = word.toLowerCase();
    return word.charAt(0).toUpperCase() + lower.slice(1);
}
function isUndefined(obj) {
    return typeof obj === 'undefined';
}
function isNull(obj) {
    return typeof obj === 'null';
}
function fntEmailValidate(email){
    var stringEmail = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})$/);
    if (stringEmail.test(email) == false){
        return false;
    }else{
        return true;
    }
}
function fntValidText(){
	let validText = document.querySelectorAll(".validText");
    validText.forEach(function(validText) {
        validText.addEventListener('keyup', function(){
			let inputValue = this.value;
			if(!testText(inputValue)){
				this.classList.add('is-invalid');
			}else{
				this.classList.remove('is-invalid');
			}				
		});
	});
}
function fntValidNumber(){
	let validNumber = document.querySelectorAll(".validNumber");
    validNumber.forEach(function(validNumber) {
        validNumber.addEventListener('keyup', function(){
			let inputValue = this.value;
			if(!testEntero(inputValue)){
				this.classList.add('is-invalid');
			}else{
				this.classList.remove('is-invalid');
			}				
		});
	});
}
function dragover(ev) {
    ev.preventDefault();
} 
function dragstart(ev) {
    ev.dataTransfer.setData("src", ev.target.src);
}
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("src");
    var img = document.querySelector("img[src='"+data+"']");
    if (!img.getAttribute('data')) {
        URL.revokeObjectURL(img.src);
    }
    img.remove();
}
function fntValidEmail(){
	let validEmail = document.querySelectorAll(".validEmail");
    validEmail.forEach(function(validEmail) {
        validEmail.addEventListener('keyup', function(){
			let inputValue = this.value;
			if(!fntEmailValidate(inputValue)){
				this.classList.add('is-invalid');
			}else{
				this.classList.remove('is-invalid');
			}				
		});
	});
}
function previewFiles(th,content) {
    function readAndPreview(file) {
      if (file.type == 'image/jpeg' || file.type == 'image/jpg' || file.type == 'image/png') {
        let src = URL.createObjectURL(file);
          var image = new Image();
          image.height = 100;
          image.className = "rounded border m-1";
          image.title = file.name;
          image.src = src;
          image.draggable="true";
          image.setAttribute('data','');
          image.setAttribute('ondragstart',"dragstart(event)");
          $('#'+content).append(image);
      }
    }
    if (th.files) {
      [].forEach.call(th.files, readAndPreview);
    }
}
(function( $ ){
    $.fn.valfinder = function(value) {
        var value = value.toLowerCase();
        var select = this;
        $($(this).children()).filter(function () {
            if ($(this).text().toLowerCase().indexOf(value) > -1) {
                $(select).val($(this).attr('value'))
            }
        });
    };
    $.fn.loadOptions = async function(tabla,descripcion,where='') {
        var inpt = this;
        var formData = new FormData();
        formData.append('id',$(this).attr('id'));
        formData.append('tabla',tabla);
        formData.append('descripcion',JSON.stringify(descripcion));
        formData.append('where',JSON.stringify(where));
        await fetch(base_url+'/Main/getSelect',{method: "POST",body: formData})
        .then(response => response.text()) 
        .then(response => {
            response = '<option value="" disabled selected>'+capitalize(tabla)+'</option>'+response;
            $(inpt).html(response);
            //$(inpt).selectpicker('render');
        })
        .catch(error => swal("Atención","Error en el proceso: "+error, "error"))
    }; 

    $.fn.autoTable = async function(o) { 
        var table = $(this);
        var thead = null;
        var tbody = null;
        var tfoot = null;
        var o = o;
        o.tf = {};
        var numerate = o.numerate;
        if (o.src != undefined) {
            o.data = window[o.src];
        }
        if (o.url != undefined) {
            o.data = await fetch(o.url)
            .then(r => r.json())
            .then(r => {return r})
            .catch(e => swal("Atención","Error en el proceso: "+e, "error"))
        }
        var constructor = function () {
            if (typeof o.export == 'undefined') {
            $(table).parent().parent().prepend('<div class="btn-group float-left">'
            +'<button class="btn btn-secondary" onclick="'+$(table).attr('id')+'.reload(); "><i class="fas fa-sync"></i></button>'
            +'<button class="btn btn-secondary" onclick="'+$(table).attr('id')+'.fullScreen(); "><i class="material-icons">fullscreen</i></button>'
            +'<button class="btn btn-secondary" onclick="'+$(table).attr('id')+'.toExcel(); "><i class="fas fa-download"></i></button>'
            +'</div>')
            }
            $(table).append('<thead class="bg-dark-lite sticky-top"><tr style="display:none;"></tr><tr></tr></thead>');
            $(table).append('<tbody></tbody>');
            $(table).append('<tfoot class="bg-dark-lite sticky-bottom"><tr></tr></tfoot>');
            thead = $(table).children('thead');
            tbody = $(table).children('tbody')[0];
            tfoot = $(table).children('tfoot');
            var nh = 0;
            for (const i in o.columns) {
                if (typeof o.columns[i].head === 'object') {
                    nh = o.columns[i].head.colspan;
                    $(thead).children('tr').eq(0).append('<th class="text-center" colspan="'+o.columns[i].head.colspan+'">'+o.columns[i].head.t+'</th>')
                    $(thead).children('tr').eq(0).attr('style','display: table-row;')
                }else{
                    nh -= 1;
                    if (nh <= 0) {
                        $(thead).children('tr').eq(0).append('<th></th>')
                    }
                }
                if (typeof o.columns[i].header === 'object') {
                    var ne = o.columns[i].data.split('.');
                    var ix = ne[ne.length-1];
                    let style = '';
                    if (typeof o.columns[i].header === 'object') {
                        if (typeof o.columns[i].header.style != 'undefined') {
                            if (typeof o.columns[i].header.style.miw != 'undefined') {
                                style += o.columns[i].header.style.miw;
                            }
                        }
                    }
                    if ( typeof o.columns[i].header.c!= 'undefined') {
                        switch (o.columns[i].header.c) {
                            case 'text':
                                var input = $(thead).children('tr').eq(1).append('<th><div class="text-center">'+o.columns[i].header.t+'</div><input type="text" id="t_'+ix+'" class="form-control"></th>');
                                $('#t_'+ix)[0].addEventListener('input', textFilter);
                                break;
                            case 'select':
                                $(thead).children('tr').eq(1).append('<th><div class="text-center">'+o.columns[i].header.t+'</div><select class="form-control"><option value="0">1</option></select></th>');
                                break;
                            case 'date':
                                $(thead).children('tr').eq(1).append('<th><div class="text-center">'+o.columns[i].header.t+'</div><input type="date" class="form-control"></th>');
                                break;
                            default:
    
                                break;
                        }
                    }else{
                        $(thead).children('tr').eq(1).append('<th><div class="text-center"> '+o.columns[i].header.t+'</div></th>');  
                    }

                }else{
                    $(thead).children('tr').eq(1).append('<th><div class="text-center"> '+o.columns[i].header+'</div></th>');
                }
            }
            if (numerate) {
                $(thead).children('tr').eq(1).prepend('<th>N°</th>');
                $(thead).children('tr').eq(0).prepend('<th></th>')
            }
            draw();
            zise();
            listenTree();
            window.addEventListener('resize',function(){zise()});
        };
        var draw = async function(){
            $(tbody).html('');
            o.tf = {};
            if (Object.keys(o.data).length>0) {
                var ly = 1;
                for (const i in o.data) {
                    const r = o.data[i];
                    var tr = tbody.insertRow(-1);
                    if (typeof o.xfun != 'undefined') {
                        if (typeof o.xfun.minzero != 'undefined') {
                            if (r[o.xfun.minzero.col]<0.5) {
                                continue;
                            }
                        }
                    }
                    if (o.tree) {
                        table[0].classList.add('tree');
                        let wy = o.thid.split('_');
                        tr.setAttribute("tree",''+r[wy[wy.length-2]+'_'+wy[wy.length-2]+'_'+wy[wy.length-1]]);
                    }
                    if (numerate) {
                        tr.insertCell(-1).innerHTML = ly++;
                    }
                    if (typeof o.thid != 'undefined') {
                        tr.setAttribute("id",''+r[o.thid]);
                    }
                    for (const j in o.columns) {
                        var cell = tr.insertCell(-1);
                        var ne = o.columns[j].data.split('.');
                        var ix = ne[ne.length-1];
                        var d = r;
                        for (let n = 0; n < ne.length; n++) { 
                            if (d != null) {
                                d = d[ne[n]];                         
                            } else {
                                d='';
                            } 
                        }
                        if (typeof o.columns[j].footer === 'object') {
                            if (o.columns[j].footer.c == 'sum') {
                                d = (d=='' ||d==null )?0:parseFloat(d);
                                o.tf[ix] = (typeof o.tf[ix] === 'undefined')?d:o.tf[ix]+d;
                                
                            }
                        }
                        if (typeof o.columns[j].header === 'object') {
                            if (typeof o.columns[j].header.align != 'undefined') {
                                cell.classList.add('text-'+o.columns[j].header.align);
                            }
                            if (o.columns[j].header.c == 'select') {
                                $('#t_vi').append('<option value="'+d+'"></option>');
                            }
                        }
                        if (typeof o.columns[j].style != 'undefined') {
                            if (typeof o.columns[j].style.condition != 'undefined') {
                                if (typeof o.columns[j].style.condition.minzero != 'undefined') {
                                    if (d < 0) {
                                        cell.classList.add(o.columns[j].style.condition.minzero);
                                    }
                                }
                            }
                            if (typeof o.columns[j].style.bg != 'undefined') {
                                cell.classList.add('bg-'+o.columns[j].style.bg);
                            }
                            if (typeof o.columns[j].style.color != 'undefined') {
                                cell.classList.add('text-'+o.columns[j].style.color);
                            }
                            
                        }
                        if (o.columns[j].render) {
                            d = await o.columns[j].render(r);
                            o.data[i][o.columns[j].data] = d;
                            if (o.src) {
                                window[o.src][i][o.columns[j].data] = d;
                            }
                        }

                        switch (o.columns[j].tipo) {
                            case 'btn':
                                cell.innerHTML = d +' '+btn;
                                break;
                            case 'list':
                                cell.innerHTML = data[o.columns[j].data][d];
                                break;
                            case 'money':
                                if (o.columns[j].chr) {
                                    if (d == '' || d == null) {
                                        cell.innerHTML = Intl.NumberFormat(r[o.columns[j].chr].gt4_locale, { style: 'currency', currency: r[o.columns[j].chr].gt4_sunat }).format(0);
                                    } else {
                                        cell.innerHTML = Intl.NumberFormat(r[o.columns[j].chr].gt4_locale, { style: 'currency', currency: r[o.columns[j].chr].gt4_sunat }).format(Math.ceil10(parseFloat(d),-2).toFixed(2));
                                    }
                                } else {
                                    if (d == '' || d == null) {
                                        cell.innerHTML = Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(0);
                                    } else {
                                        cell.innerHTML = Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.ceil10(parseFloat(d),-2).toFixed(2));
                                    }
                                }
                                break;
                            case 'int':
                                cell.innerHTML = parseInt(d);
                                break;
                            case 'float':
                                if (d == '' || d == null) {
                                    cell.innerHTML = (0).toFixed(2);
                                } else {
                                    cell.innerHTML = Math.ceil10(parseFloat(d),-2).toFixed(2);
                                }
                                break;
                            default:
                                cell.innerHTML = d;
                                break;
                        }
                    } 
                } 
                var te = (o.numerate)?'<td></td>':'';
                $(tfoot).children('tr').html(te);
                for (const k in o.columns) {
                    var ne = o.columns[k].data.split('.');
                    var ix = ne[ne.length-1];
                    var align = (typeof o.columns[k].header.align != 'undefined')?'text-'+o.columns[k].header.align:'';
                    if (typeof o.columns[k].footer === 'object') {
                        var mt = 0;
                        if (o.columns[k].tipo=='money') {
                            if (o.columns[k].chr) {
                                mt = Intl.NumberFormat(o.data[0][o.columns[k].chr].gt4_locale, { style: 'currency', currency: o.data[0][o.columns[k].chr].gt4_sunat }).format(Math.ceil10(o.tf[ix],-2).toFixed(2));
                            } else {
                                mt = Intl.NumberFormat('es-PE', { style: 'currency', currency: 'PEN' }).format(Math.ceil10(o.tf[ix],-2).toFixed(2));
                            }
                        } else {
                            mt = Math.ceil10(o.tf[ix],-2).toFixed(2);
                            
                        }
                        $(tfoot).children('tr').append('<td class="'+align+'">'+mt+'</td>'); 
                    } else {
                        var su = (typeof o.columns[k].footer === 'undefined')?'':o.columns[k].footer;
                        $(tfoot).children('tr').append('<td class="'+align+'">'+su+'</td>'); 
                    } 
                }  
            } else {
                $(tbody).html('<tr><td colspan="'+(numerate?o.columns.length+1:o.columns.length)+'" class="text-center">Ningún dato disponible en esta tabla =(</td></tr>');
                $(tfoot).children('tr').html('');
            }

            if (typeof o.cell != undefined) {
                if (o.cell) {
                    $(table[0].getElementsByTagName("td")).dblclick(function(){
                        $(this).html('<input type="text" value="'+$(this).text()+'" size="10" onChange="'+$(table).attr('id')+'.editCell('+0+',`'+o.columns[$(this).index()].data+'`,event)">')
                        //$(this).addClass('edit').siblings().removeClass('edit');  
                    })
                } else {
                    $(table).children('td').unbind();
                }
            }
        };
        var zise = function(){
            if (typeof o.rezise == 'undefined' ) {
                var w = 230;
                if (typeof o.export != 'undefined') {
                    w = (!o.export)?205:230;
                }
                if ((window.innerHeight-w)>table[0].offsetHeight) {
                    table[0].parentNode.style.height = (table[0].offsetHeight)+'px';
                }else{
                    table[0].parentNode.style.height = (window.innerHeight-w)+'px';
                }
            }
        };
        var textFilter = function(n){
            var id = $(n.srcElement).parent().index();
            var filter = n.srcElement.value.toUpperCase();
            var tr = table[0].getElementsByTagName("tr");
            var td,txtValue;
            for (i = 0; i < tr.length; i++) {
              td = tr[i].getElementsByTagName("td")[id];
              if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                  tr[i].style.display = "table-row";
                } else {
                    if ($(tr[i]).parent()[0].tagName=='TFOOT') {
                        tr[i].style.display = "table-row";
                    } else {
                        tr[i].style.display = "none";
                    }
                  
                }
              }
            }
            zise();
        };
        constructor.prototype = {
            clear: function(){
                if (typeof o.src != 'undefined') {
                    window[o.src] = {};
                    o.data = window[o.src];
                }
                if (typeof o.url != 'undefined') {
                    o.data = {};
                }
                $(tbody).html('<tr><td colspan="'+(numerate?o.columns.length+1:o.columns.length)+'" class="text-center">Ningún dato disponible en esta tabla =(</td></tr>');
                return true;
            },
            reload: async function(url=null){
                if (typeof o.src != 'undefined') {
                    o.data = window[o.src];
                }
                if (typeof o.url != 'undefined') {
                    var url = (url)?url:o.url;
                    o.data = await fetch(url)
                    .then(r => r.json())
                    .then(r => {return r})
                    .catch(e => swal("Atención","Error en el proceso: "+e, "error"))
                }
                await draw();
                listenTree();
                if (typeof o.select != undefined) {
                    if (o.select) {
                        $(table[0].getElementsByTagName("tr")).click(function(){
                            $(this).addClass('selected').siblings().removeClass('selected');  
                        })
                    } else {
                        $(table).children('tr').unbind();
                    }
                }
                if (typeof o.cell != undefined) {
                    if (o.cell) {
                        $(table[0].getElementsByTagName("td")).dblclick(function(){
                            $(this).html('<input type="text" value="'+$(this).text()+'" size="10" onChange="'+$(table).attr('id')+'.editCell('+0+',`'+o.columns[$(this).index()-1].data+'`,event)">')
                            //$(this).addClass('edit').siblings().removeClass('edit');  
                        })
                    } else {
                        $(table).children('td').unbind();
                    }
                }
                setTimeout(() => {
                    zise();
                }, 100);
                return true;
            },
            rezise: function(){
                zise();
                return true;
            },
            fullScreen: function(){
                table[0].parentNode.style.backgroundColor = 'white';
                table[0].parentNode.requestFullscreen()
            },
            select: function(v){
                o.select = v;
                if (o.select) {
                    $(table[0].getElementsByTagName("tr")).click(function(){
                        $(this).addClass('selected').siblings().removeClass('selected');  
                    })
                } else {
                    $(table).children('tr').unbind();
                }
            },
            getSelectedItem: function(){
                var id = $(tbody).children('tr.selected').attr('id');
                for (const i in o.data) {
                    if (o.data[i][o.thid] == id) {
                        return o.data[i];
                    }
                }
            },
            getSelectedId: function(){
                var id = $(tbody).children('tr.selected').attr('id');
                return id;
            },
            getData: function(){
                return o.data;
            },
            toExcel : function(){
                var formData = new FormData();
                let blob = new Blob([JSON.stringify(o)], {type: "application/json"});
                formData.append('objects',new File([blob],'data.json')); 
                fetch(base_url + '/Main/toExcel',{method: "POST",body: formData})
                .then(r => r.json())
                .then(r => {
                    window.location = base_url+'/Assets/excel/'+r.name;
                    target = "_blank";
                    done = 1;
                })
                .catch(e => swal("Atención","Error en el proceso: "+e, "error"))
            },
            editCell : async function(r,d,e){
                e.preventDefault();
                if (o.copyCellEditOrigin) {
                    window[o.src][r][d] = parseFloat(e.target.value);
                    o.copyCellEditOrigin();
                }
                await draw();
                zise();
                listenTree();
                if (typeof o.select != undefined) {
                    if (o.select) {
                        $(table[0].getElementsByTagName("tr")).click(function(){
                            $(this).addClass('selected').siblings().removeClass('selected');  
                        })
                    } else {
                        $(table).children('tr').unbind();
                    }
                }
                if (typeof o.cell != undefined) {   //parseInt($(this).parent().attr('id')) -> 0
                    if (o.cell) {
                        $(table[0].getElementsByTagName("td")).dblclick(function(){
                            $(this).html('<input type="text" value="'+$(this).text()+'" size="10" onChange="'+$(table).attr('id')+'.editCell('+0+',`'+o.columns[$(this).index()-1].data+'`,event)">')
                           // $(this).addClass('edit').siblings().removeClass('edit');  
                        })
                    } else {
                        $(table).children('td').unbind();
                    }
                }
                return true;
            },
            newRow: async function() {
                let r = {};
                for (const i in o.columns) {
                    let ne = o.columns[i].data.split('.');
                    let ix = null;
                    for (let n = 0; n < ne.length; n++) { 
                            ix[ne[n]] = '';                  
                    }
                    r[ne[0]] = ix;
                }
                let pin = 0;
                for (const i in window[o.src]) {
                    if (pin<=parseInt(i)) {
                        pin = parseInt(i)+1;
                    }
                }
                window[o.src][pin] = r;
                this.reload();
            },
            getTotales: function(){
                return o.tf;
            }
        }
        return new constructor();
    };
    $.fn.jsonTables = function(objects) { 
        var thead = $(this).children('thead');
        var tbody = $(this).children('tbody')[0];
        var numerate = objects.numerate;
        objects.data = window[objects.src];
        var constructor = function (o) {
            if (numerate) {
                $(thead).children('tr').prepend('<th>N°</th>');
            }
            draw(o);
        };
        var draw = function(o){
            $(tbody).html('');
            var num = 1;
            if (Object.keys(o.data).length>0) {
                for (const i in o.data) {
                    if (Object.hasOwnProperty.call(o.data, i)) {
                        const r = o.data[i];
                        var tr = tbody.insertRow(-1);
                        if (numerate) {
                            tr.insertCell(0).innerHTML = num;
                        }
                        for (const j in o.columns) {
                            if (Object.hasOwnProperty.call(o.columns, j)) {
                                const e = o.columns[j].data;
                                var cell = tr.insertCell(-1);
                                var ne = e.split('.');
                                var d = r;
                                for (let n = 0; n < ne.length; n++) {  
                                    d = d[ne[n]];
                                }
                                switch (o.columns[j].tipo) {
                                    case 'string':
                                        cell.innerHTML = d;
                                        break;
                                    case 'int':
                                        cell.innerHTML = parseInt(d);
                                        break;
                                    case 'float':
                                        cell.innerHTML = Math.ceil10(parseFloat(d),-2).toFixed(2);
                                        break;
                                    default:
                                        cell.innerHTML = d;
                                        break;
                                }
                                
                            }
                        } 
                        num+=1;
                    }
                }  
            } else {
                $(tbody).html('<tr><td colspan="'+(numerate?objects.columns.length+1:objects.columns.length)+'" class="text-center">Ningún dato disponible en esta tabla =(</td></tr>');
            }
        }
        constructor.prototype = {
            clear: function(){
                $(tbody).html('<tr><td colspan="'+(numerate?objects.columns.length+1:objects.columns.length)+'" class="text-center">Ningún dato disponible en esta tabla =(</td></tr>');
                return true;
            },
            reload: function(){
                objects.data = window[objects.src];
                draw(objects);
                return true;
            }
        }
        return new constructor(objects);
    };		
 })( jQuery );
 function listenTree(){
    var tree = document.querySelectorAll('table.tree tbody td:nth-child(2)');
    for (var i = 0; i < tree.length; i++) {
        tree[i].addEventListener('click', function (e) {
            var parent = e.target.parentElement;
            var classList = parent.classList;
            if (classList.contains("open")) {
                classList.remove('open');
                var opensubs = parent.querySelectorAll(':scope .open');
                for (var i = 0; i < opensubs.length; i++) {
                    opensubs[i].classList.remove('open');
                }
                var fr = document.querySelectorAll('table.tree tbody tr[tree|="'+parent.getAttribute('id')+'"]');
                for (var i = 0; i < fr.length; i++) {
                    fr[i].style.display = 'none';
                }
            } else {
                classList.add('open');
                var op = document.querySelectorAll('table.tree tbody tr[tree|="'+parent.getAttribute('id')+'"]');
                var mr = 10;
                var entry = parent.getAttribute('tree');
                while (document.querySelector('table.tree tbody tr[id|="'+entry+'"]')) {
                    entry = document.querySelector('table.tree tbody tr[id|="'+entry+'"]').getAttribute('tree');
                    mr += 10;
                }
                for (var i = 0; i < op.length; i++) {
                    op[i].style.display = 'table-row';
                    op[i].querySelector('td:nth-child(2)').style.paddingLeft = mr+'px';
                }
            }
            e.preventDefault();
        });
    }
}
function locationHref() {
  let href = location.pathname.split("/");
  var obj = { controller: href[2] };
  if (typeof href[3] !== "undefined") {
    obj.metodo = href[3];
  }
  if (typeof href[4] !== "undefined") {
    obj.parametro = href[4];
  }
  return obj;
}
function getTable(prefijo) {
    let table;
    for (const i in bd) {
        for (const j in bd[i]) {
            if (j===prefijo) {
                table = bd[i][j];
            }
        }
    }
    return table;
}

function btn(o={bg:'success',fn:'fn',id:1,title:'Registrar',icon:'fa-user-lock'}){
    return `<button class="btn btn-${o.bg} btn-sm" onClick="${o.fn}(${o.id})" title="${o.title}"><i class="fas ${o.icon}"></i></button>`; 
}

function gt4(mt,id=1) {
    let r = data.gt4.find(e => e.gt4_id == id);
    return Intl.NumberFormat(r.gt4_locale, { style: 'currency', currency: r.gt4_sunat }).format(Math.ceil10(mt,-2).toFixed(2))
}

