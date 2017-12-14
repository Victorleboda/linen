import Sortable from 'sortablejs' ;

function sortCard() {
  const cardContainer = document.getElementById('all_items');
  const sortable = Sortable.create(cardContainer);
}
export { sortCard }
