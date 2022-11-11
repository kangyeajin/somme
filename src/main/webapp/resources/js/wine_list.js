
function init() {
	  for (var i = 0; i < div2.length; i++) {
	    div2[i].addEventListener("click", handleClick);
	  }
}

var div2 = document.getElementsByClassName("filter-item");
function handleClick(event) {
  console.log(event.target);
  console.log(event.target.classList);

  if (event.target.classList[2] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < div2.length; i++) {
      div2[i].classList.remove("clicked");
    }
    event.target.classList.add("clicked");
  }
}

init();

var all = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_list?kind=all",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var WHITE = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_list?kind=WHITE",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};
var RED = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_list?kind=RED",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var ROSE = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_list?kind=ROSE",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var SPARKLING = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_list?kind=SPARKLING",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var kindall = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_contry?kind=all",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var FRANCE = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_contry?kind=FRANCE",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var ITALY = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_contry?kind=ITALY",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var SPAIN = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_contry?kind=SPAIN",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var GERMANY = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_contry?kind=GERMANY",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var USA = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_contry?kind=USA",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var CHILE = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_contry?kind=CHILE",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};

var AUSTRALIA = function(url){
	$.ajax({
		type: 'GET',
		url: "/product/wine_contry?kind=AUSTRALIA",
		data: "",
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data) {
			$('#itemlist').html(data);
			console.log("넘어감");
		},
		error: function(request, status, error) {
			alert(error);
		}
	});
};