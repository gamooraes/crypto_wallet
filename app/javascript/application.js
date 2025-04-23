// Importações essenciais
import "@hotwired/turbo-rails"
import "controllers"

// Importação do Bootstrap
import { Tooltip, Popover } from "bootstrap"

// Inicialização dos componentes
document.addEventListener("turbo:load", () => {
    // Inicializa tooltips
    document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(el => {
        new Tooltip(el)
    })

    // Inicializa popovers
    document.querySelectorAll('[data-bs-toggle="popover"]').forEach(el => {
        new Popover(el)
    })
})