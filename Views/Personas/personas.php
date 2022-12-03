<?php 
    headerAdmin($data); 
    getModal('modalPersonas',$data);
?>
  <main class="app-content">    
      <div class="app-title">
        <div>
            <h1><i class="fas fa-user-tag"></i> <?= $data['page_title']; ?>
                
                <button class="btn btn-primary" type="button" onclick="openModalPersonas();" ><i class="fas fa-plus-circle"></i> Nueva Persona</button>

            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="<?= base_url(); ?>/personas"><?= $data['page_title'] ?></a></li>
        </ul>
      </div>
        <div class="row">
            <div class="col-md-12">
              <div class="tile">
                <div class="tile-body">
                  <div class="table-responsive">
                    <table class="table table-hover table-bordered" id="tablePersonas">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Identificación</th>
                          <th>Nombre</th>  
                          <th>Apellidos</th> 
                          <th>Celular</th>     
                          <th>Estado Civil</th>    
                          <th>Fecha de Nacimiento</th>          
                          <th>Acciones</th>
                        </tr>
                      </thead>
                      <tbody>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
        </div>
    </main>
<?php footerAdmin($data); ?>
    