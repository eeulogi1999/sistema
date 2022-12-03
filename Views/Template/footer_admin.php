   <footer class="fixed-bottom bg-<?= CID?> text-center text-white" >
      <div>© Copyright, Dev. Corp</div>
   </footer>
   <script>
        const base_url = "<?= base_url(); ?>";
        const smony = "<?= SMONEY; ?>";
        const base_images = "<?= images(); ?>";
        const bd = <?= json_encode($_SESSION['data_schemas'],true); ?>;
        const cid = '<?= CID ?>';
        const bg = <?= json_encode(BG); ?>;
        const t10_id = <?=(isset($_SESSION['com']['t10']))?$_SESSION['com']['t10']['t10_id']:0 ?>;
        const mov_tipo = <?=(isset($_SESSION['mov']['mov_tipo']))?$_SESSION['mov']['mov_tipo']:'00' ?>;
        const divLoading = document.querySelector("#divLoading");
        const data = <?= json_encode($data['page_data'],true); ?>;
    </script>
    <script src="<?= media(); ?>/js/plugins/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="<?= media(); ?>/js/plugins/jquery.dataTables.js"></script>
    <!-- Essential javascripts for application to work-->
    <script src="<?= media(); ?>/js/jquery-3.3.1.min.js"></script>
    <script src="<?= media(); ?>/js/popper.min.js"></script>
    <script src="<?= media(); ?>/js/bootstrap.min.js"></script>
    <script src="<?= media();?>/js/fontawesome.js"></script>
    <script src="<?= media(); ?>/js/plugins/pace.min.js"></script>
    <script src="<?= media(); ?>/js/plugins/sweetalert.min.js"></script>
    <script src="<?= media(); ?>/js/tinymce/tinymce.min.js"></script>
    <script src="<?= libraries()?>/fullcalendar-5.11.3/lib/main.js"></script>
    <script src="<?= libraries()?>/jQuery-contextMenu-master/dist/jquery.contextMenu.js"></script>
    <script src="<?= libraries()?>/jQuery-contextMenu-master/dist/jquery.ui.position.min.js"></script>
   
    <script src="<?= libraries()?>/webix-master/codebase/webix.js" type="text/javascript" charset="utf-8"></script>

    <script type="text/javascript" src="<?= media(); ?>/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<?= media(); ?>/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="<?= media(); ?>/js/plugins/bootstrap-select.min.js"></script>
    <script type="text/javascript" language="javascript" src="<?= media(); ?>/js/plugins/dataTables.buttons.min.js"></script>
    <script type="text/javascript" language="javascript" src="<?= media(); ?>/js/plugins/jszip.min.js"></script>
    <script type="text/javascript" language="javascript" src="<?= media(); ?>/js/plugins/pdfmake.min.js"></script>
    <script type="text/javascript" language="javascript" src="<?= media(); ?>/js/plugins/vfs_fonts.js"></script>
    <script type="text/javascript" language="javascript" src="<?= media(); ?>/js/plugins/buttons.html5.min.js"></script>
    <script src="<?= media(); ?>/js/plugins/highcharts.js"></script>
    <script src="<?= media(); ?>/js/plugins/exporting.js"></script>
    <script src="<?= media(); ?>/js/plugins/export-data.js"></script>
    <script src="<?= media();?>/js/datepicker/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<?= media();?>/js/functions_admin.js"></script>
    <script type="text/javascript" src="<?= media();?>/js/functions_main.js"></script>
    <?php foreach ($data['page_functions_js'] as $page) { ?>
    <script type="text/javascript" src="<?= media() ?>/js/<?= $page ?>"></script>
    <?php }  ?>
  </body>
</html>