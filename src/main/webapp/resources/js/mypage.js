const editProfile = document.querySelector(".edit-profile");

function onEditProfile(e) {
	e.preventDefault();
	const nickname = document.querySelector(".nickname");
	const statusMessage = document.querySelector(".status-message");
	
	nickname.readOnly = false;
	statusMessage.readOnly = false;
	
	const editSubmit = document.querySelector(".edit-submit");
	editSubmit.style.display = "block";
	editProfile.style.display = "none";
} 

editProfile.addEventListener("click", onEditProfile);