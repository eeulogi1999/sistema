<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="<?= media();?>/images/avatar.png"
            alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><?= $_SESSION['gus']['gus_gpe_id']['gpe_nombre']; ?></p>
            <p class="app-sidebar__user-designation"><?= $_SESSION['gus']['gus_gro_id']['gro_nombrerol']; ?></p>
        </div>
    </div>
    <ul class="tree app-menu">
        <li tree='0' class="pl-1">
            <a class="app-menu__item" href="<?= base_url(); ?>/dashboard">
                <i class="app-menu__icon fa fa-dashboard" ></i>
                <span class="app-menu__label">DASHBOARD</span>
            </a>
        </li>
        <?php if(!empty($_SESSION['per'][0]['gtp_r']) && $_SESSION['per'][0]['gtp_r']>0){ ?>
        <li tree='1' class="treeview pl-1">
            <a class="app-menu__item" href="#" >
                <i class="app-menu__icon fas fa-users-cog" ></i>
                <span class="app-menu__label">ADMINISTRATIVO</span>
            </a>
            <ul>
                <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                <li tree='1.2'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/usuarios">
                        <i class="app-menu__icon fas fa-user-alt"></i>
                        <span class="app-menu__label">Usuarios</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                <li tree='1.3'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/roles">
                        <i class="app-menu__icon fas fa-portrait"></i>
                        <span class="app-menu__label">Roles</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                <li tree='1.4'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/empresas">
                        <i class="app-menu__icon fas fa-building" ></i>
                        <span class="app-menu__label">Empresas</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                <li tree='1.5'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/almacenes">
                        <i class="app-menu__icon fas fa-warehouse"></i>
                        <span class="app-menu__label">Almacenes</span>
                    </a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['per'][1]['gtp_r']) && $_SESSION['per'][1]['gtp_r']>0){ ?>
        <li tree='9' class="treeview pl-1">
            <a class="app-menu__item" href="#" >
                <i class="app-menu__icon fas fa-database" ></i>
                <span class="app-menu__label">RECURSOS</span>
            </a>
            <ul>
                <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                <li tree='9.1'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Agentes/clientes">
                        <i class="app-menu__icon fa fa-database" ></i>
                        <span class="app-menu__label">Clientes</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                <li tree='9.2'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Agentes/proveedores">
                        <i class="app-menu__icon fas fa-user-check" ></i>
                        <span class="app-menu__label">Proveedores</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
                <li tree='9.3'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Cuentas">
                        <i class="app-menu__icon fas fa-file-invoice-dollar" ></i>
                        <span class="app-menu__label">Cuentas</span>
                    </a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
        <li tree='2' class="treeview pl-1">
            <a class="app-menu__item" href="#" >
                <i class="app-menu__icon fas fa-boxes" ></i>
                <span class="app-menu__label">LOGISTICO</span>
            </a>
            <ul>
                <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                <li tree='2.3'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/bienes">
                        <i class="app-menu__icon fas fa-clipboard-list"></i>
                        <span class="app-menu__label">Bienes</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                <li tree='2.4'>
                    <a class="app-menu__item" href="#">
                        <i class="app-menu__icon fas fa-shopping-cart" ></i>
                        <span class="app-menu__label">Entradas</span>
                    </a>
                    <ul>
                        <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                        <li tree='2.4.1'>
                            <a class="app-menu__item" href="<?= base_url(); ?>/sbienes">
                                <i class="app-menu__icon fas fa-warehouse" ></i>
                                <span class="app-menu__label">Saldos Iniciales</span>
                            </a>
                        </li>
                        <?php } ?>
                        <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                        <li tree='2.4.2'>
                            <a class="app-menu__item" href="<?= base_url(); ?>/entradas">
                                <i class="app-menu__icon far fa-file-alt" ></i>
                                <span class="app-menu__label">Notas de Entrada</span>
                            </a>
                        </li>
                        <?php } ?>
                    </ul>
                </li>
                <li tree='2.5'>
                    <a class="app-menu__item" href="#">
                        <i class="app-menu__icon fas fa-cash-register" ></i>
                        <span class="app-menu__label">Salidas</span>
                    </a>
                    <ul>
                        <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                        <li tree='2.5.1'>
                            <a class="app-menu__item" href="<?= base_url(); ?>/salidas">
                                <i class="app-menu__icon far fa-file-alt" ></i>
                                <span class="app-menu__label">Notas de Salidas</span>
                            </a>
                        </li>
                        <?php } ?>
                        <?php if(!empty($_SESSION['per'][1]['gtp_r'])){ ?>
                        <li tree='2.5.2'>
                            <a class="app-menu__item" href="<?= base_url(); ?>/mermas">
                                <i class="app-menu__icon fas fa-pallet" ></i>
                                <span class="app-menu__label">Mermas</span>
                            </a>
                        </li>
                        <li tree='2.5.3'>
                            <a class="app-menu__item" href="<?= base_url(); ?>/transferencias">
                                <i class="app-menu__icon fas fa-dolly-flatbed" ></i>
                                <span class="app-menu__label">Transferencias</span>
                            </a>
                        </li>
                        <?php } ?>
                    </ul>
                </li>
                <li tree='2.6'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Bienes/sbienes">
                        <i class="app-menu__icon fas fa-warehouse" ></i>
                        <span class="app-menu__label">Saldos</span>
                    </a>
                </li>
                <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
                <li tree='9.3'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Gerencial/cventas">
                        <i class="app-menu__icon fas fa-chart-line" ></i>
                        <span class="app-menu__label">Ventas</span>
                    </a>
                </li>
                <?php } ?>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
        <li tree='3' class="treeview pl-1">
            <a class="app-menu__item" href="#" >
                <i class="app-menu__icon fas fa-landmark" ></i>
                <span class="app-menu__label">FINANCIERO</span>
                
            </a>
            <ul>
                <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
                <li tree='3.1'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Cuentas">
                        <i class="app-menu__icon fas fa-file-invoice-dollar" ></i>
                        <span class="app-menu__label">Cuentas</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
                <li tree='3.2'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Cajas/scuentas">
                        <i class="app-menu__icon fas fa-wallet" ></i>
                        <span class="app-menu__label">Saldo Inicial</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
                <li tree='3.3'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Cajas/ingresos">
                        <i class="app-menu__icon fas fa-hand-holding-usd" ></i>
                        <span class="app-menu__label">Ingresos</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
                <li tree='3.4'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Cajas/egresos">
                        <i class="app-menu__icon fas fa-receipt" ></i>
                        <span class="app-menu__label">Egresos</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
                <li tree='3.5'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Cajas/gastos">
                        <i class="app-menu__icon fas fa-stamp" ></i>
                        <span class="app-menu__label">Gastos</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
                <li tree='3.6'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Cajas/cinternos">
                        <i class="app-menu__icon fas fa-coins" ></i>
                        <span class="app-menu__label">Caja Internos</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][2]['gtp_r'])){ ?>
                <li tree='3.7'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Cajas/iadicionales">
                        <i class="app-menu__icon fas fa-donate" ></i>
                        <span class="app-menu__label">Ingresos Otros</span>
                    </a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
        <li tree='4' class="treeview pl-1">
            <a class="app-menu__item" href="#" >
                <i class="app-menu__icon fas fa-handshake" ></i>
                <span class="app-menu__label">LIQUIDEZ</span>
                
            </a>
            <ul>
                <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
                <li tree='4.1'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Liquidez/castigos">
                        <i class="app-menu__icon fas fa-file-invoice" ></i>
                        <span class="app-menu__label">Notas de Credito</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
                <li tree='4.2'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Liquidez/premios">
                        <i class="app-menu__icon fas fa-file-invoice" ></i>
                        <span class="app-menu__label">Notas de Debito</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
                <li tree='4.3'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/liquidez">
                        <i class="app-menu__icon fas fa-id-card-alt" ></i>
                        <span class="app-menu__label">Estado Actual</span>
                    </a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
        <li tree='5' class="treeview pl-1">
            <a class="app-menu__item" href="#" >
                <i class="app-menu__icon fas fa-chart-pie" ></i>
                <span class="app-menu__label">GERENCIAL</span>
            </a>
            <ul>
                <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
                <li tree='5.1'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/gerencial">
                        <i class="app-menu__icon fas fa-file-alt" ></i>
                        <span class="app-menu__label">Resumen Capital</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
                <li tree='5.2'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Gerencial/resultados">
                        <i class="app-menu__icon fas fa-file-alt" ></i>
                        <span class="app-menu__label">Estado de Resultados</span>
                    </a>
                </li>
                <?php } ?>
                <?php if(!empty($_SESSION['per'][3]['gtp_r'])){ ?>
                <li tree='5.3'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/Gerencial/facturacion">
                        <i class="app-menu__icon fas fa-file-alt" ></i>
                        <span class="app-menu__label">Volumen de Facturaciones</span>
                    </a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <?php if(!empty($_SESSION['per'][5]['gtp_r'])){ ?>
        <li tree='6' class="treeview pl-1">
            <a class="app-menu__item" href="#" >
                <i class="app-menu__icon fas fa-folder-open" ></i>
                <span class="app-menu__label">OTROS</span>
                
            </a>
            <ul>
                <?php if(!empty($_SESSION['per'][5]['gtp_r'])){ ?>
                <li tree='6.1'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/utilitarios">
                        <i class="app-menu__icon fas fa-lightbulb" ></i>
                        <span class="app-menu__label">Utilitarios</span>
                    </a>
                </li>
                <?php } ?>
            </ul>
        </li>
        <?php } ?>
        <li tree='7' class="treeview pl-1">
            <a class="app-menu__item" href="#" >
                <i class="app-menu__icon far fa-address-book" ></i>
                <span class="app-menu__label">RR.HH.</span>
            </a>
            <ul>
                <li tree='7.1'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/colaboradores">
                        <i class="app-menu__icon fas fa-address-book" ></i>
                        <span class="app-menu__label">Personales</span>
                    </a>
                </li>
                <li tree='7.2'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/asistencias">
                        <i class="app-menu__icon fas fa-check-circle" ></i>
                        <span class="app-menu__label">Asistencias</span>
                    </a>
                </li>
                <li tree='7.3'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/utilitarios">
                        <i class="app-menu__icon fas fa-ban" ></i>
                        <span class="app-menu__label">Ausencias</span>
                    </a>
                </li>
                <li tree='7.4'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/planillas">
                        <i class="app-menu__icon fas fa-calendar-check" ></i>
                        <span class="app-menu__label">Planillas</span>
                    </a>
                </li>
                <li tree='7.5'>
                    <a class="app-menu__item" href="<?= base_url(); ?>/ppagos">
                        <i class="app-menu__icon fas fa-money-bill-wave" ></i>
                        <span class="app-menu__label">Pagos Planillas</span>
                    </a>
                </li>
            </ul>
        </li>
        <li tree='8' class="pl-1">
            <a class="app-menu__item" href="<?= base_url(); ?>/logout">
                <i class="app-menu__icon fa fa-sign-out" ></i>
                <span class="app-menu__label">Salir</span>
            </a>
        </li>
    </ul>
</aside>