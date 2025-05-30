document.addEventListener("DOMContentLoaded", function() {
    const starsContainer = document.createElement("div");
    starsContainer.classList.add("stars");
    document.body.appendChild(starsContainer);
    
    for (let i = 0; i < 100; i++) {
        let star = document.createElement("span");
        let x = Math.random() * window.innerWidth;
        let y = Math.random() * window.innerHeight;
        let duration = Math.random() * 3 + 2;
        
        star.style.left = `${x}px`;
        star.style.top = `${y}px`;
        star.style.animationDuration = `${duration}s`;
        
        starsContainer.appendChild(star);
    }
    
    const url = new URL(window.location.href);
    const msg = url.searchParams.get('msg');
    if (msg === 'userFound') {
        const modal = document.getElementById('modal-notifica-envio-email');
        modal.style.display = 'block';
        
        document.getElementById('modal-notifica-envio-email-close').addEventListener('click', function() {
            modal.style.display = 'none';
        });
    }
});
