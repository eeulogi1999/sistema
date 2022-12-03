<?php 
class Html2array{
	static function getdata($contents,$html=false){
		$DOM = new DOMDocument;
		$DOM->loadHTML($contents);
		$items = $DOM->getElementsByTagName('tr');
		$return = array();
		foreach ($items as $node) {
			$return[] = self::tdrows($node->childNodes,$html);
		}
		return $return;
	}

	static function tdrows($elements,$html){
		$str = array();
		foreach ($elements as $element) {
			if ($html) {
				$str[] = $element->ownerDocument->saveHTML($element);
			} else {
				$str[] = $element->nodeValue;
			}	
		}
		return $str;
	}
}

?>