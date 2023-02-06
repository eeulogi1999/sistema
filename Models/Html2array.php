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
	static function getElemetByQuery($contents,$dt){
		$DOM = new DOMDocument;
		$DOM->loadHTML($contents);
		$xpath = new DomXPath($DOM);
		$items = $DOM->getElementsByTagName('main')->item(0);
		$rw = $xpath->query('div/div/div/div/span["'.$dt.'" = "instrument-price-last"]', $items);
		return $rw[0]->nodeValue;
	}
	static function getElemetByQueryExp($contents){
		$DOM = new DOMDocument;
		$DOM->loadHTML($contents);
		$xpath = new DomXPath($DOM);
		$items = $DOM->getElementsByTagName('article')->item(0);
		$rw = $xpath->query('div/ul/li', $items);
		return $rw[0]->childNodes[1]->data;
	}
}

?>