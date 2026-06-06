(function(window) {
  window.env = window.env || {};
  // Environment variables
  window["env"].API_ENDPOINT = 'http://${API_ENDPOINT}:8080/api';
})(this);