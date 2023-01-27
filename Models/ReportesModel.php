<?php
class ReportesModel{
	private $x;
    function __construct($x){
		$this->x = $x;
    }
	public function selectCostoBie(int $bie_id, $f_inicio = null, $f_fin = null){
		$alm_id = $_SESSION['alm']['alm_id'];
		$where = '';
		if(empty($f_fin)){
			$where = "AND DATE_FORMAT(mov.mov_fechaE, '%Y-%m') = $f_inicio";
		}
		$sql = "SELECT mde.*,mov.mov_tipo AS mde_tipo
				FROM ( mdetalles AS mde
				LEFT JOIN movimientos AS mov ON mde.mde_mov_id = mov.mov_id)
				WHERE mov.mov_mstatus = 1 AND mde.mde_bie_id = $bie_id AND mov_tipo != 3 AND mov_tipo != 4 AND mov.mov_alm_id = '{$alm_id}' $where ORDER BY mov.mov_fechaE ASC,mov.mov_tipo DESC";

		$request = $this->x->select_all($sql);
		return $request;
	}
	public function selectCostosBien(string $periodo,int $mde_bie_id=0){
		$mov_alm_id = $_SESSION['alm']['alm_id'];
		$mde_bie_id = $mde_bie_id;
		$where='';
		if ($mde_bie_id != 0) {
			$where = 'mde.mde_bie_id = '.$mde_bie_id.' AND';
		}
		$sql = "SELECT mde.*
				FROM ( mdetalles AS mde
				LEFT JOIN movimientos AS mov ON mde.mde_mov_id = mov.mov_id)
				WHERE $where mov.mov_alm_id = $mov_alm_id AND mov_tipo != 3 AND mov_tipo != 4 AND  DATE_FORMAT(mov.mov_fechaE, '%Y-%m') = '{$periodo}' ORDER BY mov.mov_fechaE ASC, mov.mov_tipo DESC";
		$request = $this->x->select_all($sql);
		if (!empty($request)) {
			foreach ($request as $i => $mde) {
				$sql = "SELECT * FROM movimientos  WHERE  mov_id = ".$mde['mde_mov_id'];
				$request[$i]['mde_mov_id'] = $this->x->select($sql);
			}
		}
		return $request;
	}

	


}

?>