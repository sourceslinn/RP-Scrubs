// --- Sistema interactivo del Carrito de Compras ---
let cart = [];

function addToCart(button) {
    const card = button.closest('.product-card');
    const name = card.getAttribute('data-name');
    const price = parseFloat(card.getAttribute('data-price'));
    
    const size = card.querySelector('.prod-size')?.value || '';
    const color = card.querySelector('.prod-color')?.value || '';
    const style = card.querySelector('.prod-style')?.value ? `(${card.querySelector('.prod-style').value})` : '';

    const itemDescription = `${name} ${style} - Talla: ${size} | Color/Diseño: ${color}`;
    
    cart.push({ desc: itemDescription, price: price });
    updateCartUI();
}

function updateCartUI() {
    const listContainer = document.getElementById('cart-items-list');
    const countContainer = document.getElementById('cart-count');
    const totalContainer = document.getElementById('cart-total-val');
    
    countContainer.innerText = cart.length;

    if (cart.length === 0) {
        listContainer.innerHTML = '<li style="text-align: center; color: gray; padding: 20px;">El carrito está vacío.</li>';
        totalContainer.innerText = '0.00';
        return;
    }

    listContainer.innerHTML = '';
    let total = 0;
    
    cart.forEach((item, index) => {
        total += item.price;
        const li = document.createElement('li');
        li.className = 'cart-item';
        li.innerHTML = `
            <span>${item.desc}</span>
            <strong>$${item.price}.00</strong>
        `;
        listContainer.appendChild(li);
    });

    totalContainer.innerText = total.toFixed(2);
}

// --- Acordeón interactivo para Preguntas Frecuentes ---
document.querySelectorAll('.faq-question').forEach(question => {
    question.addEventListener('click', () => {
        const item = question.parentElement;
        item.classList.toggle('active');
    });
});