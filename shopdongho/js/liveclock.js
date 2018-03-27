///////////////////////////////////////////////////////////
// "Live Clock Advanced" script - Version 1.0
// By Mark Plachetta (astroboy@zip.com.au)
//
// Get the latest version at:
// http://www.zip.com.au/~astroboy/liveclock/
//
// - Dynamic Drive (http://www.dynamicdrive.com)
// - Website Abstraction (http://www.wsabstract.com)

// ========================================================
// 
//  Hãy đặt id="LiveClockIE" vào thẻ cần hiển thị đồng hồ  
//
//  Hãy đặt hàm onLoad="show_clock()" vào thẻ <body>
//
// ========================================================

/////////////// CONFIGURATION /////////////////////////////

	// Set the clock's font face:
	//var myfont_face = "Verdana, Arial, Helvetica, sans-serif";

	// Set the clock's font size (px):
	//var myfont_size = "11";

	// Set the clock's font color:
	//var myfont_color = "#003366";
	
	// Set the clock's background color:
	//var myback_color = "#CCFF99";

	// Set the text to display before the clock:
	var mypre_text = "";
	
// Set the width of the clock (in pixels):
	//var mywidth = 300;

	// Display the time in 24 or 12 hour time?
	// 0 = 24, 1 = 12
	var my12_hour = 1;

	// How often do you want the clock updated?
	// 0 = Never, 1 = Every Second, 2 = Every Minute
	// If you pick 0 or 2, the seconds will not be displayed
	var myupdate = 1;

	// Display the date?
	// 0 = No, 1 = Yes
	var DisplayDate = 1;

/////////////// END CONFIGURATION /////////////////////////
///////////////////////////////////////////////////////////

// Browser detect code
        var ie4=document.all
        var ns4=document.layers
        var ns6=document.getElementById&&!document.all

// Global varibale definitions:

	var dn = "";
	var mn = "th";
	var old = "";

// The following arrays contain data which is used in the clock's
// date function. Feel free to change values for Days and Months
// if needed (if you wanted abbreviated names for example).
	var DaysOfWeek = new Array(7);
		DaysOfWeek[0] = "Chủ nhật";
		DaysOfWeek[1] = "Thứ 2";
		DaysOfWeek[2] = "Thứ 3";
		DaysOfWeek[3] = "Thứ 4";
		DaysOfWeek[4] = "Thứ 5";
		DaysOfWeek[5] = "Thứ 6";
		DaysOfWeek[6] = "Thứ 7";

	var MonthsOfYear = new Array(12);
		MonthsOfYear[0] = "1";
		MonthsOfYear[1] = "2";
		MonthsOfYear[2] = "3";
		MonthsOfYear[3] = "4";
		MonthsOfYear[4] = "5";
		MonthsOfYear[5] = "6";
		MonthsOfYear[6] = "7";
		MonthsOfYear[7] = "8";
		MonthsOfYear[8] = "9";
		MonthsOfYear[9] = "10";
		MonthsOfYear[10] = "11";
		MonthsOfYear[11] = "12";

// This array controls how often the clock is updated,
// based on your selection in the configuration.
	var ClockUpdate = new Array(3);
		ClockUpdate[0] = 0;
		ClockUpdate[1] = 1000;
		ClockUpdate[2] = 60000;

// For Version 4+ browsers, write the appropriate HTML to the
// page for the clock, otherwise, attempt to write a static
// date to the page.
/*	if (ie4||ns6) 
	{ 
		document.getElementById("ShowClock").innerHTML = '<span id="LiveClockIE"></span>'; 
	}
	else if (document.layers) 
	{ 
		document.write('<ilayer id="ClockPosNS" visibility="hide"><layer id="LiveClockNS"></layer></ilayer>'); 
	}
	else 
	{ 
		old = "true"; 
		show_clock(); 
	}
*/
// The main part of the script:
	function show_clock() 
	{
		if (old == "die") { return; }
	
		//show clock in NS 4
		if (ns4) document.ClockPosNS.visibility="show"
		
		// Get all our date variables:
		var Digital = new Date();
		var day = Digital.getDay();
		var mday = Digital.getDate();
		var month = Digital.getMonth();
		var hours = Digital.getHours();
		var yesrs = Digital.getFullYear()

		var minutes = Digital.getMinutes();
		var seconds = Digital.getSeconds();

		// Set up the hours for either 24 or 12 hour display:
		if (my12_hour) 
		{
			dn = "AM";
			if (hours > 12) { dn = "PM"; hours = hours - 12; }
			if (hours == 0) { hours = 12; }
		} 
		else { dn = ""; }
		if (minutes <= 9) { minutes = "0" + minutes; }
		if (seconds <= 9) { seconds = "0" + seconds; }

		// This is the actual HTML of the clock. If you're going to play around
		// with this, be careful to keep all your quotations in tact.
		myclock = '';
		//myclock += '<font style="color:' + myfont_color + '; font-family:' + myfont_face + '; font-size:' + myfont_size + 'pt;">';
		myclock += mypre_text;
		if (DisplayDate) { myclock += DaysOfWeek[day] + ', ngày ' + mday + ' tháng ' + MonthsOfYear[month] + ' năm ' + yesrs + ' | ';}
		myclock += hours + ':' + minutes;
		if ((myupdate < 2) || (myupdate == 0)) { myclock += ':' + seconds; }
		myclock += ' ' + dn;
		//myclock += '</font>';

		if (old == "true") {
			document.write(myclock);
			old = "die";
			return;
		}

		// Write the clock to the layer:
		if (ns4) {
			clockpos = document.ClockPosNS;
			liveclock = clockpos.document.LiveClockNS;
			liveclock.document.write(myclock);
			liveclock.document.close();
		} else if (ie4) {
			LiveClockIE.innerHTML = myclock;
		} else if (ns6){
			document.getElementById("LiveClockIE").innerHTML = myclock;
                }            

		if (myupdate != 0) { setTimeout("show_clock()",ClockUpdate[myupdate]); }
	} // End Function show_clock()
	
