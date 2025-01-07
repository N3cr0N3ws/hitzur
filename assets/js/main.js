document.addEventListener('DOMContentLoaded', () => {
    const container = document.querySelector('.card-container');
    let isDragging = false;
    let startX = 0;
    let scrollLeft = 0;
  
    container.addEventListener('mousedown', (e) => {
      isDragging = true;
      container.classList.add('dragging');
      container.classList.remove('smooth-scroll'); // Desactiva la suavidad durante el arrastre
      startX = e.pageX - container.offsetLeft;
      scrollLeft = container.scrollLeft;
    });
  
    container.addEventListener('mouseup', () => {
      isDragging = false;
      container.classList.remove('dragging');
      container.classList.add('smooth-scroll'); // Reactiva la suavidad después del arrastre
    });
  
    container.addEventListener('mouseleave', () => {
      isDragging = false;
      container.classList.remove('dragging');
    });
  
    container.addEventListener('mousemove', (e) => {
      if (!isDragging) return;
      e.preventDefault();
      const x = e.pageX - container.offsetLeft;
      const walk = (x - startX) * 0.5; // Ajusta el multiplicador
      container.scrollLeft = scrollLeft - walk;
    });
  });
  