/*
 * A function that takes the name of the target div in parameter, shows it, and hides all other divs
*/
function divFocus( div_id ) {
	/* Defining the name that will determine that an element will be targeted by the function */
	var divName = 'section';
	/* Recovers all elements identified with the name defined above */
	var arrayOfDivs = document.getElementsByName(divName);
	var nbDivs = arrayOfDivs.length;
	if (nbDivs > 0) {
		/* For each element identified */
		for (var i=0; i < nbDivs; i++) {
			var thisElt = arrayOfDivs[i];
			/* If the current element is the one we want to focus on, show it ; other wise, hide it */
			if ( thisElt.id.indexOf(div_id) > -1 ) {
				thisElt.style.display = "block";
			} else {
				thisElt.style.display = "none";
			}
		}
	}
}
