function save( key, value ) {
	var ret;
	if( window.widget ) {
		widget.setPreferenceForKey(value, key);
	} else if( Modernizr.localstorage ) {
		localStorage[key] = value;
	} else {
		$.cookie(key, value, { expires: 365 });
	}
}

function load( key ) {
	if( window.widget ) {
		return widget.preferenceForKey(key);
	} else if( Modernizr.localstorage ) {
		return localStorage[key];
	} else {
		return $.cookie(key);
	}
}

function whatsThePulsarsPeriod( lastPeriod ) {
	var daysPerCycle = 29.5;
	var hoursPerCycle = daysPerCycle * 24;
	var minutesPerCycle = hoursPerCycle * 60;
	var secondsPerCycle = minutesPerCycle * 60;
	var millisPerCycle = secondsPerCycle * 1000;
	return lastPeriod + millisPerCycle;
}

function whatsOurEtaMrSulu( time ) {
	var now = wheresMyShipScotty(new Date()).getTime();
	var nanosTill = time - now;
	var secondsTill = nanosTill / 1000;
	var minutesTill = secondsTill / 60;
	var hoursTill = minutesTill / 60;
	var daysTill = hoursTill / 24;
	return daysTill;
}

function wheresMyShipScotty( d ) {
	d.setHours(0);
	d.setMinutes(0);
	d.setSeconds(0);
	d.setMilliseconds(0);
	return d;
}

function engageMrSulu() {
	var lastPeriod = load("lastPeriod");
	// Captain, this is illogical. - Spock
	$("#days").html(lastPeriod == null ? "?" : parseInt(whatsOurEtaMrSulu(whatsThePulsarsPeriod(parseInt(lastPeriod)))));
}

$("document").ready(function() {
	engageMrSulu();

	var tomorrow = new Date();
	tomorrow.setDate(tomorrow.getDate() + 1);
	setInterval(engageMrSulu, wheresMyShipScotty(tomorrow).getTime() - wheresMyShipScotty(new Date()).getTime());

	$("#dot").click(function() {
		save("lastPeriod", wheresMyShipScotty(new Date()).getTime());
		engageMrSulu();	
	});
});
