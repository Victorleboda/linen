function alert() {
  const alerts = document.querySelectorAll('.alert');
  if (alerts) {
    alerts.forEach(alert => {
      window.setTimeout( function() {
        alert.style.display = 'none'
      }, 4000);
    })
  }
}

export { alert }
