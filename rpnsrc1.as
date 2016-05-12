text0=0;
text1=0;
text2=0;
text3=0;
text4=0;
text5=0;
text6=0;
text7=0;
text8=0;
text9=0;
text10=0;
text11=0;
keta=0; //éüÇÃì¸óÕÇ™è¨êîì_ëÊâΩà Ç©Å@ÇΩÇæÇµÅA0ÇÕêÆêîì¸óÕíÜ
lkey=-1;
mkey=-1;
calced=0;
mode=0;
sto=0;
cmplxmd="real";
down="Å~";
keypad=keystr="1      2      3\n4      5      6\n7      8      9\nCR     0   ./md";
keystr2="sin   cos   tan\nln    log   1/x\nÅ„    y^x   +/-\nx<>y  RCL";
keystr3="asin  acos  atan\ne^x   10^x  //\n !    xÅ„y  lastx\n RÅ´  STO";
keystr4="sinh  cosh  tanh\nnCr   nPr   mod\ncmpx  2le   3le\nang   gcd";
keystr5="asinh acosh atanh\nÉ≥    Å®pol Å®rec\n!!    qeq   ceq\n RÅ™  lcm";
anglemode="degree";
anglemodev=1;
hyp=0;
lastx=0;
cmplx=0;

function c_acosh(z){
	var c;
	c =c_times(c_devide(c_pow(c_substract(z,[1,0]),[0.5,0]),c_pow(c_substract([1,0],z),[0.5,0])),c_acos(z));
	return c;
}

function c_asinh(z){
	var c;
	c =c_devide(c_asin(c_times([0,1],z)),[0,1]);
	return c;
}

function c_atanh(z){
	var c;
	c =c_devide(c_atan(c_times([0,1],z)),[0,1]);
	return c;
}

function displcm(){
	lastx=text0;
	temp=pop();
	text0=text0*temp/gcd(text0,temp);
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}


