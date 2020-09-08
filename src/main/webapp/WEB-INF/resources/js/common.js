/**
 * Author : isaac
 * Description : 공통 js 라이브러리
 * Date : 2020. 09. 05
 */

var validator = function(name, data, type,  length){

	var pass = true;
	switch ( type ){
		case 'text' :
			if ( data.length >= length ) {
				alert( name + '은 ' + length + '자까지만 입력할 수 있어요.' );
				pass = false;
			}

			if( data == '' || data.length == 0) {
				if ( name == '파일'){
					alert ( '파일을 업로드하세요.' );
					pass = false;
				}
				else {
					alert ( name + '을 입력하세요.');
					pass = false;
				}
			}
			break;
		case 'radio':
			if( data == '' || data.length == 0) {
				alert( name + '값을 체크해 주세요.')
				pass = false;
			}
			break;
	}

	return pass;
};