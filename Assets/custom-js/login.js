function Login(e) {
  e.preventDefault();

  const usuario = document.getElementById("txtUser");
  const password = document.getElementById("txtPass");
  if (usuario.value == "") {
    password.classList.remove("is-invalid");
    usuario.classList.add("is-invalid");
    usuario.focus();
  } else if (password.value == "") {
    usuario.classList.remove("is-invalid");
    password.classList.add("is-invalid");
  } else {
    const url = base_url + "Login/validar";
    const frm = document.getElementById("frmLogin");
    const http = new XMLHttpRequest();
    http.open("POST", url, true);
    http.send(new FormData(frm));
    http.onreadystatechange = function () {
      if (this.readyState == 4 && this.status == 200) {
        // console.log(this.responseText);
        const rpt = JSON.parse(this.responseText);
        if (rpt == "ok") {
          window.location = base_url + "Inicio";
        } else {
          //si el usuario o pass es incorrecta se ejecuta este codigo
          Swal.fire("error!", rpt, "error");
        }
      }
    };
  }
}
