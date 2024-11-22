// Menu manipulation

function addToggleListener(selectedId, menuId, toggleClass) {
    let selectedElement = document.querySelector(`#${selectedId}`)
    selectedElement.addEventListener("click", function(event) {
        event.preventDefault()
        let menuItem = document.querySelector(`#${menuId}`);
        menuItem.classList.toggle(toggleClass);
    })
}

// Add toggle listeners to listen for clicks
document.addEventListener("turbo:load", function() {
    addToggleListener("hamburger", "navbar-menu", "collapse");
    addToggleListener("account", "dropdown-menu", "active");
})