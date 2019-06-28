function editRequestStatus(request, status, name, project_id, role){
	var xhr = new XMLHttpRequest();
	xhr.onload = function (e) {
	  if (xhr.readyState === 4) {
	    if (xhr.status === 200 || xhr.status === 204) {
	    	if(status == 0){
	    		document.getElementById(request).remove();
	    		Swal.fire(
		      'Removed!',
		      'Request removed',
		      'success'
		    )
	    	} else {
		    	location.reload();
	    	}
	    } else {
	      console.error(xhr.statusText);
	    }
	  }
	};
	xhr.onerror = function (e) {
	  console.error(xhr.statusText);
	};

	xhr.open("POST", "/projects/" + project_id + "/editrequest", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.setRequestHeader("X-CSRF-Token", getToken());
	xhr.send("request=" + request + "&status=" + status);
}

function getToken() {
  const metas = document.getElementsByTagName('meta');

  for (let i = 0; i < metas.length; i++) {
    if (metas[i].getAttribute('name') === 'csrf-token') {
      return metas[i].getAttribute('content');
    }
  }

  return '';
}

function sendRequest(project_id){
	Swal.fire({
	  title: 'What role do you want to fill?',
	  input: 'text',
	  inputValue: "",
	  showCancelButton: true,
	  inputValidator: (value) => {
	    if (!value) {
	      return 'You need to write something'
	    } else {
	    	sendAsyncReq(value, project_id);
	    }
	  }
	})
}

function sendAsyncReq(role, project_id){
	var xhr = new XMLHttpRequest();
	xhr.onload = function (e) {
	  if (xhr.readyState === 4) {
	    if (xhr.status === 200 || xhr.status === 204) {
	    	showSuccess();
	    } else {
	      console.error(xhr.statusText);
	    }
	  }
	};
	xhr.onerror = function (e) {
	  console.error(xhr.statusText);
	};

	xhr.open("POST", "/projects/" + project_id + "/sendrequest", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.setRequestHeader("X-CSRF-Token", getToken());
	xhr.send("role=" + role);
}

function showSuccess(){
	Swal.fire(
	  'Sent!',
	  'Wait for the Team Leader to evaluate your request',
	  'success'
	)
}

function removeMember(project_id, member_id){
	Swal.fire({
  title: 'Are you sure?',
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#d33',
  cancelButtonColor: '#3085d6',
  confirmButtonText: 'Yes, remove!'
}).then((result) => {
  if (result.value) {
  	removeAsync(project_id, member_id);
  }
})
}

function removeAsync(project_id, member_id){
	var xhr = new XMLHttpRequest();
	xhr.onload = function (e) {
	  if (xhr.readyState === 4) {
	    if (xhr.status === 200 || xhr.status === 204) {
	    	document.getElementById("p." + member_id).remove();
	    	Swal.fire(
		      'Removed!',
		      'This member has been removed from the project.',
		      'success'
		    )
	    } else {
	      console.error(xhr.statusText);
	    }
	  }
	};
	xhr.onerror = function (e) {
	  console.error(xhr.statusText);
	};

	xhr.open("POST", "/projects/" + project_id + "/removemember", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.setRequestHeader("X-CSRF-Token", getToken());
	xhr.send("member_id=" + member_id);
}