L字のフィッティングを行う。  
以前の位置情報にオドメトリ情報を加え、前知識で各点がL字のそれぞれの直線に含まれうるかを判定する。  
そこから直線を2本引き、どれだけ直角に交わってなさそうでも、並行じゃない限りは交点を求める。  
この交点のローカル座標とグローバル座標の差が機体の移動分になる。  
最後に回転角を求める。データ点が多いほうの直線を基準にx軸の向きを見て、そこから回転角を求める。