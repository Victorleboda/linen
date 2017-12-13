document.addEventListener('DOMContentLoaded', () => {
  const categoryChoice = document.querySelectorAll(".category-choice");
  categoryChoice.forEach(category => {
    category.addEventListener("click", (event) => {
      event.target.classList.toggle('active');
    })
  })
})
