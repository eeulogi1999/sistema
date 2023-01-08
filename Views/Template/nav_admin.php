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
        <?php  
        $nav_file = getModulos('gmo_gmo_id IS NULL');
        function nav_admin($nav,$n = null){
            foreach ($nav as $i => $v) {
                $tree = ''; 
                $path = BASE_URL.$v['gmo_path'];
                $num = ($n == null)?$v['gmo_id']:$n.'.'.$v['gmo_id'];
                $children = getModulos('gmo_gmo_id ='.$v['gmo_id']);
                if (!empty($children)) {
                    $tree = 'treeview';
                    $path = $v['gmo_path'];
                }
                $per = getPermisos($v['gmo_id']);
                if ((!empty($per))?$per['gtp_r']:false) {  ?>
                <li tree='<?=$num?>' class="<?=$tree?> pl-1">
                    <a class="app-menu__item" href="<?=$path?>">
                        <i class="app-menu__icon <?=$v['gmo_icon']?>" ></i>
                        <span class="app-menu__label"><?=$v['gmo_titulo']?></span>
                    </a>
                    <?php 
                    if (!empty($children)) { ?>
                        <ul>
                        <?php nav_admin($children,$num)?>
                        </ul>
                    <?php } ?>
                </li>
                <?php 
                }
            }
        }
        nav_admin($nav_file); ?>
    </ul>
</aside>

