document.addEventListener("DOMContentLoaded", function(event) { 
  document.getElementById("wrapper").scrollTop = document.getElementById("wrapper").scrollHeight;
});

var input = document.getElementById("body");
input.addEventListener("keyup", function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
    document.getElementById("sendbtn").click();
  }
});

function getToken() {
  const metas = document.getElementsByTagName('meta');

  for (let i = 0; i < metas.length; i++) {
    if (metas[i].getAttribute('name') === 'csrf-token') {
      return metas[i].getAttribute('content');
    }
  }

  return '';
}

function send(project_id){
	var xhr = new XMLHttpRequest();
	xhr.onload = function (e) {
	  if (xhr.readyState === 4) {
	    if (xhr.status === 200) {
	      var my_elem = document.getElementById('oldmessages');
				var span = document.createElement('div');
				    span.innerHTML = '<div class="col-md-6"></div>\
		<div class="col-md-6">\
			<div class="float-right" style="background-color: #25D366; padding: 10px; border-radius: 10px;">\
				<p style="margin-bottom: 0px;">'+ document.getElementById('body').value +'</p>\
				<p style="margin-bottom: 0px; font-size: 12px; text-align: right;">'+ document.getElementById('name').innerHTML +'</p>\
			</div>\
		</div>';
				    span.className = 'row';

				my_elem.parentNode.insertBefore(span, my_elem);

				document.getElementById('body').value = "";
				document.getElementById("wrapper").scrollTop = document.getElementById("wrapper").scrollHeight;
	    } else {
	      console.error(xhr.statusText);
	    }
	  }
	};
	xhr.onerror = function (e) {
	  console.error(xhr.statusText);
	};
	xhr.open("POST", "/projects/" + project_id + "/chat", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.setRequestHeader("X-CSRF-Token", getToken());
	xhr.send("body=" + document.getElementById('body').value + "&user=1");
}
