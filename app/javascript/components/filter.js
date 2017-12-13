function filter() {
  console.log("I'm out filter")
  const inputs = document.querySelectorAll('.form-stuff input');

  if (inputs){
  console.log("I'm in filter")
    inputs.forEach(input => {
      input.addEventListener('change', () => {
        console.log("In the listener")
          document.querySelector('.form-stuff input[type="submit"]').click()
      });
    });
  }
}
export { filter }
