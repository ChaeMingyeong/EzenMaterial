/**
 * 객체 만들기
 */
// 빈 객체의 선언
var calc = {};
// 멤버변수 추가
calc.x = 0;
calc.y = 0;
// 멤버함수 추가
calc.setValue = function(p1, p2) {
	this.x = p1;
	this.y = p2;
}

calc.plus = function() {
	return this.x + this.y;
}

calc.minus = function() {
	return this.x - this.y;
}

calc.result = function(){
	var value1 = this.plus();
	var value2 = this.minus();
	
	document.write("<p>덧셈결과: " + value1 + "</p>");
	document.write("<p>뺄셈결과: " + value2 + "</p>");

}