function dispgcd(){
	lastx=text0;
	temp=pop();
	text0=gcd(text0,temp);
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function gcd(a,b){
	if(b==0) return a;
	else return gcd(b,a%b);
}

function c_sinh(z){
	var c;
	c=c_times([0,-1],c_sin(c_times(z,[0,1])));
	return c;
}

function c_cosh(z){
	var c;
	c=c_cos(c_times(z,[0,1]));
	return c;
}

function c_tanh(z){
	var c;
	c=c_times([0,-1],c_tan(c_times(z,[0,1])));
	return c;
}

function c_atan(z){
	var c;
	c =c_times([0,0.5],c_log(c_devide(c_add([0,1],z),c_substract([0,1],z))));
	return c;
}

function c_asin(z){
	var c;
	c = c_times([0,-1],c_log(c_add(c_times([0,1],z),c_pow(c_substract([1,0],c_times(z,z)),[0.5,0]))));
	return c;
}

function c_acos(z){
	var c;
	c = c_times([0,-1],c_log(c_add(z,c_pow(c_add(c_times(z,z),[-1,0]),[0.5,0]))));
	return c;
}

function _cosh(x){
	return (Math.exp(x)+Math.exp(-x))/2;
}

function _sinh(x){
	return (Math.exp(x)-Math.exp(-x))/2;
}

function c_sin(z){
	var c=[0,0];
	c[0]=Math.sin(z[0])*_cosh(z[1]);
	c[1]=Math.cos(z[0])*_sinh(z[1]);
	return c;
}

function c_cos(z){
	var c=[0,0];
	c[0]=Math.cos(z[0])*_cosh(z[1]);
	c[1]=-Math.sin(z[0])*_sinh(z[1]);
	return c;	
}

function c_tan(z){
	return c_devide(c_sin(z),c_cos(z));
}

function c_log(a){
	var c=[0,0];
	c[0]=Math.log(Math.sqrt(a[0]*a[0]+a[1]*a[1]));
	c[1]=Math.atan2(a[1],a[0]);
	return c;
}

function chgcmplxmd(){
	if(cmplx==0){
		cmplxmd="complex";
		cmplx=1;
	}else{
		cmplxmd="real";
		cmplx=0;
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function c_add(a,b){
	var ans=[0,0];
	ans[0]=a[0]+b[0];
	ans[1]=a[1]+b[1];
	return ans;
}

function c_substract(a,b){
	var ans=[0,0];
	ans[0]=a[0]-b[0];
	ans[1]=a[1]-b[1];
	return ans;
}

function c_times(a,b){
	var ans=[0,0];
	ans[0]=a[0]*b[0]-a[1]*b[1];
	ans[1]=a[1]*b[0]+a[0]*b[1];
	return ans;
}

function c_devide(a,b){
	var ans=[0,0];
	var r2=b[0]*b[0]+b[1]*b[1];
	ans[0]=(a[0]*b[0]+a[1]*b[1])/r2;
	ans[1]=(a[1]*b[0]-a[0]*b[1])/r2;
	return ans;
}

function pole2rect(){
	var temp;
	lastx=text0;
	temp = text1;
	if(anglemodev==1){
		text0 = text0 * Math.PI / 180;
	}
	text1=temp*Math.cos(text0);
	text0=temp*Math.sin(text0);
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function rect2pole(){
	var temp;
	lastx=text0;
	temp = text1;
	text1=Math.sqrt(text0*text0+text1*text1);
	text0=Math.atan2(text0,temp);
	if(anglemodev==1){
		text0 = text0 * 180 / Math.PI;
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function mod(){
	var temp;
	lastx=text0;
	temp=pop();
	text0=text0%temp;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;

}


/*
function f(x){
	return Math.exp(-x*x/2)/Math.sqrt(2*Math.PI);
}

function phi_inte(x){
	var k,a,b,n,h,fo,fe,sum;
	a=-9;
	b=x;
	n = 50;
	h=(b-a)/(2.0*n);
	fo=0; fe=0;
	for(k=1;k<=2*n-3;k=k+2){
		fo=fo+f(a+h*k);
		fe=fe+f(a+h*(k+1));
	}
	sum=(f(a)+f(b)+4*(fo+f(b-h))+2*fe)*h/3;
	return sum;
}

function phi(x){

	var p;
	if(x<-8.4){
		p=0;
	}else if(x<0){
		p = phi_inte(x);
	}else if(x==0){
		p = 0.5;
	}else if(x<8.4){
		p=1-phi_inte(-x);
	}else {
	p= 1;
	}
	return p;
*/
function phi(z){
	var i;
	var z2, prev, p, t;

	z2 = z * z;
	t = p = z * Math.exp(-0.5 * z2) / Math.sqrt(2 * Math.PI);
	for (i = 3; i < 200; i += 2) {
		prev = p;  t *= z2 / i;  p += t;
		if (p == prev) return 0.5 + p;
	}
	return (z > 0)Å@? 1 : 0;
}

function phi_disp(){
	lastx=text0;
	text0=phi(text0);

	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function next(a,b,c,d,x)
{
    return (x-(a*x*x*x+b*x*x+c*x+d)/(3*a*x*x+2*b*x+c));
}

function ceq()
{
    var ans, ans1,i,flag;
	flag=1;
    ans=text0;
    ans1=next(text4,text3,text2,text1,ans);
    for (i=1;Math.abs(ans-ans1) > 0.0000000001;i++){
        if(i>100) {
			text0 = "NOT CVRG";
			flag=0;
			break;
		}
		ans1=ans;
        ans=next(text4,text3,text2,text1,ans1);
    }
    if(flag==1){
		text0=ans;
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}


function det2(a,b,c,d){
	return a*d-b*c;
}

function det3(a,b,c,d,e,f,g,h,i){
	return a*det2(e,f,h,i)-b*det2(d,f,g,i)+c*det2(d,e,g,h);
}

function s3eq(){
	var a,b,c,d,e,f,g,h,i,j,k,l,det0;
	l=text0;
	k=text1;
	j=text2;
	i=text3;
	h=text4;
	g=text5;
	f=text6;
	e=text7;
	d=text8;
	c=text9;
	b=text10;
	a=text11;
	det0=det3(a,b,c,e,f,g,i,j,k);
	if(det0==0){
		text0="ERROR";
	}else{
		text2=0;
		text3=0;
		text4=0;
		text5=0;
		text0=det3(d,b,c,h,f,g,l,j,k)/det0;
		text1=det3(a,d,c,e,h,g,i,l,k)/det0;
		text2=det3(a,b,d,e,f,h,i,j,l)/det0;
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function s2eq(){
	var a,b,c,d,e,f,det0;
	f=text0;
	e=text1;
	d=text2;
	c=text3;
	b=text4;
	a=text5;
	det0=det2(a,b,d,e);
	if(det0==0){
		text0="ERROR";
	}else{
		text2=0;
		text3=0;
		text4=0;
		text5=0;
		text0=det2(c,b,f,e)/det0;
		text1=det2(a,c,d,f)/det0;
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function qeq(){
	var a,b,c;
	a=text2;
	b=text1;
	c=text0;
	lastx=text0;
	pop();
	if(a==0){
		text0="ERROR";
	}else if(b*b-4*a*c<0){
		text3=-b/(2*a);
		text2=Math.sqrt(-(b*b-4*a*c))/(2*a);
		text1=-b/(2*a);
		text0=-Math.sqrt(-(b*b-4*a*c))/(2*a);
	}else{
		text2=0;
		text3=0;
		text1=(-b+Math.sqrt(b*b-4*a*c))/(2*a);
		text0=(-b-Math.sqrt(b*b-4*a*c))/(2*a);
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function parresist(){
	
	if(cmplx==0){
		lastx=text0;
		temp=pop();
		if(text0>=0&&temp>=0){
			text0=text0*temp/(text0+temp);
			}else{
			text0="ERROR";
		}
		change2mode0();
		calced = 1;
		lkey = -1;
		keta = 0;

	}else{
		var a=[0,0];
		var b=[0,0];
		var c;
		a[0]=text3;
		a[1]=text2;
		b[0]=text1;
		b[1]=text0;
		c = c_devide(c_times(a,b),c_add(a,b));
		pop();pop();
		text1=c[0];
		text0=c[1];
		change2mode0();
		calced = 1;
		lkey = -1;
		keta = 0;
	}
}

function nPr(){
	var p,temp,i;
	lastx=text0;
	temp=pop();
	if(text0>=temp&&temp>=0){
		p = 1;
		for(i=text0;i>text0-temp;i--){
			p = p * i;
		}
		text0=p;
	}else{
		text0="ERROR";
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;

}

function nCr(){
	var p,temp,i;
	lastx=text0;
	temp=pop();
	if(text0>=temp&&temp>=0){
		p = 1;
		for(i=1;i<=temp;i++){
			p = p * (text0 - i + 1)/i;
		}
		text0=p;
	}else{
		text0="ERROR";
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function dblfact(){
	var temp,i;
	lastx=text0;
	if(text0 > 0){
		temp=1;
		for(i=text0; i > 1; i -= 2){
			temp *= i;
		}
		text0 = temp;
	} else {
		text0="ERROR";
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function rcllastx(){
	if(calced != 0 || text0 != 0){
		push();
	}
	text0=lastx;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function y10x(){
	temp = pop();
	text0 *= Math.pow(10,temp);
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function dec2hms(){
	var h,m,s,sig;
	lastx = text0;
	sig=text0;
	if(sig<0) text0=-text0;
	h=Math.floor(text0);
	m=(text0-h)*60;
	s=(m-Math.floor(m))*60;
	text0=h+Math.floor(m)/100+s/10000;
	if(sig<0) text0=-text0;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function hms2dec(){
	var h,m,s,sig;
	lastx = text0;
	sig=text0;
	if(sig<0) text0=-text0;
	h=Math.floor(text0);
	m=Math.floor(text0*100-h*100);
	s=(text0*100-h*100-m)*100;
	text0=h+m/60+s/3600;
	if(sig<0) text0=-text0;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function delpercent(){
	lastx = text0;
	text0 = (text0-text1) / text1 * 100;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function percent(){
	lastx = text0;
	text0 = text1 * text0 / 100;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function deg2rad(){
	lastx = text0;
	text0 = text0 * Math.PI / 180;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function rad2deg(){
	lastx=text0;
	text0 = text0 * 180 / Math.PI;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function hypch(){
	if(hyp==0){
		hyp=1;
		if(mode==1){
			keypad=keystr4;
		}else {
			keypad=keystr5;
		}
	}else{
		hyp=0;
		if(mode==1){
			keypad=keystr2;
		}else {
			keypad=keystr3;
		}
	}
}

function asinh(){
	if(cmplx==0){
		lastx=text0;
		text0=Math.log(text0+Math.sqrt(text0*text0+1));
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_asinh(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function acosh(){
	if(cmplx==0){
		lastx=text0;
		text0=Math.log(text0+Math.sqrt(text0*text0-1));
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_acosh(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function atanh(){
	if(cmplx==0){
		lastx=text0;
		text0=Math.log((1+text0)/(1-text0))/2;
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_atanh(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function tanh(){
	if(cmplx==0){
		lastx=text0;
		text0=(Math.exp(text0)-Math.exp(-text0))/(Math.exp(text0)+Math.exp(-text0));
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_tanh(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;


}

function sinh(){	
	if(cmplx==0){
		lastx=text0;
		text0=(Math.exp(text0)-Math.exp(-text0))/2;
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_sinh(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function cosh(){
	if(cmplx==0){
		lastx=text0;
		text0=(Math.exp(text0)+Math.exp(-text0))/2;
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_cosh(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;

}

function neg(){
	text0 = -text0;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function anglemode1(){
	if(anglemodev==0){
		anglemode="degree";
		anglemodev=1;
	}else{
		anglemode="radian";
		anglemodev=0;
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}


function loggamma(x)  /* ÉKÉìÉ}ä÷êîÇÃëŒêî */
{
	

	var v, w;
	var B0 =  1;
	var B1 =  (-1.0 / 2.0);
	var B2 =  ( 1.0 / 6.0);
	var B4 =  (-1.0 / 30.0);
	var B6 =  ( 1.0 / 42.0);
	var B8 =  (-1.0 / 30.0);
	var B10 = ( 5.0 / 66.0);
	var B12 = (-691.0 / 2730.0);
	var B14 = ( 7.0 / 6.0);
	var B16 = (-3617.0 / 510.0);
	var N = 8;
	var LOG_2PI = 1.83787706640934548;
	v = 1;
	while (x < N) {  v *= x;  x++;  }
	w = 1 / (x * x);
	return ((((((((B16 / (16 * 15))  * w + (B14 / (14 * 13))) * w
	            + (B12 / (12 * 11))) * w + (B10 / (10 *  9))) * w
	            + (B8  / ( 8 *  7))) * w + (B6  / ( 6 *  5))) * w
	            + (B4  / ( 4 *  3))) * w + (B2  / ( 2 *  1))) / x
	            + 0.5 * LOG_2PI - Math.log(v) - x + (x - 0.5) * Math.log(x);
}

function gamma(x)  /* ÉKÉìÉ}ä÷êî */
{
	if (x < 0)
		return Math.PI / (Math.sin(Math.PI * x) * Math.exp(loggamma(1 - x)));
	return Math.exp(loggamma(x));
}


function fact(){
	lastx=text0;
	if(Math.floor(text0) == text0 && text0 >= 0){
		ans = 1;
		k = 1;
		for(k=1;k<=text0;k++){
			ans *= k;
		}
		text0 = ans;
	}else if(Math.floor(text0) == text0 && text0 <= -1){
		text0 = "ERROR";
	}else{
		text0 = gamma(text0+1);
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}


function log10(){
	lastx=text0;
	text0=Math.log(text0)/Math.log(10);
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function pow10(){
	lastx=text0;
	text0=Math.pow(10,text0);
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function root(){
	if(cmplx==0){
		lastx=text0;
		text0=Math.pow(text0,0.5);
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_pow(b,[0.5,0]);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;

}

function inv(){

	if(cmplx==0){
		lastx=text0;
		text0=1/text0;
		change2mode0();
		calced = 1;
		lkey = -1;
		keta = 0;
	}else{
		var a=[1,0];
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_devide(a,b);
		text1=c[0];
		text0=c[1];
		change2mode0();
		calced = 1;
		lkey = -1;
		keta = 0;	
	}
}

function e(){
	push();
	text0=Math.E;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function pi(){
	if(calced != 0 || text0 != 0){
		push();
	}
	text0=Math.PI;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function stor(){
	sto=text0;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function rcl(){
	if(calced != 0 || text0 != 0){
		push();
	}
	text0=sto;
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function exp(){
	if(cmplx==0){
		lastx=text0;
		text0=Math.exp(text0);
		change2mode0();
		calced = 1;
		lkey = -1;
		keta = 0;
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_exp(b);
		text1=c[0];
		text0=c[1];
		change2mode0();
		calced = 1;
		lkey = -1;
		keta = 0;
	}
}

function c_exp(a){
	var c = [0,0];
	c[0] = Math.exp(a[0])*Math.cos(a[1]);
	c[1] = Math.exp(a[0])*Math.sin(a[1]);
	return c;
}

function log(){
	if(cmplx==0){
		lastx=text0;
		text0=Math.log(text0);
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_log(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;

}

function c_pow(a,b){
	var ans;
	ans = c_exp(c_times(b,c_log(a)));
	return ans;
}

function pow(){
	if(cmplx==0){
		lastx=text0;
		temp = pop();
		text0=Math.pow(text0,temp);
	}else{
		var a=[0,0];
		var b=[0,0];
		var c;
		a[0]=text3;
		a[1]=text2;
		b[0]=text1;
		b[1]=text0;
		c = c_pow(a,b);
		pop();pop();
		text1=c[0];
		text0=c[1];
	}

	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function nroot(){
	lastx=text0;
	temp = pop();
	text0=Math.pow(text0,1/temp);
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function sin(){	
	if(cmplx==0){
	lastx=text0;
	if(anglemodev==1){
		text0 = text0 * Math.PI / 180;
	}
	text0=Math.sin(text0);
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_sin(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
	

}

function cos(){
	if(cmplx==0){
		lastx=text0;
		if(anglemodev==1){
			text0 = text0 * Math.PI / 180;
		}
		text0=Math.cos(text0);
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_cos(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function tan(){
	if(cmplx==0){
		lastx=text0;
		if(anglemodev==1){
			text0 = text0 * Math.PI / 180;
		}
		text0=Math.tan(text0);
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_tan(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function asin(){	
	if(cmplx==0){
		lastx=text0;
		text0=Math.asin(text0);
		if(anglemodev == 1){
			text0 = text0 * 180 / Math.PI;
		}
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_asin(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;

}

function acos(){	
	if(cmplx==0){
		lastx=text0;
		text0=Math.acos(text0);
		if(anglemodev == 1){
			text0 = text0 * 180 / Math.PI;
		}
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_acos(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;

}

function atan(){
	if(cmplx==0){
		lastx=text0;
		text0=Math.atan(text0);
		if(anglemodev == 1){
			text0 = text0 * 180 / Math.PI;
		}
	}else{
		var b=[0,0];
		var c;
		b[0]=text1;
		b[1]=text0;
		c = c_atan(b);
		text1=c[0];
		text0=c[1];
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;

}

function swap(){
	if(cmplx==0){
		temp = text1;
		text1 = text0;
		text0 = temp;
	}else{
		temp =text0;
		text0=text2;
		text2=temp;
		temp =text1;
		text1=text3;
		text3=temp;
	}
	change2mode0();
	calced = 1;
	lkey = -1;
	keta = 0;
}

function change2mode0(){
	mode = 0;
	keypad=keystr;
	hyp=0;
	down = "Å~";
	left = "Å{";
	up = "ÅÄ";
	right = "Å|";
	enter = "ENTER";
}

function changeMode(){
	if(mode == 0){
		mode = 1;
		keypad=keystr2;
		down = "hyp";
		left = "Å®deg";
		up = " Åì";
		right = "Å®hms";
		enter = "  EXP";
	}else if(mode == 1){
		mode = 2;
		left = "Å®rad";
		up = "É¢Åì";
		right = "hmsÅ®";
		enter = "   ÉŒ";
		if(hyp==0){
			keypad=keystr3;
		}else {
			keypad=keystr5;
		}
	}else{
		change2mode0();
		lkey = -1;
		keta = 0;
		calced = 1;
	}
}

function input(num){
	if(calced==1){
		if(mkey == 12&&lkey==10){
			text0=0.1*num;
			calced=0;
			keta=2;
		}else if(lkey == 12){
			text0=num;
			calced=0;		
		}else if(lkey==10){
			push();
			text0=0.1*num;
			calced=0;
			keta=2;
		}else{
			push();
			text0=num;
			calced=0;
		}
	}else{
		calced=0;
		if(keta == 0){
			if(text0 >= 0){
				text0 = text0*10+num;
			} else{
				text0 = text0*10-num;
			}
		}else{
			if(text0 >= 0){
				text0 = text0 + Math.pow(10,(-keta))*num;
			}else{
				text0 = text0 - Math.pow(10,(-keta))*num;
			}
			keta++;
		}
	}

}

function shosu(){
	if(keta==0){
		keta=1;
	}
}

function del(){
	if(calced == 1){
		text0 = 0;
		keta = 0;
		calced=0;
	}else{
		if(keta==0){
			text0 = Math.floor(text0/10);
		}else if(keta == 1){
			keta = 0;
		}else{
			text0 = Math.floor(text0*Math.pow(10,keta-2))/Math.pow(10,keta-2);
			keta--;
		}
	}
}

function push(){
	text11 = text10;
	text10 = text9;
	text9 = text8;
	text8 = text7;
	text7 = text6;
	text6 = text5;
	text5 = text4;
	text4 = text3;
	text3 = text2;
	text2 = text1;
	text1 = text0;
	calced=1;
	keta=0;
}

function pop(){
	temp = text0;
	text0 = text1;
	text1 = text2;
	text2 = text3;
	text3 = text4;
	text4 = text5;
	text5 = text6;
	text6 = text7;
	text7 = text8;
	text8 = text9;
	text9 = text10;
	text10 = text11;
	text11 = 0;
	calced=1;
	keta=0;
	return temp;
}

function add(){
	if(cmplx==0){
		lastx=text0;
		temp = pop();
		text0 = temp + text0;
	}else{
		var a=[0,0];
		var b=[0,0];
		var c;
		a[0]=text3;
		a[1]=text2;
		b[0]=text1;
		b[1]=text0;
		c = c_add(a,b);
		pop();pop();
		text1=c[0];
		text0=c[1];
	}
}

function times(){
	if(cmplx==0){
		lastx=text0;
		temp = pop();
		text0 = temp * text0;
	}else{
		var a=[0,0];
		var b=[0,0];
		var c;
		a[0]=text3;
		a[1]=text2;
		b[0]=text1;
		b[1]=text0;
		c = c_times(a,b);
		pop();pop();
		text1=c[0];
		text0=c[1];
	}
}

function substract(){
	if(cmplx==0){
		lastx=text0;
		temp = pop();
		text0 = text0 - temp;
	}else{
		var a=[0,0];
		var b=[0,0];
		var c;
		a[0]=text3;
		a[1]=text2;
		b[0]=text1;
		b[1]=text0;
		c = c_substract(a,b);
		pop();pop();
		text1=c[0];
		text0=c[1];
	}
}

function devide(){
	if(cmplx==0){
		lastx=text0;
		if(text0 == 0){
			text0 = "ERROR";
			calced=1;
			keta=0;
		} else{
			temp = pop();
			text0 = text0 / temp;
		}
	}else{
		if(text0==0&&text1==0){
			pop();
			text0="ERROR";
			calced=1;
			keta=0;
		} else{

			var a=[0,0];
			var b=[0,0];
			var c;
			a[0]=text3;
			a[1]=text2;
			b[0]=text1;
			b[1]=text0;
			c = c_devide(a,b);
			pop();pop();
			text1=c[0];
			text0=c[1];
		}
	}
}