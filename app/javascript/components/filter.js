function filter() {
  const inputs = document.querySelectorAll('.form-stuff input');

  if (inputs){
    inputs.forEach(input => {
      input.addEventListener('change', () => {
          document.querySelector('.form-stuff input[type="submit"]').click()
      });
    });
  }
}
export { filter }
