'use strict';

var fileUploadForm = document.querySelector('#fileUploadForm');
var fileUploadInput = document.querySelector('#fileUploadInput');
var fileUploadError = document.querySelector('#fileUploadError');
var fileUploadSuccess = document.querySelector(
    '#fileUploadSuccess');

function uploadFile(file) {
  var formData = new FormData();
  formData.append("file", file);

  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/file/upload");

  var noty = new Noty({
    theme: 'bootstrap-v3'
  });

  noty.setType('warning', true);
  noty.setText("Upload in progress...", true);
  noty.show();

  xhr.onload = function () {
    console.log(xhr.responseText);
    var response = JSON.parse(xhr.responseText);
    if (xhr.status == 200) {
      if (JSON.parse(xhr.responseText).status === false) {
        noty.setType('error', true);
        noty.setText(JSON.parse(xhr.responseText).result, true);
        noty.show();
        $("body").unmask();
      } else {
        fileUploadError.style.display = "none";
        fileUploadSuccess.innerHTML = "<p>"
            + "File uploaded successfully.</p>"
            + "<p>Download File : <a href='"
            + response.fileDownloadUri
            + "' target='_blank' rel='noopener noreferrer'>"
            + response.fileDownloadUri + "</a></p>";
        fileUploadSuccess.style.display = "block";
        noty.setType('success', true);
        noty.setText("File uploaded successfully", true);
        noty.show();
        $("body").unmask();
      }
    } else {
      fileUploadSuccess.style.display = "none";
      fileUploadError.innerHTML = (response && response.message)
          || "File upload failed with errors";
      noty.setType('error', true);
      noty.setText("File upload failed with errors", true);
      noty.show();
    }
  }

  xhr.send(formData);
}

fileUploadForm.addEventListener('submit', function (event) {
  var files = fileUploadInput.files;
  if (files.length === 0) {
    fileUploadError.innerHTML = "Please select a file";
    fileUploadError.style.display = "block";
  }
  uploadFile(files[0]);
  event.preventDefault();
}, true);

